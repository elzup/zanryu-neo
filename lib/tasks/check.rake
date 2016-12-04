namespace :check do
  desc '当日に未エクスポートの申請があるかチェック。ある場合はメールで通知'
  task :mail_unapplied_today => :environment do
    User.admin.each do |admin|
      @requests = admin.admin_requests.today.fresh.includes([:user, :room, :admin])
      if @requests.empty?
        next
      end
      ApplicationMailer.unapplied(@requests, admin).deliver
    end
  end

  desc '月末時点で来月の残留申請がないユーザにメールで通知'
  task :mail_notice_unregisted => :environment do
    User.students.each do |user|
      unless user.requests.next_month.empty?
        next
      end
      ApplicationMailer.notice_unregisted(user, Date.today.next_month.month).deliver
    end
  end
end
