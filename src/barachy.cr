require "./barachy/*"
require "http/client"
require "router"
require "option_parser"

module Barachy
  class ProfiledServer
    include Router

    def run
      path, port = "", ""

      OptionParser.parse! do |parser|
        parser.banner = "Usage: salute [arguments]"
        parser.on("-path", "--path=PATH", "Path to the db") { |upath| path = upath }
        parser.on("-port", "--port=PORT", "App Port") { |uport| port = uport }
      end
      rport = port ? port : 3000
      profile_handler = ProfileHandler.new
      route_handler = RouteHandler.new
      draw(route_handler) do
        File.open(path, "r") do |f|
          f.each_line do |line|
            dua = line.split(" ")
            limit, tourl, ctype = dua[1], dua[2], dua[3]
            url = dua[0].split(",")
            endres = ""
            get "/" + tourl, API.new { |context|
              (0...url.size).each do |i|
                start = Time.now
                response = HTTP::Client.get url[i] # realtime measure from this process :3
                length = (Time.now - start).milliseconds
                if length < limit.to_i && response.status_code != 404
                  endres = response.body
                  break
                end
              end
              context.response.content_type = ctype
              context.response.print endres
              context
            }
          end
        end
      end
      server = HTTP::Server.new(rport.to_i, [profile_handler, route_handler])
      server.listen
    end
  end

  profiled_server = ProfiledServer.new
  profiled_server.run
end
