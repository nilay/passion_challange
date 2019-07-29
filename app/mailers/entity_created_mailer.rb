class EntityCreatedMailer < ApplicationMailer

  #mail output to file in tmp/mail
  def create_mail(entity)
    @entity = entity
    mail(to: 'reciever@example.com', subject: 'You have created an entity!!')
  end

end
