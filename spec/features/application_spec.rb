require 'rails_helper'
RSpec.describe 'application_controller', type: :system do

  describe ApplicationController do
    it 'return a string with length of 8 ' do
    
        expect(subject.generate_shorturl.length).to eq(8)
        
    end  
  end
end