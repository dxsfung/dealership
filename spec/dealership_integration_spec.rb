require('capybara/rspec')
  require('./app')
  Capybara.app = Sinatra::Application
  set(:show_exceptions, false)

  describe('Central Dealership Site', {:type => :feature}) do
    it('Add New Dealership') do
      visit('/')
      click_button('Add New Dealership')
      expect(page).to have_content('Add a dealership here')
    end
    it('returns triangle type') do
      visit('dealerships/new')
      fill_in("Dealership's name:", :with => "David's Toyota")
      click_button('Add Dealership')
      expect(page).to have_content('Information Added')
    end

  end
