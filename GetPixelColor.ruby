require 'rubygems'
require 'chunky_png'

image = ChunkyPNG::Image.from_file('X.png')
puts image.dimension.height
var = image.dimension.width
puts var;
var-=1;
i = 0;
z = 0;
u = 0;
zu = 0;
array = [];
while i < var do

  i+=1;
  r= ChunkyPNG::Color.r(image[i,0])
  g= ChunkyPNG::Color.g(image[i,0])
  b= ChunkyPNG::Color.b(image[i,0])
  a= ChunkyPNG::Color.a(image[i,0])

   print "#{r}#{g}#{b}#{a} "


end

#array = array.reverse;
