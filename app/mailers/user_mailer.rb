class UserMailer < ApplicationMailer
    default from: "ramarao.study@gmail.com"
    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
    
    def send_refer_email(customer,customer_refer_email)
        puts "sending email to "
        puts @customer_refer_email.email
        @customer=customer
        @customer_refer_email=customer_refer_email
        mail(to: @customer_refer_email.email, subject: 'Vavarna')
    end
end
