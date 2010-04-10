module ArMailerRails3
  # A delivery method implementation which sends via sendmail.
  # 
  # To use this, first find out where the sendmail binary is on your computer,
  # if you are on a mac or unix box, it is usually in /usr/sbin/sendmail, this will
  # be your sendmail location.
  # 
  #   Mail.defaults do
  #     delivery_method :sendmail
  #   end
  # 
  # Or if your sendmail binary is not at '/usr/sbin/sendmail'
  # 
  #   Mail.defaults do
  #     delivery_method :sendmail, :location => '/absolute/path/to/your/sendmail'
  #   end
  # 
  # Then just deliver the email as normal:
  # 
  #   Mail.deliver do
  #     to 'mikel@test.lindsaar.net'
  #     from 'ada@test.lindsaar.net'
  #     subject 'testing sendmail'
  #     body 'testing sendmail'
  #   end
  # 
  # Or by calling deliver on a Mail message
  # 
  #   mail = Mail.new do
  #     to 'mikel@test.lindsaar.net'
  #     from 'ada@test.lindsaar.net'
  #     subject 'testing sendmail'
  #     body 'testing sendmail'
  #   end
  # 
  #   mail.deliver!
  class ActiveRecord
    
    def initialize(options)
      self.email_class = options[:email_class] || Email
    end
    
    attr_accessor :email_class_name, :email_class
    
    def deliver!(mail)
      destinations = mail.destinations
      sender = mail.return_path || mail.sender || mail.from_addrs.first
      destinations.each do |destination|
        self.email_class.create :mail => mail.encoded, :to => destination, :from => sender
      end
    end
  end
end
