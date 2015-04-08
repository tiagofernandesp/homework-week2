class Email
  def initialize(subject, params)
      @email_date=params[:date]
      @email_from=params[:from]
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

class Mailbox
  def initialize(name,emails)
  		@mailbox_name=name
  		@mailbox_emails=emails
  end
  def name
      return @mailbox_name
  end
  def emails
      return @mailbox_emails
  end
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)

mailbox.emails.each do |email|
  puts "Date:    #{email.date}"
  puts "From:    #{email.from}"
  puts "Subject: #{email.subject}"
  puts
end