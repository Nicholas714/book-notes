class Restaurant(object):

	def __init__(self, restaurant_name, cuisine_type):
		self.restaurant_name = restaurant_name
		self.cuisine_type = cuisine_type
		self.tipPrice = 5

	def open(self):
		print(self.restaurant_name.title() + " is now open and serving fresh " + self.cuisine_type.lower() + " with tip price " + str(self.tipPrice))