#require 'journey'

class JourneyLog 
  attr_reader :journey_class, :journey
  def initialize
    @journey_class = Journey
  end

  def start(entry_station)
    @journey = @journey_class.new(entry_station)
  end

  def current_journey
    { entry_station: @journey.entry_station, exit_station: @journey.exit_station }
  end
end

