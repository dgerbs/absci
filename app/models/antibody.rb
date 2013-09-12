class Antibody < ActiveRecord::Base
  attr_accessible :description, :product, :target, :vendor

  # validates :description, presence: true
  validates :product, presence: true
  validates :target, presence: true
  validates :vendor, presence: true

  has_many :protocols, dependent: :destroy

  has_reputation :votes, source: :user, aggregated_by: :sum
end
