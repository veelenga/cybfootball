class Tournament < ApplicationRecord
  has_many :groups, dependent: :destroy

  validates :no, presence: true,
    numericality: { only_integer: true },
    uniqueness: true
end
