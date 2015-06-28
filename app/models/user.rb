class User < ActiveRecord::Base
	authenticates_with_sorcery!

	validates :password, length: { minimum: 6 }
 	validates :password, confirmation: true
 	validates :password_confirmation, presence: true

 	validates :email, uniqueness: true

 	has_many :back_results
 	has_many :chest_results
 	has_many :legs_results

end
