require 'rails_helper'

RSpec.describe 'the songs show page' do
  # user story guide
  # ----------------------------------------------------------------
  # As a visitor
  # When I visit /songs/1 (where 1 is the id of a song in my database)
  # Then I see that song's title and artist
  # And I do not see any of the other songs in my database
  it 'displays the song tile' do
    artist = Artist.create(name: 'Carly Rae Jepson')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456375)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456375)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title) #capybara lets us use this :have_content
    expect(page).to_not have_content(song_2.title)
  end

  it 'displays the name of the artist for the song' do
    artist = Artist.create(name: 'Carly Rae Jepson')
    song = artist.songs.create!(title: "I Really Like You", length: 208, play_count: 2456375)
    song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count: 21456375)
    visit "/songs/#{song.id}"

    save_and_open_page

    expect(page).to have_content(artist.name)
  end
end