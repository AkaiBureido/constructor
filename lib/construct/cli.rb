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
# 2. Move the file processing into the library
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

				#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
				# [2.] Construct::construct requested_template_path {{{
				#
				# there are a few possibilities now
				# the template can be:
				# * or a plain file with instructions
				# * a directory
				# * a zip file
				template_type = nil
				if File.exists? requested_template_path
					template_type = :instruction_file
				elsif Dir.exists? requested_template_path
					template_type = :directory
				elsif File.exists? requested_template_path + ".zip"
					template_type = :zip_ball
				else
					puts "Error: the requested template #{requested_template_path} does not exist!"
					exit
				end

				# Now that we know the file type leets act accordingly
				case template_type
				when :instruction_file
					# TODO: Figure out syntax
					#
					# Assumptions to make coding easier for now:
					# * indents are 4 space wide.
					#
					# Every thing that follows # is considered a comment

					File.open( requested_template_path , "r" ) { |template_file|
						# get all lines and delete empty ones
						contents = (template_file.read.split("\n").delete_if { |a| a.empty? })

						# First line must contain type in form of '# Type:<type>'
						# Type acn be either:
						# * constructor - my own script language for this task
						# * shell       - self explanatory really
						script_type = contents.shift.match(%r{Type:\s*(\w+)})[1].to_sym

						# TODO: Write both shell and constructo implementations
					}

				when :directory
					# TODO: Simply copy the directory
				when :zip_ball
					# TODO: Unpack the zip into folder
				end
				# }}}
				#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
