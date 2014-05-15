require 'trello'

class TrelloViewer
	attr_reader :next
	LEVEL_ENUM = [:board, :list, :card]


	def initialize auth
		Trello.configure do |config|
		  config.developer_public_key = auth['key']
		  config.member_token = auth['token']
		end
		@history = []
		@history << Trello::Board.find(auth['board'])
		@next = self.peek.lists
	end

	def add_card id
		@history << Trello::Card.find(id)
		@next = nil
	end

	def add_list id
		@history << Trello::List.find(id)
		@next = self.peek.cards
	end

	def has_next?
		@history.empty? || !!@next
	end

	def get_choice
		show_options @next
		select_option @next.length-1
	end

	def get_level
		LEVEL_ENUM[(@history.length-1) % LEVEL_ENUM.length]
	end

	def peek
		@history.last
	end

	private

	def show_options opts
		opts.each_with_index do |opt, i|
			puts "#{i} #{opt.name}"
		end
	end

	def select_option max_range
		selection = get_selection
		return selection if (0..max_range).include? selection

		puts 'Hey wait, that\'s not a possible option!'
		select_option max_range
	end

	def get_selection
	  print 'Select an option: '
	  begin
	    Integer(gets.strip)
	  rescue
	    puts 'Hey, what are you trying to do here, that\'s not a number!'
	    get_selection
	  end
	end
end
