require_relative "contests"

class ABCM
# acebreak contest menu
  attr_reader :name

  def self.run(name)
    ab = new(name)
    ab.main_menu
  end

  def initialize(name)
    @name = name
    @contests = Contests.new
  end

  def print_main_menu
    puts "[1] Create contest"
    puts "[2] Display a contests"
    puts "[3] Display all contests"
    puts "[4] Edit contest"
    puts "[5] Delete contest"
    puts "[6] Exit"
  end

  def call_option(choice)
    case choice
    when 1 then create_new_contest
    when 2 then display_contest
    when 3 then display_all_contests  
    when 4 then edit_contest
    when 5
      puts "Delete a contest."
      delete_contest
      puts "Contest deleted."
    when 6
      puts "Exit"
      exit
    else
      puts "Жопа! Ты ошибся!"
    end
  end

  def print_contest_menu
    puts "[1] Create new contest"
    puts "[2] Sport category"
    puts "[3] Number of players"
    puts "[4] Position list"
    puts "[5] Notes"
  end

  def main_menu
    puts "Welcome to #{@name}."

    while true
      print_main_menu

      print "Select an option: "
      input = gets.chomp.to_i

      clear

      call_option(input)

      puts ""
    end
  end

  def create_new_contest
    puts "Create a new contest"

    @contests.add_contest(get_user_input)
  end

  def edit_contest
    contest = display_contest

    print "Is this the contest that you wish to edit [yes/no]: "
    confirm = gets.chomp.downcase

    if confirm == "yes" || confirm == "y"
      print_contest_menu

      print "Which option did you want to update [1-4]: "
      key = gets.chomp.to_i

      if key == 1
        key = :contest_name
        print "Enter the new contest name: "
      elsif key == 2
        key = :sport_category
        print "Enter the new sport category: "
      elsif key == 3
        key = :number_of_players
        print "Enter the new number of players: "
      elsif key == 4
        key = :position_list
        print "Enter the new list: "
      elsif key == 5
        key = :notes
        print "Enter the new notes: "
      end

      value = gets.chomp

      @contests.edit_contest(contest.id, key, value)
    end
  end

  
  def display_contest
    print "Enter the ID of the contest: "
    id = gets.chomp.to_i

    @contests.display_contest_by_id(id)
  end


  def display_all_contests
    clear
    @contests.display_all_contests
  end


  def delete_contest
    contest = display_contest
    @contests.delete_contest(contest.id)
  end

 
  def get_user_input
    user = {}

    print "Contest name: "
    user[:contest_name] = gets.chomp

    print "Sport category: "
    user[:sport_category] = gets.chomp

    print "Number of players: "
    user[:number_of_players] = gets.chomp

    print "Position List: "
    user[:position_list] = gets.chomp

    print "Notes: "
    user[:notes] = gets.chomp


    user
  end

  def clear
    puts "\e[H\e[2J"
  end

end

ABCM.run("Acebreak Contest Menu")