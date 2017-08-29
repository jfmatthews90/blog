class Post < ApplicationRecord
	# below validates that content exists in a post before allowing it to be submitted
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true
end
