require('sinatra')
require('sinatra/reloader')
require('./lib/doctor.rb')
require('./lib/patient.rb')
require('./lib/specialty.rb')
also_reload('lib/**/*.rb')
require('pg')
require('pry')
# set(:show_exceptions, false)

DB = PG.connect(dbname: 'clinic')

get('/') do
  erb(:index)
end

get('/doctors/new') do

  erb(:doctor_new)
end

get('/doctors') do
  @doctors = Doctor.all()
  erb(:doctors)
end

post('/doctors') do
  first_name = params['first_name']
  last_name = params['last_name']
  doctor = Doctor.new(first_name: first_name, last_name: last_name, specialty_id: 1, id: nil)
  doctor.save()
  redirect to('/doctors')
end
