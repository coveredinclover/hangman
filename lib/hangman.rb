class Hangman
  def self.clean_dict
    @dictionary = File.readlines($contents).map &:split
    p @dictionary.length
    @rejected = @dictionary.reject {|word| word.length < 5 || word.length > 12}
    p @rejected.length
  end


  def self.pick_word(contents)
    @picked_word = @dictionary[rand(@dictionary.length)]
  end

  def self.print_guesses_left
    @guesses = 6
    p "You have #{@guesses} guesses left."
  end

  def self.game_start
    p @picked_word
  end

end



$contents = File.open('/Users/clover/Documents/hangman/google-10000-english-no-swears.txt', 'r')

Hangman.clean_dict
Hangman.pick_word(@dictionary)
Hangman.print_guesses_left
Hangman.game_start