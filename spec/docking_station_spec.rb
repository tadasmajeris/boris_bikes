require "docking_station"
describe DockingStation do
 it { is_expected.to respond_to :release_bike}

 it 'releases bike and checks if its working' do
   bike = Bike.new
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

 describe '#release_bike' do
   it 'It should raise an error if the docking_station is empty' do
     expect { subject.release_bike }.to raise_error 'No bikes available'
   end
   it 'returns docked bike' do
     bike3 = Bike.new
     subject.dock(bike3)
     expect(subject.release_bike).to eq bike3
   end
 end
end
