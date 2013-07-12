namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: 'Yuan', email: 'apexy2007@gmail.com', password: '123qwe', password_confirmation: '123qwe', admin: true)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@ror.org"
      password = 'qwe123'
      User.create!(name: name, email: email, password: password, password_confirmation: password)
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each do |user|
        user.microposts.create!(content: content)
      end
    end
  end
end
