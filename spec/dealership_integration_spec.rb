require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('Central Dealership Site', {:type => :feature}) do
    it('Jumps to Add a dealership page') do
      visit('/')
      click_button('Add New Dealership')
      expect(page).to have_content('Add a dealership here')
    end
    it('Adds New Dealership') do
      visit('dealerships/new')
      fill_in("Dealership's name:", :with => "David's Toyota")
      click_button('Add Dealership')
      expect(page).to have_content('Information Updated')
    end

  end
