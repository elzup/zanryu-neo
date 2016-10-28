require 'csv'

class Request < ApplicationRecord
  belongs_to :user
  belongs_to :admin, :class_name => 'User'
  belongs_to :room

  scope :month, -> (month) { where(date: month.at_beginning_of_month..month.at_end_of_month) }
  scope :current_month, -> { month(Time.now) }
  scope :next_month, -> { month(Time.now.next_month) }
  # 当日を含む未来のリクエスト
  scope :future, -> { where('date >= :date', date: Date.today) }
  # 未 export
  scope :fresh, -> { where(:exported => false) }
  scope :not_fresh, -> { where(:exported => true) }
  # deleted フラグ無し
  scope :live, -> { where(:deleted => false) }

  alias_attribute :exported?, :exported

  def self.to_csv(requests)
    headers = %w(No 残留日 残留者ユーザID 場所コード 建物コード 理由 その他 申請日 申請者ユーザID Ｒ更新者 Ｒ更新日付 Ｒ更新時刻)
    csv_data = CSV.generate(headers: headers, write_headers: true, force_quotes: true) do |csv|
      requests.each do |request|
        csv << [
            '',
            request.date.strftime('%Y/%m/%d'),
            request.user.student_id,
            request.room.code,
            request.room.building_code,
            '1',
            request.user.name,
            '',
            request.admin.admin_code,
            '',
            '',
            ''
        ]
      end
    end
    csv_data.encode(Encoding::SJIS)
  end

  # export 可能かどうか
  def active?
    !self.exported? && self.date >= Date.today
  end
end
