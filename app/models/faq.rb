class Faq < ApplicationRecord
  after_initialize :set_default_order, if: :new_record?
  validates_presence_of :question, :answer, :order

  def set_default_order
    self.order ||= 0
  end
end
