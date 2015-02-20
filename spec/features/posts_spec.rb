require 'rails_helper'

describe 'User can CRUD posts' do

  scenario 'User can create a post' do
    visit '/'
    click_on "Create a Post"
    fill_in 'post[status]', with: "Hi there"
    fill_in 'post[user]', with: "Alexandra"
    fill_in 'post[number_of_likes]', with: 1
    click_on "Create Post"
    expect(page).to have_content("Hi there")
  end


  scenario 'User can view a show page for a post' do

    @post = Post.create(status: "Hi", user: "Me", number_of_likes: 2)
    visit "/posts/#{@post.id}"
    expect(page).to have_content("Hi")
  end


  scenario 'User can edit a post' do
    @post = Post.create(status: "Hi", user: "Me", number_of_likes: 2)
    visit "/posts/#{@post.id}"
    click_on "Edit your post"
    fill_in 'post[status]', with: "Ello"
    click_on("Update Post")
    expect(page).to have_content("Ello")

  end


  scenario 'User can delete a post' do
    @post = Post.create(status: "Hi", user: "Me", number_of_likes: 2)
    visit "/"
    expect(page).to have_content("Hi")
    click_on "Delete Post"
    expect(page).to have_content("You deleted a post")
  end

end
