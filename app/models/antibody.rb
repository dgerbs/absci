class Antibody < ActiveRecord::Base
  attr_accessible :description, :product, :target, :vendor

  validates_presence_of :product
  validates_presence_of :target
  validates_presence_of :vendor

  has_many :protocols, dependent: :destroy

  has_reputation :votes, source: :user, aggregated_by: :sum
end
