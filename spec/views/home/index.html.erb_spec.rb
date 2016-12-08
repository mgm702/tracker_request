require 'rails_helper'

RSpec.describe "home/index.html.erb", type: :view do
  include Capybara::DSL

  before do
    visit '/'
  end

  describe "When the user isn't logged in" do
    it 'show the user the sign in link' do
      expect(page).to have_content('Sign In')
    end
  end

  describe "When the user is logged in" do
    before do
      OmniAuthMock::User.new.current_user
    end

    it 'show the user the sign out link' do
      expect(page).to have_content('Sign Out')
    end
  end
end
