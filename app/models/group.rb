class Group < ApplicationRecord
  belongs_to :tournament
  has_many :matches

  validates_presence_of :name
end
