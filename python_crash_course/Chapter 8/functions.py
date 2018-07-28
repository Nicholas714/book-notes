import pizza 
# use as pizza.function_name
# rename with import pizza as p used as p.function_name
# use from pizza import function_name to have only a certain function 
# from pizza import function_name as fn use as pizza.fn
# remove need for pizza as import pizza *
def say_hello(first, last, middle=''):
	if middle:
		return first.title() + " " + middle.title() + " " + last 
	else:
		return first.title() + " " + last.title()

def print_all(values):
	for value in values:
		print(value)

print(say_hello("nicholas", "grana", "frank"))
print(say_hello("bob", "boo"))

print_all("nicholas")
print_all(["im", "cool!"])

# to copy a list pass in [:]

def print_all(*values):
	for value in values:
		print(value)

print_all(1, "nicholas", "b")

pizza.make_pizza(12, "sause", "cheese")

# also callable with
print(say_hello(first="tim", last="cook"))