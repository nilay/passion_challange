class Category < ApplicationRecord
  #associations
  belongs_to :vertical
  has_many :course
  #validation
  validates :name, presence: true, uniqueness: true
  #callbacks
  before_save :check_valid_name
  after_create :send_create_mail

  private

  #check if name exists in vetical
  def check_valid_name
    if Vertical.where(name: name).exists?
      errors.add(:name, 'is already taken By Vertical')
      throw(:abort)
    end
  end
  #send mail after create this should be added to queue as background process
  def send_create_mail
    EntityCreatedMailer.create_mail(self).deliver_now
  end

end
