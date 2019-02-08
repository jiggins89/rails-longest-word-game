require 'open-uri'

class GamesController < ApplicationController
  def new
    alphabet = ('a'..'z').to_a
    @letters = []
    10.times do
      @letters << alphabet.sample
    end
  end

  def score
    @word = params[:question]
    # raise
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    page = JSON.parse(open(url).read)
    # raise

    if page['found'] == true
      @result = "Congratulations #{@word} is a valid word"
    else
      @result = "Sorry #{@word} is not a word. You is a dumb b***h!"
    end
  end
end
