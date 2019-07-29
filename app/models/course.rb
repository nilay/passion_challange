class Course < ApplicationRecord
  #associations
  belongs_to :category
  #validations
  validates :name, :state, :category_id, :author, presence: true
  validates :name , uniqueness: true
  #callbacks
  after_create :send_create_mail

  #send mail after create this should be added to queue as background process
  def send_create_mail
    EntityCreatedMailer.create_mail(self).deliver_now
  end

end
