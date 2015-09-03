class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user
  has_many :post_votes

  # def self.post_is_link
  #   if self.title
  # end

end
