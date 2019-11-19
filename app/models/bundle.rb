class Bundle < ApplicationRecord
  belongs_to :product
  belongs_to :order
  has_many :customers, through: :order
end
