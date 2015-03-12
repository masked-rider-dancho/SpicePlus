class InquiryMailer < ActionMailer::Base
  default from: "spice@spice-plus.yokohama"   # 送信元アドレス
  default to: "spice@spice-plus.yokohama"     # 送信先アドレス
  default bcc: "samuraimania.d@gmail.com"     # BCC


  def received_email(inquiry)
    @inquiry = inquiry
    @article = Article.find_by_id(inquiry.article_id)
    mail(:subject => 'お問い合わせを承りました')
  end

end
