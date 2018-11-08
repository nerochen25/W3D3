# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint(8)        not null, primary key
#  long_url   :string           not null
#  short_url  :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#

class ShortenedUrl < ApplicationRecord
  validates :short_url, presence: true, uniqueness: true
  validates :long_url, presence: true
  validates :user_id, presence: true
  
  def self.random_code 
    while ShortenedUrl.exists?(:short_url => generated_url)
      generated_url = SecureRandom.urlsafe_base64
    end 
    generated_url
  end 
  
  def self.create!(user, long_url)
    ShortenedUrl.new(long_url: long_url, short_url: self.random_code, user_id: user)
  end 
  
  belongs_to :submitter,
    primary_key: :id, 
    foreign_key: :user_id,
    class_name: :User 
    
  has_many :visits, 
    primary_key: :id,
    foreign_key: :short_url_id,
    class_name: :Visit
    
  has_many :visitors,
    through: :visits, 
    source: :viewer
    

    
  
     
  
end
