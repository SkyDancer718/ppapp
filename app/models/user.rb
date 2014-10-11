class User < ActiveRecord::Base
	has_many :likes, foreign_key: "hero_id", inverse_of: :likes
	has_many :likes, foreign_key: "victim_id", inverse_of: :likes
end
