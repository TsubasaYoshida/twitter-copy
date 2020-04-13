require 'rails_helper'

RSpec.describe 'tweets', type: :system do
  before do
    user = create(:user)
    user.confirm
    sign_in user
  end

  scenario 'ツイートを投稿したら、即反映されること' do
    visit root_path
    fill_in 'いまどうしてる？', with: 'おはようございます。'
    click_button 'ツイート'
    expect(page).to have_content 'おはようございます。'
  end
end
