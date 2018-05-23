class Band < ApplicationRecord
	has_many :albums
	validates :name, length:{ minimum: 2 }
	validates :name,:date_created,:photo, presence: true
	 def self.search(term,page)
	    if term
	      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 5).order('id DESC')
	    else
	      paginate(page: page, per_page: 10).order('id DESC')
	    end
	  end
end
