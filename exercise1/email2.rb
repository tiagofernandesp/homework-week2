class Email
  def initialize(subject, params)
      @email_date=params[:date]
      @email_from= params[:from]
      @email_subject= subject
   end
   def date
      return @email_date
    end
    def from
      return @email_from
    end
    def subject
      return @email_subject
    end
end

email = Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Ferdous" })

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"