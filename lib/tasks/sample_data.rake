require 'faker'

namespace :db do |variable|
  desc "Fill database with sapmle data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Exapmle User",
    :email => "example@railstutorial.org",
    :password => "foobar",
    :password_confiramtion => "foobar")
    admin.toggle!(:admin)
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(:name => name,
                  :email => email,
                  :password => password,
                  :password_confiramtion => password)
  end
  
  User.all(:limit => 6 ).each do |user|
    50.times do
      user.microposts.create!(:content => Faker::Lorem.sentence(5) )
    end
  end
  
  end
  
end