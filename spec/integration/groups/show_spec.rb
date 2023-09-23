require 'rails_helper'

RSpec.describe 'Groups #Show page', type: :feature do
  before(:each) do
    @user = User.create(name: 'atril', email: 'test@gmail.com', password: 'test123')
    @group = Group.create(name: 'my group 1st', icon: 'www.myicon/path/icon.png', user: @user)
    @entity1 = Entity.create(name: 'my cash tracker 1st', amount: 1003.20, group_id: @group.id,
                             user_id: @user.id)
    @entity2 = Entity.create(name: 'my cash tracker 2nd', amount: 100.20, group_id: @group.id,
                             user_id: @user.id)

    visit new_user_session_path
    fill_in 'user[email]', with: @user.email
    fill_in 'user[password]', with: @user.password
    click_button 'Log in'

    visit group_path(@group)
  end

  it 'Displays the groups title' do
    expect(page).to have_content('Groups')
  end

  it 'Displays all the group contents' do
    @group.entities.each do |entity|
      expect(page).to have_content(entity.name)
      expect(page).to have_content(entity.amount)
    end
  end

  it 'Displays scan buttin' do
    expect(page).to have_content('SCAN')
  end
end
