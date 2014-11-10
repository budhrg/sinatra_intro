require 'erb'
require 'tilt'
template = Tilt.new('templates/home.html.erb')
puts template.render(self, name: 'Budhram Gurung', age: 27)
