class Album < ApplicationRecord
	has_many :songs
    belongs_to :band
    validates :title, length: { minimum: 2 }
    
    def self.search(term,page)
	    if term
	      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 5).order('id DESC')
	    else
	      paginate(page: page, per_page: 10).order('id DESC')
	    end
	  end
	  
end
