class Event < ApplicationRecord
  include PgSearch
  belongs_to :group
end
