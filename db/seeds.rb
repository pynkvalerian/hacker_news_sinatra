module UsersImporter
  def self.import
    2.times do
      User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: 12345,
        age: [20,21,22,23].sample,
        country: Faker::Address.country
        )
    end
  end
end

module PostsImporter
  def self.import
    2.times do
      Post.create(
        title: ,
        description: ,
        user_id: [1,2].sample
        )
    end
  end
end

module CommentsImporter
  def self.import
    4.times do
      Comments.create(
        post_id: [1,2].sample,
        user_id: [1,2].sample,
        text: Faker::
        )
    end
  end
end