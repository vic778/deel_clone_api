class User < ApplicationRecord
  validates :username, uniqueness: { case_sensitive: false }, presence: true, allow_blank: false,
                       format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password_confirmation, presence: true, on: :create

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  after_initialize :set_default_role
  belongs_to :role
  has_one :profile

  def requires_confirmation?
    !confirmed?
  end

  def update_role(role_name)
    self.role = Role.find_or_create_by(name: role_name)
    save
  end

  def generate_jwt
    JWT.encode({ id: id, exp: 2.days.from_now.to_i }, 'vicSecret')
  end

  private

  def set_default_role
    self.role ||= Role.find_by(name: 'user') if role.nil?
  end
end
