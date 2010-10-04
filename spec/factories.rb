#By using the symbole ':user', we get factory Girl to simulate the User Model.
Factory.define :user do |user|
  user.name "Example User"
  user.email "user@example.net"
  user.password "foobar"
  user.password_confirmation "foobar"
end