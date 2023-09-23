class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :entities

  validates :name, :icon, presence: true
  validates :icon, format: { with: %r{\Ahttps?://[^\s]+\z}, message: 'must be a valid URL' }
end
