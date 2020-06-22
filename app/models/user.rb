class User < ApplicationRecord
  belongs_to :role
  #before_create :set_default_role
  before_validation :set_default_role 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname, presence: true
  validates :lastname, presence: true

  def full_name
    return "#{firstname} #{lastname}" if firstname || lastname
    "Anonimo"
  end

  def admin?
    if role_id == 3
      return true
    end
    return false
  end
  
  private
  def set_default_role
    self.role ||= Role.find_by_name('inquilino')
  end
end
