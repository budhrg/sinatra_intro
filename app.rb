require 'sinatra'

get '/' do
  'Hello World'
end

# regular expression
get %r{/hello/([\w]+)} do |c|
  "Hello, #{c}!"
end
