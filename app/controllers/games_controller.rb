require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    @letters = params[:letters]  #string
    @answer = params[:result].upcase.split("") #array
    english_word = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{params[:result]}").read)["found"]
    include = params[:result].upcase.chars.all? { |letter| params[:result].upcase.count(letter) <= @letters.split(" ").count(letter) }
    if include
      if english_word
        @result = "Congratulations! #{@answer.join("")} is a valid English word"
      else
        @result = "Sorry but #{@answer.join("")} does not seem to be a valid English word"
      end
    else
      @result = "Sorry but #{@answer} can't be bult out of #{@letters}"
    end
  end
end
