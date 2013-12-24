namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(email: email,
                   password: password,
                   password_confirmation: password,
                   name: name)
    end
  end
end

