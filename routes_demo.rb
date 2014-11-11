require 'sinatra'
require 'json'

$db_file_path = 'database/users.json'

# User class
class User
  def self.all_records
    file = File.read($db_file_path)
    file == '' ? [] : JSON.parse(file)
  end

  def self.find_record_by_id(id)
    records = all_records
    records.find { |record| record['id'] == id.to_i }
  end

  def self.create(attributes)
    records = all_records
    attributes = { 'id' => records.count + 1 }.merge(attributes)
    records.push(attributes)
    File.open($db_file_path, 'w') do |file|
      file.write(records.to_json)
      file.flush
    end
    attributes
  end
end

get '/' do
  '<h2>Welcome to profile checker</h2>'
end

get '/users' do
  @users = User.all_records
  erb :users
end

get '/users/new' do
  erb :create_form
end

get '/users/:id' do
  @user = User.find_record_by_id(params[:id]) || {}
  erb :user
end

post '/users' do
  @user = User.create(params)
  redirect "/users/#{@user['id']}"
end
