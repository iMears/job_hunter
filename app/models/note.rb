class Note < ActiveRecord::Base
  belongs_to :job

  validates :title, :text, presence: true
end
