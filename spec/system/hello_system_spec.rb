require 'rails_helper'

RSpec.describe "Welcome", type: :system do
  it 'it says welcome' do
    visit 'home/index'
    expect(page).to have_text('Welcome to Twain')
  end
end
