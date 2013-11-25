# OOP in Ruby
# 1. classes and objects
# 2. methods contain behaviors
# 3. instance variables contain states
# 4. objects are instantiated from class, and contain states and behaviors
# 5. class variables and methods
# 6. compare with procedural
class Dog
  attr_accessor :name, :height, :weight

  @@count = 0

  def self.total_dogs
    "Total number of dogs: #{@@count}"
  end

  def initialize(n, h, w)
    @name = n
    @height = h
    @weight = w
    @@count += 1
  end
  # this is the setter and can be done by attr_accessor
  def set_name=(new_name)
  @name = new_name
  end

  # it is ok to call instance method in other instance method
  def info
    "#{name} is #{@height} feet tall and weight #{@weight} pounds"
  end

  # to use setter, we call the setter method (which is done by attr_accessor) by self.setter_method
  # that is to say, we need self. to tell Ruby it's on setter_method
  # if we use instance variable like @name = n, it still works, but it will change the raw data
  # we don't want this.
  # because use getter/setter, give us a chance to check/intercept some important data
  # for example:
  # def ssn
  #   #555-55-555
  #   "xxx-xx" + @ssn.split('-').last
  # end
  def update_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

end

teddy = Dog.new('teddy')
puts teddy.set_name = "Rose"
# it is the same syntax:
# def set_name(new_name)
# @name = new_name
# end
# teddy.set_name("Rose")

puts Dog.total_dogs