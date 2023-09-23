class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :entities

  validates :icon, presence: true

  validates :name, presence: { message: 'Name must not be blank'}
  validates :icon, presence: { message: 'Name must not be blank'}
  validates :icon, format: { with: %r{\Ahttps?://[^\s]+\z}, message: 'must be a valid URL' }
end
