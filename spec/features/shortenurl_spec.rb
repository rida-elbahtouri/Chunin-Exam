require 'rails_helper'
RSpec.describe 'shortenurls_controller', type: :system do

  describe 'create a short Url' do
    it 'create url' do
        visit new_shortenurl_path
        fill_in('sortenurl_originalUrl', with: 'http://www.google.com')
      click_button('Create')
      expect(page).to have_content 'http://127.0.0.1:3000/'
    end

    it 'throw an error' do
        visit new_shortenurl_path
        fill_in('sortenurl_originalUrl', with: 'not a url')
      click_button('Create')
      expect(page).to have_content 'it seems that the Url is incorrect'
    end
  
  end
end