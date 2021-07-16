class PostController < ApplicationController
    def new

    end

    def create
        redirect_to("home")
    end
end
