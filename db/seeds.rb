# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

4.times do 
    Post.create do |post| 
        post.author = first_user
        post.title = Faker::Lorem.unique.sentence
        post.text = Faker::Lorem.paragraphs(number: 1)
    end
end

50.times do 
    Comment.create do |comment|
        comment.post = Post.all.sample 
        comment.author = second_user 
        comment.text = Faker::Lorem.unique.sentence
    end
end

