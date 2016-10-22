class Tournament < ApplicationRecord
  has_many :groups, dependent: :destroy

  after_initialize :set_default_attributes, if: :new_record?

  validates :no, presence: true,
    numericality: { only_integer: true },
    uniqueness: true

  validates :date, presence: true,
     inclusion: {
       in: Date.new(1990,1,1)...1.years.from_now.to_date,
       message: "should be from 1990 to " + 1.years.from_now.year.to_s + " year"
    },
     format: {
       with: /(19|20)\d{2}/i,
       message: "should be a four-digit year"
     },
     uniqueness: true

  private

  def set_default_attributes
    self.date ||= Date.today.strftime('%Y-%m-%d')
  end
end
