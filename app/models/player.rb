class Player < ApplicationRecord
  has_and_belongs_to_many :teams
  has_many :goals

  validates_presence_of :fio

  after_initialize :set_default_attributes, if: :new_record?

  scope :fio_like, ->(fio) { where('lower(players.fio) LIKE ?', "%#{fio.downcase}%") }

  has_attached_file :avatar, styles: { thumb: "300x300>" }, default_url: "/images/default_avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  private

  def set_default_attributes
    self.graduation_year ||= Date.today.year
  end
end
