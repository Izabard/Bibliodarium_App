# Create my user(joel)
User.create!(username: "User Joel",
	email: "joel@rails.com",
	password: "foobar",
	password_confirmation: "foobar")

# creating a lot of users    
99.times do |n|
    username = Faker::Name.name
    email = "example-#{n+1}@rails.org"
    password = "password"
    User.create!(username: username,
                 email: email,
                 password: password,
                 password_confirmation: password)
end

# Creating a lot of books for users
users = User.order(:created_at).take(6)
50.times do
    title = Faker::Book.title
    author = Faker::Book.author
    users.each { |user| user.books.create!(title: title, author: author) }

end


