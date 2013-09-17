class Antibody < ActiveRecord::Base
	attr_reader :description
  attr_accessible :isotype, :product, :target, :vendor

  validates_presence_of :product
  validates_presence_of :target
  validates_presence_of :vendor
  validates_presence_of :isotype

  has_many :protocols, dependent: :destroy

  has_reputation :votes, source: :user, aggregated_by: :sum
end
