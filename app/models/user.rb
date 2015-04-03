class User < ActiveRecord::Base
  before_save { self.email = email.downcase}

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :jobs, dependent: :destroy
  has_one :resume, dependent: :destroy

  validates_presence_of :first_name, :last_name, :password
  validates_confirmation_of :password

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 105 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }

  validates :first_name, presence: true
  validates :last_name, presence: true
end
