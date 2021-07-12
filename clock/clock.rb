class Clock
  attr_reader :minutes

  MINUTES_PER_DAY = 24 * 60
  def initialize(hour: 0, minute: 0)
    @minutes = ((hour * 60) + minute) % MINUTES_PER_DAY
  end

  def to_s
    # "%02d:%02d" % [minutes / 60, minutes % 60]
    # format('%<hours>02d:%<minutes>02d', hours: minutes / 60, minutes: minutes % 60)
    format('%02d:%02d', minutes / 60, minutes % 60)
  end

  def +(other)
    # self.class better then Clock
    self.class.new(minute: minutes + other.minutes)
  end

  def -(other)
    self.class.new(minute: minutes - other.minutes)
  end

  def ==(other)
    minutes == other.minutes
  end
end