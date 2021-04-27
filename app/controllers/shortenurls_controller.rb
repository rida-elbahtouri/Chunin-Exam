class ShortenurlsController < ApplicationController
    def new
        @shortenurl = Shortenurl.new
    end
    def create
        url =  params[:shortenurl][:originalUrl]
        @newurl = Shortenurl.new(originalUrl: url,shortUrl: generate_shorturl())
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