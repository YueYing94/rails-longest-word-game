class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a.sample }
  end

  def score
    answer = params[:result]
    english_word = JSON.parse(URI.open("https://wagon-dictionary.herokuapp.com/#{answer}").read)["found"]
    array = []
    @letters.each { |letter| array >> letter if answer.include? letter }
    if array.length =! answer.length
      "Sorry but #{answer} can't be bult out of #{@letters.join(",")}"
    elsif english_word!
      "Sorry but #{answer.upcase} does not seem to be a valid English word"
    else
      "Congratulations! #{answer.upcase} is a valid English word"
    end
  end
end
