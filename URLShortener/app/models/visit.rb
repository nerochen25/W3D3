class Visit < ApplicationRecord
  
  validates :user_id, presence: true
  validates :short_url_id, presence: true 
  
  def self.record_visit!(user, shortened_url)
    Visit.new(user_id: user, short_url_id: shortened_url)  
  end 
  
  belongs_to :viewer,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User 
    
  belongs_to :link,
    primary_key: :id,
    foreign_key: :short_url_id, 
    class_name: :ShortenedUrl
    
end
