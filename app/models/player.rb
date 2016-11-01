class Player < ApplicationRecord
  include ModelExtensions::Avatar

  has_and_belongs_to_many :teams, -> { distinct }
  has_many :goals

  validates_presence_of :fio

  after_initialize :set_default_attributes, if: :new_record?

  scope :fio_like, ->(fio) { where('players.fio ~* ?', ".*#{fio}.*") }

  has_avatar styles: {thumb: '300x300#'}, default_url: "/images/default_avatar.png"

  private

  def set_default_attributes
    self.graduation_year ||= Date.today.year
  end
end
