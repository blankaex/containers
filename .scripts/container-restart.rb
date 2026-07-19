#!/usr/bin/env ruby

containers = `docker ps --format '{{.Names}}'`.lines.map!(&:chomp)

exit 0 if containers.empty?

selections = IO.popen("sk --multi", "r+") do |io|
  io.puts(containers)
  io.close_write
  io.read.lines.map!(&:chomp)
end

exit 0 if selections.empty?

exec("docker", "restart", *selections)
