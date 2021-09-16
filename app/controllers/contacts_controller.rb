class ContactsController < ApplicationController
    def new
        @contact = Contact.new
      end
    
      # 確認画面を作成する場合はこのような記述になるかと思います。
      # newアクションから入力内容を受け取り、
      # 送信ボタンを押されたらcreateアクションを実行します。
      def confirm
        @contact = Contact.new(contact_params)
        if @contact.invalid?
          flash.now[:alert] = "お問い合わせに失敗しました"
          render :new
        end
      end
    
      # 実際に送信するアクションになります。
      # ここで初めて入力内容を保存します。
      # セキュリティーのためにも一定時間で入力内容の削除を行ってもいいかもしれません。
      def create
        @contact = Contact.new(contact_params)
        if @contact.save
          ContactMailer.send_mail(@contact).deliver_now
          flash[:notice] = "お問い合わせが完了しました"
          redirect_to("/home")
        else
          flash.now[:alert] = "お問い合わせに失敗しました"
          render :new
        end
      end
    
      private
    
      def contact_params
        params.require(:contact).permit(:email,:name,:phone_number,:message)
      end
end
