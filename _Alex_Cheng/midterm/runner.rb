require_relative 'lib/trello-api'
require 'yaml'

AUTH_KEYS = YAML.load_file('lib/auth_keys.yml')

def welcome
	puts 'Welcome to your Trello CLI browser. I\'ll be your host.'
end

def main
	t = TrelloViewer.new AUTH_KEYS
  while true
    puts "You chose the #{t.peek.name} #{t.get_level}"
    break unless t.has_next?

    choice = t.get_choice
    next_choice = t.next[choice]
    (t.get_level == :list) ? t.add_card(next_choice.id) : t.add_list(next_choice.id)
  end
end

welcome
main
