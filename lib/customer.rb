require 'pry'
class Customer

    #initializes with a name and age
    attr_accessor :name, :age
    @@all = []

  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  #is class method that returns the contents of @@all
  def self.all
    @@all
  end

  #initializes a meal using the current Customer instance, 
  #a provided Waiter instance and a total and tip
  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  #returns an Array of Meal instances associated with this customer
  def meals
    Meal.all.select do |meal|
        meal.customer == self
    end
  end

  #returns an Array of Waiter instances associated with this customer's meals
  def waiters
    #binding.pry
    meals.map do |meal|
        meal.waiter
    end
  end
end