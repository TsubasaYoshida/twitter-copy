require 'rails_helper'

RSpec.describe 'tweets', type: :system do
  before do
    user = create(:user_1)
    user.confirm
    sign_in user

    create(:tweet, body: 'こんにちは。', user: user)
  end

  scenario 'ツイートを投稿したら、即反映されること' do
    visit root_path
    fill_in 'いまどうしてる？', with: 'おはようございます。'
    click_on 'ツイート'
    expect(page).to have_content 'おはようございます。'
  end

  scenario 'ツイートを削除したら、即反映されること' do
    visit root_path
    click_on '削除'
    expect(page).to have_no_content 'こんにちは。'
  end
end
