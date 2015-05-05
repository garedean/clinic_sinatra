require('capybara/rspec')
require('./app.rb')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

# describe('the clinic app', :type => :feature) do
#   describe('/doctors path') do
#     it('allows a doctor to be added') do
#       visit('/')
#       click_link('Add Doctor')
#       fill_in('first_name', with: "Bill")
#       fill_in('last_name', with: "Nye")
#       select('Brain Surgery', from: "specialty")
#       click_button('Submit')
#       expect(page).to(have_content("Bill Nye - Brain Surgery"))
#     end
#   end
# end
