class Tournament

  class Team
    attr_reader :name, :wins, :draws, :losts

    def initialize(name)
      @name = name
      @wins = 0
      @draws = 0
      @losts = 0
    end

    def win!
      @wins += 1
    end
    def draw!
      @draws += 1
    end
    def lost!
      @losts += 1
    end
    def all_matches
      wins + draws + losts
    end
    def points
      3 * wins + draws
    end

    def info
      [name, all_matches, wins, draws, losts, points]
    end
  end

  attr_reader :teams

  def initialize
    @teams = []
  end

  def tally(input)
    read_teams(input)
    report
  end

  def report
    pattern = "%-30s | %2s | %2s | %2s | %2s | %2s\n".freeze

    pattern % %w[Team MP W D L P] +
      @teams.sort_by { |team| [-team.points, team.name] }
      .map { |team| format(pattern, *team.info) }
      .join
  end


  def read_teams(input)
    input.lines.each do |line|
      result = line.split(";")
      next if result.size != 3

      team1 = find_or_create_team(result[0])
      team2 = find_or_create_team(result[1])
      case result[2].strip
      when 'draw'
        team1.draw!
        team2.draw!
      when 'win'
        team1.win!
        team2.lost!
      else
        team2.win!
        team1.lost!
      end
    end
  end

  def find_or_create_team(name)
    team = @teams.find { |item| item.name == name }
    if team.nil?
      team = Team.new(name)
      @teams.push(team)
    end
    team
  end

  def self.tally(input)
    self.new.tally(input)
  end
end