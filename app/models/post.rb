class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	# below validates that content exists in a post before allowing it to be submitted
	validates :title, presence: true, length: { minimum: 5 }
	validates :body, presence: true
end
