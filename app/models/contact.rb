class Contact < ApplicationRecord
  belongs_to :list
  validates :email, presence: true, uniqueness: true
end
