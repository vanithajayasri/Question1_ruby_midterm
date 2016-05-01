#---------
# name: NumberGuess.rb
#
#----------------

class Screen

  def cls
    puts ("\n" * 30)
    puts "\a"
  end

  def pause
    STDIN.gets
  end

end

class Game
  $totalplayed = 0
  $guess_count = 0
  def display_greeting
    Console_Screen.cls
    print "\t\t Welcome to the Ruby Number Guessing Game!" +
              "\n\n\n\n\n\n\n\n\n\n\n\n\ Press Enter to " +
              "continue."

    Console_Screen.pause
  end

  def display_instruction
    Console_Screen.cls
    puts "Instruction:\n\n"

    puts "This game randomly generates a number from 1 to 100 and "
    puts "challaenges you to identify it in as few guesses and possible "
  end

  def generate_number
    return randomNo = 1 + rand(1000)
  end

  def play_game
    $totalplayed += 1
    number = generate_number
    guess = 0;
    while guess < 10  do
      Console_Screen.cls
      print "\nEnter your guess and press the enter key: "

      reply = STDIN.gets
      reply.chop!
      reply = reply.to_i

      if (reply < 1 or reply > 1000) and reply != 00000 then
        redo # redo the ciurrent iteration of the loop
      elsif reply == 00000 then
        Console_Screen.cls
        print "The Random value is #{number}"
        Console_Screen.pause
        redo
      end

      if reply == number then
        Console_Screen.cls
        print "You have guessed the number! Press Enter to continue."
        Console_Screen.pause
        guess += 1
        break
      elsif reply < number then
        Console_Screen.cls
        print "Your guess is too low! your guess should be between #{number < 100 ? 0 :number-100} and #{number+100} Press enter to continue."
        Console_Screen.pause
      elsif reply > number then
        Console_Screen.cls
        print "Your guess is too high! your guess should be between #{number > 100 ? 0 :number-100} and #{number+100} Press enter to continue."
        Console_Screen.pause
      end
      guess +=1
    end
    $guess_count += guess
  end

  def display_credits
    Console_Screen.cls
    puts "The Total Number of Game Played #{$totalplayed}"
    puts "Avg Number of Guess for Total Game #{$guess_count/$totalplayed}"
    puts "\t\t\Thanks you for playing the number game!!"
  end

  $noRight = 0

  Console_Screen = Screen.new

  SQ = Game.new

  SQ.display_greeting

  answer = ""

  loop do
    Console_Screen.cls

    print "Are you ready to play the Ruby Number Guessing Game? (y/n): "

    answer = STDIN.gets

    answer.chop!

    break if answer == "y" || answer == "n"
  end

  if answer == "n"

    Console_Screen.cls

    puts "Perhaps anoher time.\n\n"

  else
    SQ.display_instruction

    loop do
      SQ.play_game

      Console_Screen.cls

      print "Would you like to play again? (y/n): "

      playAgain = STDIN.gets
      playAgain.chop!

      break if playAgain == "n"
    end

    SQ.display_credits

  end

end