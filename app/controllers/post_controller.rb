class PostController < ApplicationController
    def new

    end

    def create
        @work = Work.new(image: params[:image],stname: params[:STName],occupation: params[:occupation],Salary: params[:Salary],OFhours: params[:OFhours],location: params[:location],treatment: params[:treatment],period: params[:period])
        @work.save
        image = params[:image]
        File.binwrite("public/ptj_images/#{@work.image}",image.read)
        redirect_to("/home")
    end
end
