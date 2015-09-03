class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  # def self.post_is_link
  #   if self.title
  # end

end
