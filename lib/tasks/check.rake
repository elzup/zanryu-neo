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

end
