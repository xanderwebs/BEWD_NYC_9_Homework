require_relative 'lib/trello-api'
require 'yaml'
require 'pry'

AUTH_KEYS = YAML.load_file('lib/auth_keys.yml')


def welcome
	puts 'Welcome to your Trello CLI browser. I\'ll be your host.'
end

def show_options opts
	opts.each_with_index do |opt, i|
		puts "#{i} #{opt.name}"
	end
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

def select_option max_range
	selection = get_selection
	return selection if (0..max_range).include? selection

	puts 'Hey wait, that\'s not a possible option!'
	select_option max_range
end

def get_choices iterable
	show_options iterable
	select_option iterable.length-1
end

def main
	t = TrelloApi.new AUTH_KEYS
	choice = get_choices(t.current_iterable)
	t.set_list t.current_iterable[choice].id
	choice = get_choices(t.current_iterable)
	t.set_card t.current_iterable[choice].id
	puts "You selected #{t.card.name}"
end

welcome
main
