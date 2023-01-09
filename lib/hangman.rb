class Hangman
  def self.clean_dict
    @dictionary = File.readlines($contents, chomp: true)
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

  def self.get_guess
    p @picked_word
    p "Please type in your guess."
    @guess = gets.chomp.gsub(/\W/, "")
    
    if @guess == nil
      fail_state
    elsif @guess.lenth > 1
      fail_state
    end
  end

  def fail_state

  end

  def self.check_guess
    word_array = @picked_word.chars
  end
end



$contents = File.open('/Users/clover/Documents/hangman1/google-10000-english-no-swears.txt', 'r')

Hangman.clean_dict
Hangman.pick_word(@dictionary)
Hangman.print_guesses_left
Hangman.check_guess