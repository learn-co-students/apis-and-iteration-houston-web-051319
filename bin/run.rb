#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require 'tty-prompt'

welcome
character = prompt_select_character_from_user
show_character_movies(character)
