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
  @specialties = Specialty.all
  erb(:doctor_new)
end

get('/doctors') do
  @doctors = Doctor.all()

  erb(:doctors)
end

post('/doctors') do
  first_name = params['first_name']
  last_name = params['last_name']
  specialty_id = params['specialty_id'].to_i
  doctor = Doctor.new(first_name: first_name,
                      last_name: last_name,
                      specialty_id: specialty_id,
                      id: nil)
  doctor.save()
  redirect to('/doctors')
end

get('/specialties/new') do
  @specialties = Specialty.all()
  erb(:specialties_new)
end

post('/specialties') do
  type = params['type']
  specialty = Specialty.new(type: type, id: nil)
  specialty.save()
  redirect to ('/specialties')
end

get('/specialties') do
  @specialties = Specialty.all()
  erb(:specialties)
end

get('/specialties/reset') do
    Specialty.clear()
    redirect to ('/specialties')
end
