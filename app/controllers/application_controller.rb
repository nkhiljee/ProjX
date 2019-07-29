class ApplicationController < ActionController::Base

    def index
        erb :'views/index.html'
    end
end
