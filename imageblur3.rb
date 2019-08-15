class Image
  require 'byebug'

  # Initialize array, row length, column length within the scope of the class
  def initialize(array)
    @array = array
    @row_length = array.length
    @col_length = array[0].length
  end


  # Pixel blur function
  def blur(y, x)
    @array[y - 1][x] = 1 if value_in_cords(y - 1, x) == 0
    @array[y + 1][x] = 1 if value_in_cords(y + 1, x) == 0
    @array[y][x - 1] = 1 if value_in_cords(y, x - 1) == 0
    @array[y][x + 1] = 1 if value_in_cords(y, x + 1) == 0
  end

  # Locate 1's
  def value_in_cords(y,x)
    row = @array[y]
    col = @array[x]
  	return nil if row.nil? || col.nil?
    return nil if x.nil? || x < 0
  	row[x]
	end

  # Locate 1's and push to array
  def find_ones
    one_pixel = []
    @array.each_with_index do |row_array, row_index|
      row_array.each_with_index do |cell, col_index|
        if cell == 1
          one_pixel << [row_index, col_index]
        end
      end
    end    
    one_pixel	# Return 2D array with location values
  end

  # Transform 1's
  def transform(ans)
    ans.times do
      find_ones.each do |x, y|
        blur(x, y)
      end
    end  
  end

  # Print function
  def output_image
    @array.each do |row|
      row.each do |pixel|
        print pixel, ' '
      end 
      puts	# Print new line after each row
    end 
  end 
end

# Collect number from user
puts "How many times should we blur the image?"
ans = gets.to_i

# Image Input
image = Image.new([
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0],
  [1, 0, 0, 0, 0, 0]
])

# Call / Print statements
image.output_image
puts "-------------"
image.transform(ans)
image.output_image