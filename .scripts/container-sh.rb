#!/usr/bin/env ruby

containers = `docker ps --format '{{.Names}}'`.lines.map(&:chomp)

exit 0 if containers.empty?

selection = IO.popen("sk", "r+") do |io|
  io.puts(containers)
  io.close_write
  io.read.chomp
end

exit 0 if selection.empty?

exec("docker", "exec", "-it", selection, "sh")
