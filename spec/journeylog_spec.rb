require 'journeylog'
require 'journey'
describe JourneyLog do
  it "initializes with a Journey_class parameter" do
    expect(subject.journey_class).to eq Journey
  end
end
