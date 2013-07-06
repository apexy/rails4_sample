namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: 'Yuan', email: 'apexy@ror.org', password: 'foobar', password_confirmation: 'foobar', admin: true)
    99.times do |n|
      name = Faker::Name.name
      email = "example-#{n+1}@ror.org"
      password = 'qwe123'
      User.create!(name: name, email: email, password: password, password_confirmation: password)
    end
  end
end