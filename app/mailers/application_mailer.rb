class ApplicationMailer < ActionMailer::Base
  # 测试时，mail.from 会取 <> 里面的内容，此处为 "depot@example.com"; default :from 做了剪切
  default from: 'Weiyan Chan <depot@example.com>'
  layout 'mailer'
end
