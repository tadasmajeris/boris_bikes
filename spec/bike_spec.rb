require 'bike'

describe Bike do
	it { is_expected.to respond_to :working? }

describe 'report_broken' do
	it "allows users to report broken bikes" do
		subject.report_broken
		status = subject.working?
		expect(status).to be false 
	end
end

end
