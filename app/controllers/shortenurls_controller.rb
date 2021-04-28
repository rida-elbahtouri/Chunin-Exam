class ShortenurlsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @urls = Shortenurl.all
    end
    def new
        @shortenurl = Shortenurl.new
    end
    def create
        url =  params[:shortenurl][:originalUrl]
        shortUrl = generate_shorturl()
        while Shortenurl.find_by(shortUrl: shortUrl) do
            shortUrl = generate_shorturl()
        end
        newurl = Shortenurl.new(originalUrl: url,shortUrl: shortUrl)
        if newurl.save
            render json: {shortUrl: shortUrl}
        end
    end
   
    def goto
        orurl = Shortenurl.find_by(shortUrl: params[:url])
        
        if orurl
            orurl.visits = orurl.visits + 1
            orurl.save
            redirect_to(URI.escape(orurl.originalUrl))
        else
            render "shortenurls/notfound"
        end
    end
end