class Submission < ApplicationRecord
	has_many :results
	belongs_to :user
	belongs_to :problem

	validates :code, presence: true, length: {maximum: 5000}

end
