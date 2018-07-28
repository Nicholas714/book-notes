import restaurant 
import fast_food

restaurants = [restaurant.Restaurant("Jimmy Burgers", "burgers"), restaurant.Restaurant("Pizza Antica", "pizza"), restaurant.Restaurant("Carls Home", "nuggets"), fast_food.FastFood("McNicks", 24)]

for r in restaurants:
	r.open()

