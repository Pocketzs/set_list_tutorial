require 'rails_helper'

RSpec.describe Artist do
  it {should have_many :songs}

  describe 'instance methods' do
    describe '#average_song_length' do
        before :each do
          @blink = Artist.create!(name: "Blink-182")
          @small_things = @blink.songs.create!(title: "All The Small Things", length: 845, play_count: 122344123)
          @what_age = @blink.songs.create!(title: "What's My Age Again", length: 664, play_count: 122312323)
          @rock_show = @blink.songs.create!(title: "Rock Show", length: 1, play_count: 99)
        end

        it 'returns the average song length' do
          expect(@blink.average_song_length.round(2)).to eq(503.33)
        end
    end
  end
end