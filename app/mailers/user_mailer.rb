class UserMailer < ApplicationMailer
    default from: "ramarao.study@gmail.com"
    def welcome_email(user)
        @user = user
        @url  = 'http://example.com/login'
        mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
    
    def send_refer_email(customer,customer_refer_email)
        @customer=customer
        @customer_refer_email=customer_refer_email
        emails=customer_refer_email.refer_email.split(',')
        emails.each { |email|
            mail(to: email, subject: 'Vavarna')            
        }
    end
    def send_email(email)
        mail(to: email, subject: 'Vavarna')    
    end
end
