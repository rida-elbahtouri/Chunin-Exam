class ApplicationController < ActionController::Base
    def generate_shorturl
        rand(36**8).to_s(36)
    end
end
