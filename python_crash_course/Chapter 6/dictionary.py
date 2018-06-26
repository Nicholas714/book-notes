alien_0 = {'color': 'green', 'points': 5}

# printing singular 
print(alien_0['color'])
print(alien_0['points'])

# printing key + value 
for (key, value) in alien_0.items():
	print("the alien's " + key + " is " + str(value))

# modifying 
alien_0['color'] = 'yellow'
print(alien_0)

# adding new values 
alien_1 = {}
alien_1['color'] = 'blue'
alien_1['points'] = 25
print(alien_1)

# removing 
del alien_1['points']
print(alien_1)

# looping through keys or values 
for key in alien_0.keys():
	print(key)
for key in alien_0:
	print(key)
for value in alien_0.values():
	print(value)

# looping in order 
for key in sorted(alien_0):
	print(key)

# checking if not in
print('points' not in alien_0)

# array of
aliens = [alien_0, alien_1]
for alien in aliens:
	print(alien)

alienDictionary = {'bob': {'color': 'red', 'points': 5}, 'tim': {'color': 'orange', 'points': 20}}
print(alienDictionary)