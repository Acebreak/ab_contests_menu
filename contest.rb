class Contest
  # blue print for a single contest

  attr_accessor :contest_name, :sport_category, 
  :number_of_players, :position_list, :notes
  attr_reader :id

  def initialize(id, input)
    @id = id
    @contest_name = input[:contest_name].capitalize
    @sport_category = input[:sport_category].upcase
    @number_of_players = input[:number_of_players].to_i
    @position_list = input[:position_list].to_s
    @notes = input[:notes]
  end

  def display
    puts "Contest ID: #{@id}"
    puts "Contest name: #{@contest_name}"
    puts "Sport category: #{@sport_category}"
    puts "Number of players: #{@number_of_players}"
    puts "Position list: #{@position_list}"
    puts "Notes: #{@notes}"
  end
end