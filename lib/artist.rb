class Artist
    attr_accessor :name, :songs

    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end

    #returns all existing Artist instances 
    def self.all
        @@all
    end

    #keeps track of artist's songs 
    def add_song(song)
        song.artist = self
    end

    #lists all songs that belongs to artist
    def songs
        Song.all.select{|song| song.artist == self}
    end

    #.find_or_create_by_name always returns an Artist instance
    def self.find_or_create_by_name(name)
        self.find(name) ? self.find(name) : self.new(name)
    end

    def self.find(name)
        self.all.find {artist| artist.name == name}
    end

end
