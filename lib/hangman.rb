class Hangman
  @@game = true
  @guesses_array = []
  @guesses = 6

  def self.clean_dict
    @dictionary = File.readlines($contents, chomp: true)
    @rejected = @dictionary.reject {|word| word.length < 5 || word.length > 12}
  end


  def self.pick_word(contents)
    @picked_word = @rejected[rand(@rejected.length)]
  end

  def self.print_guesses_left
    p "You have #{@guesses} wrong guesses left."
  end

  def self.fail_state
    p "Not a valid guess."
    game_loop
  end


  def self.get_guess
    p "Please type in your guess."
    @guess = gets.chomp.gsub(/\W/, "")
    
    if @guess == nil
      Hangman.fail_state
    elsif @guess.length > 1
      Hangman.fail_state
    end
    
    @guesses_array.push(@guess)
  end

  

  def self.first_printer
    @hyphens = ''
    for i in 1..@picked_word.length
      @hyphens += '-'
    end
    p @hyphens
  end

 

  def self.guess_printer
    @word_array = @picked_word.chars
    @guess_printer = ''
    @word_array.each do |i|
      if @guesses_array.include?(i)
        @guess_printer += i
      else
        @guess_printer += '-'
      end
    end
    p @guess_printer
      
  end

  def self.check_guess
    if @word_array.include?(@guess)
    else
      @guesses -= 1
    end
  end

  def self.game_loop
    while @guesses > 0
      print_guesses_left
      get_guess
      guess_printer
      check_guess
      ender
    end
  end

  def self.starter
    clean_dict
    pick_word(@dictionary)
    first_printer
    game_loop
  end

  def self.ender
    if @guess_printer == @picked_word
      game_end
    end
    if @guesses <= 0
      p("Sorry, you've lost. Try again? Y or N")
      try_again
    end
  end
  def self.game_end
    p "Congrats, you've won! Try again? Y or N"
    try_again
  end
  def self.try_again
    reaction = gets.chomp.downcase
    if reaction == 'y'
      starter
    elsif reaction == 'n'
      p 'Thanks for playing!'
      exit
    end
  end


end




$contents = File.open('/Users/clover/Documents/hangman1/google-10000-english-no-swears.txt', 'r')

Hangman.starter
