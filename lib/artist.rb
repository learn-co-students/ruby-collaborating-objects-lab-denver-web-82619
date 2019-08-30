class Artist
    attr_accessor :name, :songs

    @@all = []

    def initialize(name)
        @name = name
        @songs = []
        @@all << self
    end
        
    def self.all
        @@all
    end

    def self.find_or_create_by_name(name)
        found_artist = all.find {|artist| artist.name == name}
        if !all.include?(found_artist)
            new_artist = self.new(name)
            found_artist = new_artist
        end
        found_artist
    end

    def add_song(song)
        song.artist = self
        self.songs << song
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def print_songs
        self.songs.each {|song| puts song.name}
    end
end
