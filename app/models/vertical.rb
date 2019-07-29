class Vertical < ApplicationRecord
  #associations
  has_many :category
  has_many :course, through: :category
  #validations
  validates :name, presence: true, uniqueness: true
  #callbacks
  before_save :check_valid_name
  after_create :send_create_mail

  private
  #check if name exists in category table
  def check_valid_name
    if Category.where(name: name).exists?
      errors.add(:name, 'is already taken By Category')
      throw(:abort)
    end
  end
  #send mail after create this should be added to queue as background process
  def send_create_mail
    EntityCreatedMailer.create_mail(self).deliver_now
  end
end
