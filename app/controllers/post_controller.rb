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
        @work = Work.new(work_params)
        @work.user_id = current_user.id
        if @work.save
            flash[:notice] = "アルバイトの作成に成功しました"
            redirect_to("/home")
        else
            render 'new'
        end
        
    end

    def createconfirm
        @work = Work.new(work_params)
        @work.save
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
            params.require(:work).permit(:image,:name,:occupation,:wage,:hours,:location,:period,:link,:note)
        end


end
