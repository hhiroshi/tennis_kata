require './tennis'

describe Tennis do

	before(:each) do
		@tennis = Tennis.new
	end

	it "should start the set 0-0" do
		@tennis.score.should == "0-0"
	end

	it "should show 15-0 when player 1 scores" do
		@tennis.point!(1)
		@tennis.score.should == "15-0"
	end

	it "should show 0-15 when player 2 scores" do
		@tennis.point!(2)
		@tennis.score.should == "0-15"
	end

	it "should show 30-15 when player 1 scores twice and player 2 scores once" do
		@tennis.point!(1)
		@tennis.point!(2)
		@tennis.point!(1)
		@tennis.score.should == "30-15"
	end

	it "should show 15-30 when player 2 scores twice and player 1 scores once" do
		@tennis.point!(2)
		@tennis.point!(1)
		@tennis.point!(2)
		@tennis.score.should == "15-30"
	end

	it "should show 15-15 when player 1 scores and player 2 scores once" do
		@tennis.point!(1)
		@tennis.point!(2)
		@tennis.score.should == "15-15"
	end

	it "should show 30-30 when player 1 scores twice and player 2 scores twice" do
		(0..1).each {@tennis.point!(1)}
		(0..1).each {@tennis.point!(2)}
		@tennis.score.should == "30-30"
	end

	it "should show 40-0 when player 1 scores three times" do
		(0..2).each {@tennis.point!(1)}
		@tennis.score.should == "40-0"
	end

	it "should show 0-40 when player 2 scores three times" do
		(0..2).each {@tennis.point!(2)}
		@tennis.score.should == "0-40"
	end

	it "should show DEUCE when player 1 and player 2 score three times" do
		deuce
		@tennis.score.should == "DEUCE"
	end

	it "should show ADVANTAGE player 1 when player 1 takes the advantage" do
		deuce
		@tennis.point!(1)
		@tennis.score.should == "ADVANTAGE player 1"
	end

	it "should show ADVANTAGE player 2 when player 2 takes the advantage" do
		deuce
		@tennis.point!(2)
		@tennis.score.should == "ADVANTAGE player 2"
	end

	it "should show DEUCE when player 1 loses the advantage" do
		deuce
		@tennis.point!(1)
		@tennis.point!(2)
		@tennis.score.should == "DEUCE"
	end

	it "should show DEUCE when player 2 loses the advantage" do
		deuce
		@tennis.point!(2)
		@tennis.point!(1)
		@tennis.score.should == "DEUCE"
	end

	it "should show ADVANTAGE when player 1 loses the advatage and recover the advantage" do
		deuce
		@tennis.point!(1)
		@tennis.point!(2)
		@tennis.point!(1)
		@tennis.score.should == "ADVANTAGE player 1"
	end

	it "should show ADVANTAGE when player 2 loses the advatage and recover the advantage" do
		deuce
		@tennis.point!(2)
		@tennis.point!(1)
		@tennis.point!(2)
		@tennis.score.should == "ADVANTAGE player 2"
	end

	it "should show player 1 wins if he scores 4 times" do
		(0..3).each {@tennis.point!(1)}
		@tennis.score.should == "player 1 wins"
	end

	it "should show player 2 wins if he scores 4 times" do
		(0..3).each {@tennis.point!(2)}
		@tennis.score.should == "player 2 wins"
	end

	it "should show player 1 wins if he scores 4 times and player 2 scores 1 time" do
		(0..2).each{@tennis.point!(1)}
		@tennis.point!(2)
		@tennis.point!(1)
		@tennis.score.should == "player 1 wins"
	end

private

	def deuce
		(0..2).each {@tennis.point!(1)}
		(0..2).each {@tennis.point!(2)}
	end

end
