#require 'journey'
class Oystercard
  attr_reader :balance, :journeys, :journey
  DEFAULT_BALANCE = 0
  MAX_LIMIT = 90
  MINIMUM_FARE = 1
  

  def initialize(journey_class = Journey, balance = DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
    @journey = nil
    @journey_class = journey_class
  end

  def top_up(amount)
    raise "Exceeds maximum card limit of #{MAX_LIMIT}" if exceeds_limit?(amount)

    @balance += amount
  end

  def tap_in(entry_station)
    raise 'Insufficient Funds' if @balance < MINIMUM_FARE
    deduct(Journey::PENALTY_FARE) unless @journey.nil?
  
    @journey = @journey_class.new #unless @journey
    @journey.start(entry_station)
  end 

  def tap_out(exit_station = 'default')
    ## TODO: add for when card is already in journey
    #current_journey = @journey.end(exit_station)
    @journey = Journey.new unless @journey
    add_journey(@journey.end(exit_station))
    deduct(@journey.fare)
    
    @journey = nil
  end


  private

  def exceeds_limit?(amount)
    (@balance + amount) > MAX_LIMIT
  end

  def deduct(fare)
    @balance -= fare
  end

  def add_journey(current_journey)
    @journeys << current_journey
  end



end
