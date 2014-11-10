class App
  def call(env)
    [200, { 'Content-type' => 'text/plain' }, ['Hello World']]
  end
end
