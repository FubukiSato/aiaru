class PostController < ApplicationController
    before_action :authenticate_user!

    def new
        if Work.find_by(user_id: current_user.id).present?
            flash[:notice] = "申し訳ありません。アルバイトの登録は1アカウントにつき一つまでです。"
            redirect_to("/home")
        else
            @work = Work.new
        end
    end

    def create
        @work = Work.new(name: session[:name],occupation: session[:occupation],wage: session[:wage],hours: session[:hours],wage: session[:wage],hours: session[:hours],location: session[:location],period: session[:period],link: session[:link],note: session[:note])
        @work.user_id = current_user.id
        @work.image.retrieve_from_cache!(session[:image_cache_name])
        if @work.save
            flash[:notice] = "アルバイトの作成に成功しました"
            redirect_to("/home")
        else
            render 'new'
        end
    end

    def createconfirm
        @work = Work.new(work_params)
        session[:image_cache_name] = @work.image.cache_name
        session[:name] = params[:work][:name]
        session[:occupation] = params[:work][:occupation]
        session[:wage] = params[:work][:wage]
        session[:hours] = params[:work][:hours]
        session[:location] = params[:work][:location]
        session[:period] = params[:work][:period]
        session[:link] = params[:work][:link]
        session[:note] = params[:work][:note]
    end

    def edit
        if Work.find_by(user_id: current_user.id)
            @work = Work.find_by(user_id: current_user.id)
        else
            flash[:notice] = "まだアルバイトを登録していません"
            redirect_to("/home")
        end
    end

    def update
        @work = Work.find_by(user_id: current_user.id)
        @work.update(work_params)
        if @work.save
        flahs[:notice] = "アルバイトの内容を更新しました"
        redirect_to("/home")
        else
            render 'update'
        end
    end

    def deleteconfirm
        @work = Work.find_by(user_id: current_user.id)
    end

    def delete
        @work = Work.find_by(user_id: current_user.id)
        if @work.destroy
            flash[:notice] = "アルバイトの募集を削除しました"
            redirect_to("/home");
        else
            render 'deleteconfirm'
        end
    end

    private
        def work_params
            params.require(:work).permit(:image,:image_cache,:name,:occupation,:wage,:hours,:location,:period,:link,:note)
        end


end
