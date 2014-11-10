# Middleware
require 'rack'

class ToUpper
  # Our class will be initialize with another Rack app
  def initialize(app)
    @app = app
  end

  def call(env)
    # First, call `@app`
    status, headers, body  = @app.call(env)

    # Iterate through the body, upcasing each chunk
    upcased_body = body.map { |chunk| chunk.upcase }

    # Pass our new body on through
    [status, headers, upcased_body]
  end
end

# This is the same Hello app from before, just without all the comments
class Hello
  def self.call(env)
    req = Rack::Request.new(env)
    body = case req.path
           when '/'
             'Welcome Home!!!'
           when /^\/name\/(.*)/
             "Welcome, #{$1}!!!"
           else
             return [404, { 'Content-Type' => 'text/plain' }, ['Not found']]
           end
    [200, { 'Content-Type' => 'text/plain' }, [body]]
  end
end
