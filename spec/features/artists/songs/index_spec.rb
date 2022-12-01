# As a user 
# When I visit an Artist's Songs index 
# Then I see the titles of all that Artist's songs 
# And I see that each title is a link to the songs show page 


require 'rails_helper'

RSpec.describe 'Artist songs index' do
  before :each do
    @blink = Artist.create!(name: "Blink-182")
    @small_things = @blink.songs.create!(title: "All The Small Things", length: 845, play_count: 122344123)
    @what_age = @blink.songs.create!(title: "What's My Age Again", length: 665, play_count: 122312323)
  end
  it 'shows all of the songs for the artist' do

    visit "/artists/#{@blink.id}/songs"

    expect(page).to have_content(@small_things.title)
    expect(page).to have_content(@what_age.title)

  end

  it 'links to each songs show page' do
    visit "/artists/#{@blink.id}/songs"

    click_on @small_things.title

    expect(current_path).to eq("/songs/#{@small_things.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@blink.id}/songs"

    expect(page).to have_content("Average Song Length for Blink-182: 755")
  end
end