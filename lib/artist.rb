require 'pry'
require_relative './concerns_module.rb'

class Artist
  extend Concerns::Findable

  attr_accessor :name, :songs

  @@all = []
  
  def initialize(name)
    @name = name
    @songs = []
  end

  def add_song(song)
    if !song.artist
      song.artist = self
    end
    
    if !self.songs.include?(song)
      self.songs << song
    end
  end
  
  def genres
    # not sure if collect is the best method to use
    self.songs.collect {|song| song.genre}.uniq
  end

  def self.all
    @@all
  end
  
  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    artist = self.new(name)
    artist.save
    artist
  end

end
