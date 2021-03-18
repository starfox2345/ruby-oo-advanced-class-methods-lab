require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  
  def self.create
    song = self.new
    self.all.push(song)
    song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    @@all.push(song)
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all.push(song)
    song
  end

  def self.find_by_name(name)
    find_song = @@all.find do |songs|
      songs.name == name
    end
    find_song
  end

  def self.find_or_create_by_name(name)
    selection = self.find_by_name(name)
    if selection
      selection
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|all_songs| all_songs.name}
  end

  def self.new_from_filename(file_name)
    artist = file_name.split("-")[0].strip
    song = file_name.split(/[-.]/)[1].strip

    new_song = self.new
    new_song.name = song
    new_song.artist_name = artist
    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    new_song.save
  end

  def self.destroy_all
    @@all.clear
  end
end


