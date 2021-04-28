class ShortenurlsController < ApplicationController
    
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
        @newurl = Shortenurl.new(originalUrl: url,shortUrl: shortUrl)
        if @newurl.save
            flash[:success] = "short url has been created"
        end
    end
   
    def goto
        @orurl = Shortenurl.find_by(shortUrl: params[:url])
        
        if @orurl
            redirect_to(URI.escape(@orurl.originalUrl))
        else
            #render 404
        end
    end
end