class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def unapplied(requests, admin)
    @requests = requests
    print(admin.email)
    # mail to: admin.email, subject: "記事を投稿しました"
    mail to: 'guild0105@gmail.com', subject: '残留申請 Neo 未処理通知'
  end
end
