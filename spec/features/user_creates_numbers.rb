require 'rails_helper'

feature 'User creates numbers' do
  background do
    visit new_number_path
    click_link 'Add Mobile Number'
  end

  scenario 'successfully' do
    other_junk = create(:number)

    fill_in 'Name', with: 'Brian'
    fill_in 'Number', with: '4132746902'

    click_button 'Add Number'

    within('.player', text: 'Brian') do
      expect(page).to have_css '.name', text: 'Brian'
      expect(page).to have_css '.number', text: '4132746902'
    end

    expect(page).to have_css '.player', text: other_junk
  end

end
