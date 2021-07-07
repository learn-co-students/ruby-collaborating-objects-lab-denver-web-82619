require 'pry'

class Song
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @@all << self     
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        filename_array = parse_filename(filename)
        new_song = self.new(filename_array[1])
        new_song.artist = Artist.new(filename_array[0])
        new_song
    end

    # returns an array with [artist, song, genre] strings
    def self.parse_filename(filename)
        split_filename = filename.split(" - ")
        split_filename[2].slice!(".mp3")
        split_filename
    end

    def artist_name=(artist_name)
        artist = Artist.find_or_create_by_name(artist_name)
        artist.add_song(self)
    end

end