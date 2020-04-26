require 'rails_helper'

RSpec.describe 'follows', type: :system do
  before do
    create(:user_2)
    user = create(:user_1)
    user.confirm
    sign_in user
  end

  scenario 'フォローできること' do
    visit user_path(2)
    click_on 'フォローする'
    change(Follow, :count).from(0).to(1)
    expect(page).to have_button 'フォロー中'
  end

  scenario 'フォロー解除できること' do
    Follow.create(following_id: 1, followed_id: 2)
    visit user_path(2)
    click_on 'フォロー中'
    change(Follow, :count).from(1).to(0)
    expect(page).to have_button 'フォローする'
  end

  scenario '自分のプロフィール画面にはフォローボタンが表示されないこと' do
    visit user_path(1)
    expect(page).to have_no_button 'フォローする'
  end
end
