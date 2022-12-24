# frozen_string_literal: true
#
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: '55577@pm.me',
            password: '557712',
            password_confirmation: '557712',
            name: 'Kira The Koala',
            role: User.roles[:admin])
User.create(email: '55577@protonmail.com', password: '557712', password_confirmation: '557712', name: 'Snow Leopard')

10.times do |x|
  post = Post.create(title: "Title #{x}", body: "Body #{x} Words go here Idk", user_id: User.first.id)

  5.times do |y|
    post.comments.create(body: "Comment #{y}", user_id: User.second.id)
  end
end
