class TwelveDays
  DAYS = [
    ["first", "a Partridge in a Pear Tree"],
    ["second", "two Turtle Doves"],
    ["third", "three French Hens"],
    ["fourth", "four Calling Birds"],
    ["fifth", "five Gold Rings"],
    ["sixth", "six Geese-a-Laying"],
    ["seventh", "seven Swans-a-Swimming"],
    ["eighth", "eight Maids-a-Milking"],
    ["ninth", "nine Ladies Dancing"],
    ["tenth", "ten Lords-a-Leaping"],
    ["eleventh", "eleven Pipers Piping"],
    ["twelfth", "twelve Drummers Drumming"]
  ].freeze

  def song
    lines = (0..11).reduce([]) do |lines, day|
      lines.push(create_line_of_song_for(day))
    end

    lines.join("\n").strip
  end

  def self.song
    new.song
  end

  private

  def create_line_of_song_for(day)
    "On the #{DAYS[day].first} day of Christmas my true love gave to me: #{rest_of_the_line(day)}.\n"
  end

  def rest_of_the_line(day)
    r = day.downto(0).reduce([]) do |acc, day|
      acc << DAYS[day].last
      acc
    end
    
    return "#{r[0]}" if r.size == 1

    r[0..-2].join(", ").concat(", and #{r.last}")
  end
end