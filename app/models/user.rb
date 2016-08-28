class User < ActiveRecord::Base
  has_many :checklist_items, dependent: :destroy
  before_save { self.email = email.downcase }
  validates :name, presence: true
  validates :email, presence: true
end
