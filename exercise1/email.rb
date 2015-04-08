class Email
  def initialize(date, from, subject)
      @email_date=date
      @email_from=from
      @email_subject=subject
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

email = Email.new("Homework this week", "2014-12-01", "Ferdous")

puts "Date:    #{email.date}"
puts "From:    #{email.from}"
puts "Subject: #{email.subject}"