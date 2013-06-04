################################################################################
# TODO: Check the template from arguments. 
# TODO: Implement add and remove commands
# TODO: Use the help gem thing maybe. I don't remember the name.
# TODO: Ask the user to give the name of the project.
################################################################################

require 'constructor'
require 'constructor/file-processor'
require 'pry'

# Constructor-cli deals with the command line interface aspect
# of this app.
module Constructor
	class Cli
		def self.run largv
			Constructor::init

			# first argument is the command name:
			case largv.shift
			when "make"
				# First lets decypher the category of template based on category separator
				template_offset_path = largv.shift.split(TEMPLATE_CATEGORY_SEPARATOR) 

				# Getting the full path to the template 
				requested_template_path = File.join TEMPLATE_BASE_PATH, *template_offset_path
				Constructor::FileProcessor.construct requested_template_path
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
