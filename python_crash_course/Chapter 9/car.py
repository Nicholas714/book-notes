class Restaurant(object):

	def __init__(self, restaurant_name, cuisine_type):
		self.restaurant_name = restaurant_name
		self.cuisine_type = cuisine_type

	def open():
		print(restaurant_name.title() + " is now open and serving fresh " + cuisine_type.lower())