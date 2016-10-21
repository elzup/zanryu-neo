require 'mail'
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record,attribute,value)
    begin
      m = Mail::Address.new(value)
      r = m.domain!=nil && m.domain.match('ms\.dendai\.ac\.jp') && m.address == value
    rescue
      r = false
    end
    record.errors[attribute] << (options[:message] || 'is invalid.') unless r
  end
end