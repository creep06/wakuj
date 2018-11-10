class Problem < ApplicationRecord
	has_many :accepteds
	has_many :submissions
end
