class Job < ActiveRecord::Base
  belongs_to :user
  has_many :notes, dependent: :destroy

  validates :company, :position, :location, presence: true
end
