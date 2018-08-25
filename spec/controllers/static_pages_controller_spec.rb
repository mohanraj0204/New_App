require 'spec_helper'

RSpec.describe StaticPagesController do

  describe "GET 'home'" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
  end

  describe "GET 'help'" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/help'
      expect(page).to have_content('mohan')
    end
  end

end
