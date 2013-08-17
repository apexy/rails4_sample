namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_microposts
    make_relationships
  end
end

def make_users
  admin = User.create!(name: 'Yuan', email: 'apexy2007@gmail.com', password: '123qwe', password_confirmation: '123qwe', admin: true)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@ror.org"
    password = 'qwe123'
    User.create!(name: name, email: email, password: password, password_confirmation: password)
  end
end

def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each do |user|
      user.microposts.create!(content: content)
    end
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers = users[3..40]
  followed_users.each do |followed|
    user.follow!(followed)
  end
  followers.each do |follower|
    follower.follow!(user)
  end
end
