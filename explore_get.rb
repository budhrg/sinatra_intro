def get(path)
  yield(path) if block_given?
end

get '/hello' do |path|
  puts "Hello, '#{path}'"
end
