class Player < ApplicationRecord
  AVATAR_GEOMETRY = '300x300#'

  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h

  has_and_belongs_to_many :teams, -> { distinct }
  has_many :goals

  validates_presence_of :fio

  after_initialize :set_default_attributes, if: :new_record?
  after_update :reprocess_avatar, :if => :crop?

  scope :fio_like, ->(fio) { where('players.fio ~* ?', ".*#{fio}.*") }

  has_attached_file :avatar, styles: { thumb: AVATAR_GEOMETRY }, default_url: "/images/default_avatar.png", processors: [:crop]
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def crop?
    !crop_x.blank? && !crop_y.blank? && !crop_w.blank? && !crop_h.blank?
  end

  def geometry
    @geometry ||= Paperclip::Geometry.parse AVATAR_GEOMETRY
  end

  private

  def set_default_attributes
    self.graduation_year ||= Date.today.year
  end

  def reprocess_avatar
    avatar.reprocess!
  end
end
