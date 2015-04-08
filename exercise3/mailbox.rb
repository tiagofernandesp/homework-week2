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

class MailboxTextFormatter
  def initialize(mailbox)
      @mailbox_name=mailbox.name
      @mailbox_emails=mailbox.emails
      @max_date = 0
      @max_from = 0
      @max_subject = 0

      @mailbox_emails.each do |email|
        @max_date=get_max(@max_date,email.date)
        @max_from=get_max(@max_from,email.from)
        @max_subject=get_max(@max_subject,email.subject) 
      end
  end
  def get_max(max,atribute)
      if atribute.length > max
        return atribute.length
      elsif atribute.length <= max
        return max
      end
  end

  def format()
    body=""

    div="+%s+%s+%s+\n" % ["-"*@max_date,"-"*@max_from,"-"*@max_subject]
    name_box="Mailbox: %s \n\n"% [@mailbox_name]
    top="|%#{@max_date}s|%#{@max_from}s|%#{@max_subject}s|\n" % [ "Date","From","Subject"]

    @mailbox_emails.each do |email|
      body+="|%#{@max_date}s|%#{@max_from}s|%#{@max_subject}s|\n" % [email.date,email.from,email.subject]
    end
    
    return "#{name_box}#{div}#{top}#{div}#{body}#{div}"
  end
end

emails = [
  Email.new("Homework this week", { :date => "2014-12-01", :from => "Ferdous" }),
  Email.new("Keep on coding! :)", { :date => "2014-12-01", :from => "Dajana" }),
  Email.new("Re: Homework this week", { :date => "2014-12-02", :from => "Ariane" })
]
mailbox = Mailbox.new("Ruby Study Group", emails)

formater=MailboxTextFormatter.new(mailbox)
puts formater.format