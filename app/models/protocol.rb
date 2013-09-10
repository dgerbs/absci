class Protocol < ActiveRecord::Base
  attr_accessible :blocking_buffer, :cell, :description, :detection, :gel,
  								:lysis_buffer, :membrane, :primary_description, :secondary_description,
  								:statement, :research_application, :transfer, :washes

  validates_presence_of :blocking_buffer
  validates_presence_of :cell
  validates_presence_of :description
  validates_presence_of :detection
  validates_presence_of :gel
  validates_presence_of :lysis_buffer
  validates_presence_of :membrane
  validates_presence_of :primary_description
  validates_presence_of :secondary_description
  validates_presence_of :research_application
  validates_presence_of :statement
  validates_presence_of :transfer
  validates_presence_of :washes

  belongs_to :user
  belongs_to :antibody

	# Ensures the presence of a user, and that a user matches with a given protocol
  validates :user_id, presence: true

  #Ensure the presence of an antibody, and that an antibody matches a given protocol
  #validates_presence_of :antibody_id, presence: true
end
