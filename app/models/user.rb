class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_many :posts

  after_create :set_role
  after_update :set_account_type_role

  def set_role
    add_role :author
  end

  def set_account_type_role
    if self.is_stylist == true
      self.add_role :stylist
      self.remove_role :scrub
    elsif self.is_stylist == false
      self.add_role :scrub
      self.remove_role :stylist
    end
  end

  def can_create?
    self.has_role?(:admin) || self.has_role?(:author)
  end

  def can_update?(post)
    self.has_role?(:admin) || (self.has_role?(:author) && post.user == self)
  end

  def can_destroy?(post)
    self.has_role?(:admin) || self.has_role?(:moderator) || (self.has_role?(:author) && post.user == self)
  end
end
