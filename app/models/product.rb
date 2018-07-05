class Product
  include Mongoid::Document
  field :name, type: String
  field :price, type: BigDecimal

  attr_accessible :name, :price
  validates :name, presence: true
  validates :price, presence: true 
  embeds_many :reviews
end
