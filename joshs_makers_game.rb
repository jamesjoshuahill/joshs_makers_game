#!/usr/bin/env ruby
def prompt()
	print "> "
	gets.chomp()
end

def start_game()
	puts %{
------------------------------------------
  Welcome to Josh's Makers Academy game!
------------------------------------------
}
	outside()
end

def make_your_move(choices)
	next_move = prompt
	choices.each do |choice, fate|
		if choice == "else" || next_move.include?(choice)
			fate_method, fate_argument = fate
			if fate_argument.nil?
				return send(fate_method)
			else
				return send(fate_method, fate_argument)
			end
		end
	end
end

def outside()
	puts %{
OUTSIDE
Well done you navigated London transport.
You are outside 25 City Road. Huh, looks like it's called Epworth House.
Do you want to go in?
(e.g. type 'go in')

}
	make_your_move(
		"in" => ["lobby"],
		"else" => ["end_game", "You wander until you find a trendy cafe and\nplay on your laptop for the rest of the day."]
	)
	#next_move = prompt
	#if next_move.include? "in"
	#	lobby()
	#else
	#	end_game "You wander until you find a trendy cafe and\nplay on your laptop for the rest of the day."
	#end
end

def lobby()
	puts %{
LOBBY
You walk into the Lobby and say hello to the security guard.
You say you'd like to go up to Makers Academy and smile self-consciously.
The guard says there's no need to sign in and Makers is on the fourth floor.
Do you want to take the stairs or the lift?

}
	make_your_move(
		"stairs" => ["stairs"],
		"lift" => ["lift"],
		"else" => ["lobby"]
	)
	#next_move = prompt()
	#if next_move.include? "stairs"
	#	stairs()
	#elsif next_move.include? "lift"
	#	lift()
	#else
	#	puts "Say again?"
	#	lobby()
	#end
end

def stairs()
	puts %{
STAIRS
You walk to the stairs and start climbing.
The fourth floor is further than you thought, but adrenalin gets you there.
}
  reception()
end

def lift()
	puts %{
LIFT
You press the lift button. It lights up and you wait for ages.
Someone else arrives and presses the other lift button. Oh, two buttons.
Eventually a lift arrives and you reach the fourth floor.
}
	reception()
end

def reception()
	puts %{
RECEPTION
You walk into Makers Academy reception.
Rob Johnson is at reception, do you say hi or run away?

}
	make_your_move(
		"hi" => ["end_game", "Rob says hi and you shake hands. Well done!"],
		"run" => ["end_game", "You run away.\nWhen you get home you play on your laptop until the wee hours.\nBetter luck next time."],
		"else" => ["reception"]
	)
	#next_move = prompt()
	#if next_move.include? "hi"
	#	end_game("Rob says hi and you shake hands. Well done!")
	#elsif next_move.include? "run"
	#	end_game("You run away.\nWhen you get home you play on your laptop until the wee hours.\nBetter luck next time.")
	#else
	#	puts "Say again?"
	#	reception()
	#end
end

def end_game(why="Uh oh!")
	puts "\n#{why}\n---------------------------------------\n"
	Process.exit(0)
end

start_game