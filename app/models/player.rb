class Player < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :goals

  validates_presence_of :fio
end
