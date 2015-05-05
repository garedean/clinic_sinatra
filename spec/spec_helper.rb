require('rspec')
require('doctor')
require('patient')
require('specialty')
require('capybara')
require('pg')

DB = PG.connect(dbname: 'clinic_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM doctors;")
    DB.exec("DELETE FROM patients;")
    DB.exec("DELETE FROM specialties;")
  end
end
