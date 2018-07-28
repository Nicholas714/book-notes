import restaurant  

class FastFood(restaurant.Restaurant):

	def __init__(self, restaurant_name, hours):
		super(FastFood, self).__init__(restaurant_name, "fast food")
		self.restaurant_name = restaurant_name
		self.hours = hours 
		self.driveThroughOpen = True 

	def open(self):
		print(self.restaurant_name.title() + " open " + str(self.hours) + " hours with drive through " + str(self.driveThroughOpen))