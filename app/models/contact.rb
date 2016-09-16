class Contact < ApplicationRecord
  include PgSearch
  belongs_to :list
  validates :email, presence: true, uniqueness: true
  multisearchable :against => [:list]


  pg_search_scope :search,
    :against => [:last_name, :first_name, :email, :phone, :company, :address1, :address2, :city, :state, :zip,:notes, :status, :interest, :title],
    :using => {:tsearch =>
      {:prefix => true, :negation => true, :dictionary => "english", :any_word => true  },
     }

end
