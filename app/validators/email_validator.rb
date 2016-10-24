require 'mail'
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    begin
      m = Mail::Address.new(value)
      # 学番メールと教員メールのみ, 研究室ドメインなどを省く
      mail_regex = '^[^.]*\.dendai\.ac\.jp'
      r = m.domain!=nil && m.domain.match(mail_regex) && m.address == value
    rescue
      r = false
    end
    record.errors[attribute] << (options[:message] || 'is invalid.') unless r
  end
end