class Group < ApplicationRecord
  include PgSearch
  has_many :events

end
