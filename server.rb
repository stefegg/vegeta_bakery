require 'sinatra'
require 'curb'
require 'json'

set :public_folder, File.dirname(__FILE__) + '/publics'

get '/' do
  erb :home
end


get '/cake' do
  erb :cake
end

get '/cookie' do
  erb :cookie
end

get '/muffin' do
  erb :muffin
end

get '/contact' do
  erb :contact
end

get '/events' do
  @result = Curl::Easy.perform("https://www.eventbriteapi.com/v3/events/search/?q=baking&location.address=nyc&token=44ZRBDN4HYITKNUPIVV7")
  @data = @result.body_str
  @parsed = JSON.parse(@data)
  @events = @parsed['events']
  erb :events
end

$cookies = []
$muffins = []
$cakes = []

class Cookie
  attr_accessor :name, :image, :description, :cost
  def initialize(name, image, description, cost)
    @name = name
    @image = image
    @description = description
    @cost = cost
    $cookies << self
  end
end

class Muffin
  attr_accessor :name, :image, :description, :cost
  def initialize(name, image, description, cost)
    @name = name
    @image = image
    @description = description
    @cost = cost
    $muffins << self
  end
end

class Cake
  attr_accessor :name, :image, :description, :cost
  def initialize(name, image, description, cost)
    @name = name
    @image = image
    @description = description
    @cost = cost
    $cakes << self
  end
end

cookie_one = Cookie.new("Vegeta-licious", "/images/c1.png", "The Prince of all cookies is second to none in both appearance and delciousness.", "$7.00")

cookie_two = Cookie.new("Kakarot Sugar Crunch", "/images/c2.png", "A suitable choice, full of lots of sugar. Perfect... for a clown!", "$2.00")

cookie_three = Cookie.new("Gohan-ana Cookie", "/images/c3.png", "This banana flavored cookie had more potential than any of the others... until it got burnt.", "$3.00")

cookie_four = Cookie.new("Super Gotenks S'more", "/images/c4.png", "A cookie that would be a lot better off working on itself instead of stupid gimmicks.", "$6.00")

cookie_five = Cookie.new("Beerus Pudding Chip Cookie", "/images/c5.png", "Eating these will split your world in half", "$5.00")

cookie_six = Cookie.new("Buu Buu Brownie", "/images/c6.png", "Try this oversized cookie once, and it will blow your world apart.", "$9.00")

muffin_one = Muffin.new("Ma-Junior Muffin", "/images/m1.png", "The Namek has always been a skilled tactician, and knows when to get out of my way.", "$3.00")

muffin_two = Muffin.new("Majin Bubble Muffin", "/images/m2.png", "We all make mistakes, some involve more wholesale slaughter than others. This muffin is free for victims of the 25th Techiaki Budokai 'disaster'.", "$3.00 | Free ")

muffin_three = Muffin.new("Jaco", "/images/m3.png", "Where's Jaco? I killed him, and made him into muffins. WHAT?", "$4.00")

muffin_four = Muffin.new("Princess Bulma Spectacular", "/images/m4.png", "This is for my Bulma. You can't have one!", "N/A")

cake_one = Cake.new("Chocolate Gun!", "/images/ca1.png", "The wonderful flavor of this cake is world shattering.", "$17.00")

cake_two = Cake.new("Vanilla Bang Cake!", "/images/ca2.png", "You're going to have to finish what you started with this cake. Best enjoyed in hell!", "$19.00")

cake_three = Cake.new("Final Ganache Cake!", "/images/ca3.png", "This cake takes extra long to prepare, but once you have it, it will be the last cake you ever taste!", "$23.00")

cake_four = Cake.new("Shine Shine Cake Cake", "/images/ca4.png", "Try to keep up with the flavor of this one!", "$15.00")
