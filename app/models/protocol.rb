class Protocol < ActiveRecord::Base
  attr_accessible :blocking_buffer, :cell, :description, :detection, :gel,
  								:lysis_buffer, :membrane, :primary_description, :secondary_description,
  								:statement, :transfer, :washes

  validates :blocking_buffer, presence: true
  validates :cell, presence: true
  validates :description, presence: true
  validates :detection, presence: true
  validates :gel, presence: true
  validates :lysis_buffer, presence: true
  validates :membrane, presence: true
  validates :primary_description, presence: true
  validates :secondary_description, presence: true
  validates :statement, presence: true
  validates :transfer, presence: true
  validates :washes, presence: true

  belongs_to :user
  belongs_to :antibody

	# Ensures the presence of a user, and that a user matches with a given protocol
  validates :user_id, presence: true

  #Ensure the presence of an antibody, and that an antibody matches a given protocol
  #validates :antibody_id, presence: true
end
