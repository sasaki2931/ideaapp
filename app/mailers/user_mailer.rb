class UserMailer < ApplicationMailer
    def send_ideas_email(ideas)
        @ideas = ideas
        mail(to: 'recipient@example.com', subject: 'アイデアの送信')
    end
end
