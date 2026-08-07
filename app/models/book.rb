class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
  validates :price, presence: true, numericality: true
end
