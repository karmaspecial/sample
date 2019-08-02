require "open-uri"
require 'itunes-search-api'

ITunesSearchAPI.search(
  :term    => " サカナクション  ",
  :country => 'jp',
  :media   => 'music',
  :lang    => 'ja_jp',
  :limit  => '2'
).each do |item|
  #p item
  print "アーティスト名:"
  puts item['artistName']

  print "曲名:"
  puts item['trackName']

  print "サンプルURL:"
  puts item['previewUrl']

  print "ジャケット:"
  puts item['artworkUrl100']

  puts "-------------------------"

  open(item['artworkUrl100']) {|image|
  	File.open("#{item['trackName']}.jpg","wb") do |file|
  		file.puts image.read
  	end
  }
end