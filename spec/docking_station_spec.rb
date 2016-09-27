require "docking_station"
describe DockingStation do
 it { is_expected.to respond_to :release_bike}

 it 'releases bike and checks if its working' do
   bike = subject.release_bike
   expect(bike).to be_working
 end

 it { is_expected.to respond_to(:dock).with(1).argument }

 it { is_expected.to respond_to :bike }

 it 'docks something' do
   bike2 = Bike.new
   expect(subject.dock(bike2)).to eq bike2
 end

 it 'returns docked bikes' do
   bike3 = Bike.new
   subject.dock(bike3)
   expect(subject.bike).to eq bike3
 end
end
