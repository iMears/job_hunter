class Job < ActiveRecord::Base
  belongs_to :user
  has_many :notes

  validates :company, :position, :location, presence: true
end
