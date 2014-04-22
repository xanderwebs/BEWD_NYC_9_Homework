require 'trello'

class TrelloApi
	attr_reader :board, :card, :list, :current_iterable

	def initialize auth
		Trello.configure do |config|
		  config.developer_public_key = auth['key']
		  config.member_token = auth['token']
		end
		@board = Trello::Board.find(auth['board'])
		@current_iterable = @board.lists
	end

	def set_card id
		@card = Trello::Card.find(id)
	end

	def set_list id
		@list = Trello::List.find(id)
		@current_iterable = @list.cards
	end

	def set_iterable obj
		@current_iterable = obj
	end
end
