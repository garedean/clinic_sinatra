require('capybara/rspec')
require('./app.rb')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the clinic app', :type => :feature) do
  describe('/specialties path') do
    it('allows a specialty to be added') do
      visit('/specialties/new')
      fill_in('type', with: "Brain Surgury")
      click_button('Submit')
      expect(page).to(have_content("Brain Surgury"))
    end
  end

  describe('/specialties path') do
    it('allows specialties to be cleared') do
      specialty = Specialty.new(type: "Brain Surgery")
      specialty.save
      visit('/specialties')
      click_link('Reset')
      expect(page).not_to(have_content("Brain Surgery"))
    end
  end
end
