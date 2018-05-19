class Song < ApplicationRecord
 	belongs_to :album
 	validates :author,:album,:name,:length, length: { minimum: 2 }
	validates :author,:album,:name,:length, presence: true
	validates :author,:album,:name, length: { maximum: 50 , too_long: "%{count} characters is the max allowed."}
	validates :length, format: { with: /[0-9][0-9]:[0-5][0-9]/, message: "Format is MM:SS - only digits."}
	#validates :length, numericality: { only_integer: true }
	  def self.search(term,page)
	    if term
	      where('name LIKE ?', "%#{term}%").paginate(page: page, per_page: 5).order('id DESC')
	    else
	      paginate(page: page, per_page: 10).order('id DESC')
	    end
	  end
end
