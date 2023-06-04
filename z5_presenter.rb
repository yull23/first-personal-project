require "terminal-table"

module Presenter
  def print_welcome_message
    puts "###################################"
    puts "#   Welcome to Clivia Generator   #"
    puts "###################################"
    puts "random | scores | exit"
    print "> "
  end

  # Definiendo la acción
  def defining_action
    print_welcome_message
    action = gets.chomp
    until ["random", "scores", "exit"].include?(action)
      puts "Option Invalid"
      print_welcome_message
      action = gets.chomp
    end
    action
  end
end
