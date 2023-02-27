class UserMailer < ApplicationMailer
    def send_ideas_email(ideas)
        @ideas = ideas
        mail(to: 'sasaki2931@gmail.com', subject: '採用の通知')
    end
end
