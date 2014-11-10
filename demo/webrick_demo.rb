# WEBrick is a Ruby library providing simple HTTP web server services.
require 'webrick'

# To create a new WEBrick::HTTPServer that will listen to connections on
# port 8000 and serve documents from the current user’s 'files' folder
root_folder = File.expand_path './files'
server = WEBrick::HTTPServer.new Port: 8001, DocumentRoot: root_folder
trap('INT') { server.stop }
server.start
