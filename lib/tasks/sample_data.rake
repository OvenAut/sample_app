require 'faker'

namespace :db do |variable|
  desc "Fill database with sapmle data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    User.create!(:name => "Exapmle User",
    :email => "example@railstutorial.org",
    :password => "foobar",
    :password_confiramtion => "foobar"   )
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(:name => name,
                  :email => email,
                  :password => password,
                  :password_confiramtion => password,  )
  end
  end
end