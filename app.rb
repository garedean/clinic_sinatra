require('sinatra')
require('sinatra/reloader')
require('./lib/doctor.rb')
require('./lib/patient.rb')
require('./lib/specialty.rb')
also_reload('lib/**/*.rb')
set(:show_exceptions, false)

get('/') do
  erb(:index)
end
