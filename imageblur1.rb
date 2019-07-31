class Image

	# Initialize Array
	def initialize (array)
		@array = array
	end

	# Print all elements
	def output_image
		@array.each do |input|
			puts input.join
		end
	end
end
# -----------------------------------------
# Image input 2d array
image = Image.new([
	[1, 1, 0, 1],
	[0, 1, 0, 1],
	[0, 1, 1, 1],
	[0, 1, 0, 1]
])

# Call statement
image.output_image