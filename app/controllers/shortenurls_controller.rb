class ShortenurlsController < ApplicationController
    def new
        @shortenurl = Shortenurl.new
    end
    def create
        url =  params.require(:shortenurl).permit(:originalUrl)
        @newurl = Shortenurl.new(originalUrl: url,shortUrl: generate_shorturl())
        if @newurl.save
            flash[:success] = "short url has been created"
        end
    end
   
    
end