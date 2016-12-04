class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def unapplied(requests, admin)
    @requests = requests
    print(admin.email)
    mail to: admin.email, subject: '当日未処理通知'
  end
end
