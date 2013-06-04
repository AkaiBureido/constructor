################################################################################
# TODO: Figure out the syntax I will use for 'constructor'
################################################################################
require 'constructor'

module Constructor
	class FileProcessor
		def self.construct requested_template_path
			# Find out what kind of template we have and act accordingly
			case get_template_type( requested_template_path )
			when :instruction_file
				process_instruction_file( requested_template_path )
			when :directory
				copy_directory_from( requested_template_path )
			when :zip_ball
				unpack_zipball_from( requested_template_path )
			end
		end

		def self.get_template_type requested_template_path
			# There are a few possibilities
			# the template can be:
			# * or a plain file with instructions
			# * a directory
			# * a zip file

			template_type = nil
			if Dir.exists? requested_template_path
				template_type = :directory
			elsif File.exists? requested_template_path
				template_type = :instruction_file
			elsif File.exists? requested_template_path + ".zip"
				template_type = :zip_ball
			else
				# TODO: Raise an exeption.
				puts "Error: the requested template #{requested_template_path} does not exist!"
				exit
			end

			return template_type
		end

		def self.process_instruction_file requested_template_path
			# TODO: Figure out syntax
			#
			# Assumptions to make coding easier for now:
			# * indents are 4 space wide.
			#
			# Every thing that follows # is considered a comment

			File.open( requested_template_path , "r" ) do |template_file|
				# get all lines and delete empty ones
				contents = (template_file.read.split("\n").delete_if { |a| a.empty? })

				# First line must contain type in form of '# Type:<type>'
				# Type acn be either:
				# * constructor - my own script language for this task
				# * shell       - self explanatory really
				script_type = contents.shift.match(%r{Type:\s*(\w+)})[1].to_sym

				# TODO: Write both shell and constructo implementations
			end
		end

		def self.process_shell_instructions
			# TODO: Implement.
		end

		def self.process_construct_instructions
			# TODO: Implement.
		end

		def self.copy_directory_from requested_template_path
			Dir.foreach(requested_template_path) do |filename|
				next if filename == "." || filename == ".."
				FileUtils.cp_r requested_template_path + "/" + filename, Dir.pwd
			end
		end

		def self.unpack_zipball_from requested_template_path
			# TODO: Figure out a prettier way to do this.
			system("unzip \"#{requested_template_path}\" -d \"#{Dir.pwd}\" 1>/dev/null")
		end
	end
end
