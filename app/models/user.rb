class User < ApplicationRecord
  enum role: [:visitor, :moderator, :admin]

  devise :database_authenticatable,
    :recoverable, :rememberable, :trackable, :timeoutable

  after_initialize :set_default_role, if: :new_record?

  validates_presence_of :role

  def set_default_role
    self.role ||= :visitor
  end
end
