require 'rails_helper'

RSpec.describe 'Groups index page', type: :feature do
  before(:each) do
    @user = User.create(name: 'atril', email: 'test@gmail.com', password: 'test123')
    @group1 = Group.create(name: 'my group 1st', icon: 'www.myicon/path/icon.png', user: @user)
    @group2 = Group.create(name: 'my group 2nd', icon: 'www.myicon/path/icon.png', user: @user)

    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'

    visit groups_path
  end

  it 'Displays the Log Out button' do
    expect(page).to have_content('Log out')
  end

  it 'Displays all categories all contents' do
    @user.groups.each do |group|
      expect(page).to have_content(group.name)
      expect(page).to have_content(group.entities.sum(:amount))
    end
  end

  it 'Displays the add new group button' do
    expect(page).to have_content('ADD A NEW GROUP')
  end

  it 'When I click to Add Pa new group button, it redirects me Add group Page.' do
    click_on 'ADD A NEW GROUP'
    expect(page).to have_current_path(new_group_path)
  end
end
