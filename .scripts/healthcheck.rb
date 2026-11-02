#!/usr/bin/env ruby

require "socket"

def main
  hostname = Socket.gethostname
  log("Starting health checks for #{hostname}", "info")

  case hostname
    when "orihime"
      check_docker([
        "blocky",
        "nginx-ui",
        "syncplay",
        "uptime-kuma",
        "portracker"
      ])
      check_wireguard("wg0")
      check_ufw
      check_certbot

    when "orochi"
      check_docker([
        "voicevox",
        "szurubooru-client",
        "szurubooru-server",
        "szurubooru-database",
        "searxng",
        "qbittorrent",
        "portracker",
        "navidrome",
        "miniserve",
        "libretranslate",
        "excalidraw",
        "bentopdf",
        "jitsi-web",
        "jitsi-prosody",
        "jitsi-jvb",
        "jitsi-jicofo",
        "jellyfin",
        "gluetun",
        "akochandaaaaa",
        "autotagger"
      ])
      check_vpn
      check_wireguard("wg0")
      check_disk
  end

  log("Health checks completed", "info")
end

def check_docker(expected_containers)
  log("Checking docker containers", "info")

  output = `docker ps --format "{{.Names}}"`

  if !$?.success?
    log("unable to query docker containers", "fail", output)
  end

  running_containers = output.lines.map(&:strip)

  expected_containers.each do |container|
    if running_containers.include?(container)
      log("#{container} is running", "pass")
    else
      log("#{container} is NOT running", "fail")
    end
  end
end

def check_vpn
  log("Checking VPN connection", "info")

  status = `docker exec gluetun wget -qO- http://127.0.0.1:8000/v1/vpn/status 2>&1`

  unless $?.success? && status.include?('"status":"running"')
    log("Gluetun VPN is NOT connected", "fail", status)
  end

  log("Gluetun VPN is connected", "pass")

  ip = `docker exec gluetun wget -qO- https://api.ipify.org 2>&1`.strip

  unless $?.success? && !ip.empty?
    log("unable to determine VPN external IP", "fail", ip)
  end

  log("VPN external IP: #{ip}", "pass")

  ip = `docker exec qbittorrent curl -s https://api.ipify.org 2>&1`.strip

  unless $?.success? && !ip.empty?
    log("unable to determine container VPN IP", "fail", ip)
  end

  log("Container VPN IP: #{ip}", "pass")
end

def check_wireguard(interface)
  log("Checking WireGuard interface #{interface}", "info")

  output = `wg show #{interface}`

  if !$?.success?
    log("unable to query WireGuard interface #{interface}", "fail", output)
  end

  if output.include?("interface: #{interface}")
    log("WireGuard interface #{interface} is active", "pass")
  else
    log("WireGuard interface #{interface} is NOT active", "fail", output)
  end
end

def check_ufw
  log("Checking UFW status", "info")

  output = `ufw status`

  if !$?.success?
    log("unable to query UFW status", "fail", output)
  end

  if output.include?("Status: active")
    log("UFW is active", "pass")
  else
    log("UFW is NOT active", "fail", output)
  end
end

def check_certbot
  log("Checking certbot renewal", "info")

  output = `certbot renew --dry-run 2>&1`

  if !$?.success?
    log("certbot dry-run renewal failed", "fail", output)
  end

  if output.include?("all simulated renewals succeeded")
    log("certbot dry-run renewal succeeded", "pass")
  else
    log("certbot dry-run renewal produced unexpected output", "fail", output)
  end
end

def check_disk
  log("Checking disk contents", "info")

  output = `docker exec qbittorrent find /mnt/storage/anime -mindepth 1 -maxdepth 1 | wc -l`

  if !$?.success?
    log("unable to query disk contents", "fail", output)
  end

  count = output.strip.to_i

  if count >= 500
    log("disk contains #{count} entries", "pass")
  else
    log("disk contains only #{count} entries", "fail")
  end
end

def log(message, level, output = nil)
  colors = {
    "info" => 34,
    "pass" => 32,
    "fail" => 31
  }

  puts "\e[#{colors[level]}m[#{level.upcase}]\e[0m #{message}"

  if level == "fail" && output
    puts output
    exit 1
  end
end

main
