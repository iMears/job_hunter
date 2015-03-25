class Job < ActiveRecord::Base
  CATEGORIES = ['interested', 'applied', 'hot', 'cold', 'offer', 'rejected']

  belongs_to :user
  has_many :notes, dependent: :destroy

  validates :company, :position, :location, presence: true
end
