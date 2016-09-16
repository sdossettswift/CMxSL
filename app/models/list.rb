class List < ApplicationRecord
  include PgSearch
  has_many :contacts
  # multisearchable :against => [:contact]

end
