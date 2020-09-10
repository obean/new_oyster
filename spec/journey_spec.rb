require 'journey'

describe Journey do
  let(:entry_station) { double 'station' }
  let(:exit_station) { double 'station' }
  subject(:journey) {Journey.new}

  it "has an entry_station" do
    expect(journey.entry_station).to eq nil
  end

  it "has an exit_station" do
    expect(journey.exit_station).to eq nil
  end

  describe '#start(station)' do
    it 'stores an entry station' do
      expect{ journey.start(entry_station) }.to change{ journey.entry_station }.from(nil).to(entry_station)
    end
  end

  describe '#end(station)' do
    it 'stores an exit station' do
      expect{ journey.end(exit_station) }.to change{ journey.exit_station }.from(nil).to(exit_station)
    end

    it 'returns the journey' do
      journey.start(entry_station)
      expect(journey.end(exit_station)).to eq ({ entry_station: entry_station, exit_station: exit_station })
    end

   
  end

  describe '#complete?' do 
    it "it returns true if theres a complete journey" do
      subject.start(entry_station)
      subject.end(exit_station)
      expect(subject.complete?).to eq true
      #it returns true if both hash values are truthy and returns false if either is nil
    end
    it "flags an incomplete journey" do 
      subject.end(exit_station)
      expect(subject.complete?). to eq false 
    end
  end

  describe '#in_journey?' do
    it 'returns false if entry_station is nil' do
      expect(journey.in_journey?).to eq false
    end

    it 'returns true if entry_station is not nil' do
      journey.start(entry_station)
      expect(journey.in_journey?).to eq true
    end

  end

  describe "#fare" do
    it "returns 1 when complete? = true" do
      subject.start(entry_station)
      subject.end(exit_station)
      expect(subject.fare).to eq Journey::MINIMUM_FARE
    end

    it "returns 6 when complete? = false" do
      subject.end(exit_station)
      expect(subject.fare).to eq Journey::PENALTY_FARE
    end
  end

end

# ##################
#
# it 'updates the card to be not in journey' do
#   card.tap_out
#   expect(card.in_journey?).to eq false
# end
#

#

# it 'returns false if the card status is tapped out' do
#   expect(card.in_journey?).to eq false
# end
# end
#
# end