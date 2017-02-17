class Page < ApplicationRecord
  validates_uniqueness_of :path
  validates_presence_of :path, :title, :content
end
