require 'rails_helper'

describe 'admin contact requestes' do
  let!(:user) { create :user }
  let!(options) { 
    { name: 'John Smith', email: 'admin@gmail.com'}
  }

  before do
    sign_in user
    visit admin_path
  end

  context 'index' do
    it 'sanitizes message html code' do
      expect(page).to have_content('Contact requests')
      expect(page).to have_content('John Smith')
      expect(page).to have_content('admin@gmail.com')
    end
  end
end

end