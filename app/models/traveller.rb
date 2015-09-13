class Traveller < ActiveRecord::Base
    has_many :trips
    has_many :likes
    before_save { self.email = email.downcase } # Before saving to DB , email is converted to downcase
    validates :travellername, presence: true, length: { minimum: 3, maximum: 40 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 105 },
                                      uniqueness: { case_sensitive: false },
                                      format: { with: VALID_EMAIL_REGEX }
end