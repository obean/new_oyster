require 'journeylog'
require 'journey'

describe JourneyLog do

  let(:entry_station) { double :station }
  let(:journey_log) { JourneyLog.new }
  let(:journey_class) { double :journey_class, new: journey }
  it "initializes with a Journey_class parameter" do
    expect(subject.journey_class).to eq Journey
  end

  describe '#start' do
    it 'starts a new journey at a given entry station' do
      expect(journey_log.start(entry_station)).to be_an_instance_of(Journey)
    end

    it 'saves a journey as the instance variable @current_journey' do
      subject.start(entry_station)
      expect(subject.journey).to be_an_instance_of(Journey)
    end
  end

  describe '#current_journey' do
    it 'returns an incomplete journey when' do
      #journey_log.send(:current_journey)
      journey_log.start(entry_station)
      expect(journey_log.current_journey).to eq ({ entry_station: entry_station, exit_station: nil })
    end
  end
end
