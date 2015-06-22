require_relative "contest"

class Contests
  # blue print for the acebreak contest library

  @@last_id = 000

  def initialize
    @contests = []

    # Original series of soccer contests
    # /* => could be changed to an other number.  See mobile spec sheet.  Code needs to be progremmed.
    add_contest(contest_name: "Original 11", sport_category: "SOCCER", number_of_players: "11", 
      position_list: "FW = 3/*, MD = 3/*, D = 4/*, G = 1", notes: "default")
    add_contest(contest_name: "Clever 7", sport_category: "SOCCER", number_of_players: "7", 
      position_list: "FW = 2/*, MD = 2/*, D = 2/*, G = 1", notes: "default")
    add_contest(contest_name: "Goals r wild", sport_category: "SOCCER", number_of_players: "4", 
      position_list: "FW = 2/*, MD = 1/*, D = 1/*", notes: "default")
    add_contest(contest_name: "The Wall", sport_category: "SOCCER", number_of_players: "3", 
      position_list: "G = 3", notes: "default")
  end

  def add_contest(input)
    @@last_id += 1
    contest = Contest.new(@@last_id, input)

    @contests << contest
  end

  def edit_contest(id, key, value)
    @contests.each do |contest|
      if contest.id == id
        case key
        when :contest_name then contest.contest_name = value.capitalize
        when :sport_category then contest.sport_category = value.upcase
        when :number_of_players then contest.number_of_players = value.to_i
        when :position_list then contest.position_list = value.to_s
        when :notes then contest.notes = value.capitalize
        end
      end
    end
  end

  def display_all_contests(contests=nil)
    if contests
      return contests.each { |contest| contest.display }
    else
      return @contests.each { |contest| contest.display }
    end
  end

  def display_contest_by_id(id)
    @contests.each do |contest|
      if contest.id == id
        contest.display
        return contest
      end
    end
  end

  def delete_contest(id)
    @contests.delete_if do |contest|
      contest.id == id
    end
  end

end
