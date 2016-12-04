class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def unapplied(requests, admin)
    @requests = requests
    print(admin.email)
    mail to: admin.email, subject: '当日未処理通知'
    mail to: 'guild0105@gmail.com', subject: '当日未処理通知'
  end

  def notice_unregisted(user, month)
    @user = user
    @month = month
    mail to: user.email, subject: '残留申請Neo来月未登録通知'
  end

end
