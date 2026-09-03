$stdout.sync = true
$stderr.sync = true

require 'webrick'

port = (ARGV[0] || 8000).to_i
root = File.expand_path(File.dirname(__FILE__))

mime_types = WEBrick::HTTPUtils::DefaultMimeTypes.dup
mime_types['glb'] = 'model/gltf-binary'
mime_types['gltf'] = 'model/gltf+json'
mime_types['wasm'] = 'application/wasm'

begin
  server = WEBrick::HTTPServer.new(
    Port: port,
    DocumentRoot: root,
    MimeTypes: mime_types,
    Logger: WEBrick::Log.new($stdout),
    AccessLog: [[$stdout, WEBrick::AccessLog::COMBINED_LOG_FORMAT]]
  )
rescue Errno::EADDRINUSE
  port = 8080
  server = WEBrick::HTTPServer.new(
    Port: port,
    DocumentRoot: root,
    MimeTypes: mime_types,
    Logger: WEBrick::Log.new($stdout),
    AccessLog: [[$stdout, WEBrick::AccessLog::COMBINED_LOG_FORMAT]]
  )
end

trap('INT') { server.shutdown }

puts "\n======================================================="
puts "  🏢 Visor Inmobiliario 3D - Servidor de Desarrollo"
puts "======================================================="
puts "  URL Local:  http://localhost:#{port}"
puts "  Directorio: #{root}"
puts "  Presiona Ctrl + C para detener."
puts "=======================================================\n"

server.start
