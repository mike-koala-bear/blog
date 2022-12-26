# frozen_string_literal: true

puts 'Seeding development database...'
hippo = User.first_or_create!(email: '55577@pm.me',
                              password: '557712',
                              password_confirmation: '557712',
                              first_name: 'Haverlie',
                              last_name: 'Hippo',
                              role: User.roles[:admin])

kira = User.first_or_create!(email: '55577@protonmail.com',
                             password: '557712',
                             password_confirmation: '557712',
                             first_name: 'Kira',
                             last_name: 'Koala')
Address.first_or_create!(street: '123 Main St',
                         city: 'Anytown',
                         state: 'CA',
                         zip: '12345',
                         country: 'USA',
                         user: hippo)
Address.first_or_create(street: '123 Main St',
                        city: 'Anytown',
                        state: 'CA',
                        zip: '12345',
                        country: 'USA',
                        user: kira)
category = Category.first_or_create!(name: 'Uncategorized', display_in_nav: true)
Category.first_or_create!(name: 'Cars', display_in_nav: false)
Category.first_or_create!(name: 'Bikes', display_in_nav: true)
Category.first_or_create!(name: 'Boats', display_in_nav: true)

elapsed = Benchmark.measure do
  posts = []
  10.times do |x|
    puts "Creating post #{x}"
    post = Post.new(title: "Title #{x}", body: "Body #{x} Words go here Idk", user: hippo, category: category)

    5.times do |y|
      puts "Creating comment #{y} for post #{x}"
      post.comments.build(body: "Comment #{y}", user: kira)
    end
    posts.push(post)
  end
  Post.import(posts, recursive: true)
end

puts "Seeded development DB in #{elapsed.real} seconds"
