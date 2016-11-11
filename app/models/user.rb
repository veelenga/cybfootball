class User < ApplicationRecord
  enum role: [:visitor, :moderator, :admin]

  devise :database_authenticatable, :rememberable, :trackable, :timeoutable

  after_initialize :set_default_role, if: :new_record?

  validates_presence_of :login, :role
  validates_uniqueness_of :login
  validates_confirmation_of :password
  validates_length_of :password, in: 6..128

  def set_default_role
    self.role ||= :visitor
  end
end
