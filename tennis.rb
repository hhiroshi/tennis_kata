class Tennis

	def initialize
		@player1_score = 0
		@player2_score = 0
	end

	def score
		if someone_wins?
			show_winner
		elsif deuce?
			show_deuce
		elsif advantage?
			show_advantage
		else
			show_score
		end
	end

	def point! player
		if player == 1
			@player1_score = increase (@player1_score)
		else
			@player2_score = increase (@player2_score)
		end
	end

private

	def deuce?
		@player1_score == @player2_score && @player1_score >= 40
	end

	def show_advantage
			"ADVANTAGE #{player_with_highest_score}"
	end

	def advantage?
		@player1_score > 40 || @player2_score > 40
	end

	def someone_wins?
		(@player1_score > 40 || @player2_score > 40) && ((@player1_score-@player2_score).abs > 15)
	end

	def player_with_highest_score
		if @player1_score > @player2_score
			"player 1"
		else
			"player 2"
		end
	end

	def show_winner
			"#{player_with_highest_score} wins"
	end

	def show_deuce
		"DEUCE"
	end

	def show_score
		"#{@player1_score}-#{@player2_score}"
	end

	def increase score
			score += score==30? 10 : 15
			score
	end

end
