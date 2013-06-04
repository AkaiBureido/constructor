################################################################################
# TODO: Read the configuration from file
# TODO: Populate default folder with sample templates.
# TODO: Check the template from arguments. 
# TODO: Figure out the syntax I will use for 'construct'
# TODO: Implement add and remove commands
# TODO: Use the help gem thing maybe. I don't remember the name.
#
# NOTE: BUT ABOVE ALL!!!!!!!!!!!!!!!!!
# TODO: Refactor this sucker!
################################################################################


#===============================================================================
# REFACTORING PLAN:
# 1. Move the file detection stuff into the library [DONE]
# 2. Move the file processing into the library [DONE]
#===============================================================================

# REFACTORING ZONES WILL BE DEPICTED THIS WAY:
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# [NUMBER] <The code I wish I had goes here>
#
# <THE CODE I ACTUALLY HAVE>
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

require 'construct'
require 'pry'
#
# Construct-cli deals with the command line interface aspect
# of this app.
module Construct
	class ConstructCli
		def self.run largv
			Construct::init

			# first argument is the command name:
			case largv.shift
			when "make"
				# First lets decypher the category of template based on category separator
				template_offset_path = largv.shift.split(TEMPLATE_CATEGORY_SEPARATOR) 

				# Getting the full path to the template 
				requested_template_path = File.join TEMPLATE_BASE_PATH, *template_offset_path

				Construct::FileProcessor.construct requested_template_path
				# case "~~~~~~~"
				# TODO: Implement:
				# add    - adding a new template with editor, perhaps some cursing and black magic...
				# remove - removing a template
			else
				puts "Error: Unknown command! See nonexistent help!"
			end
		end
	end
end





# vim:ft=ruby
