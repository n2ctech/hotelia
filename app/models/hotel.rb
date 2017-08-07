class Hotel < ApplicationRecord
  belongs_to :location
  belongs_to :chain
  has_one :user

  attr_accessor :user_email, :user_password, :user_password_confirmation

  validates :name, presence: true
  validates :user_email, :user_password, :user_password_confirmation,
    presence: true, on: :create
  validates :user_password, confirmation: true
  validate :email_is_unique

  after_create :create_user

  private
  def create_user
    create_user! email: user_email, password: user_password,
      password_confirmation: user_password_confirmation
  end

  def email_is_unique
    if User.exists?(email: user_email)
      errors.add :user, 'Email is already in use.'
    end
  end
end
