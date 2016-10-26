class Tournament < ApplicationRecord
  has_many :groups, dependent: :destroy

  after_initialize :set_default_attributes, if: :new_record?

  validates :no, presence: true,
    numericality: { only_integer: true },
    uniqueness: true

  validates :date, presence: true,
    inclusion: {
      in: Date.new(1990,1,1)...Date.new(Date.current.year + 2, 1, 1),
      message: I18n.t('activerecord.errors.messages.year_between', min: 1990, max: Date.current.year + 1)
    },
    format: {
      with: /(19|20)\d{2}/i,
      message: I18n.t('activerecord.errors.messages.four_digit_year')
    },
    uniqueness: true

  private

  def set_default_attributes
    self.date ||= Date.today.strftime('%Y-%m-%d')
  end
end
