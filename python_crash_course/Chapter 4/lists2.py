
# for loops and indenting 
magicians = ['alice', 'danny', 'nick']
for magician in magicians:
  print(magician.upper())
  print(magician.title() + " will now perform a trick! BOOM!\n")

print("That's all the tricks for today, folks!")

# printing 1 to 5 with range
for i in range(1, 6):
  print(i)

# creating a list with range
numbers = list([1, 2])
numbersTo10 = list(range(1, 11))
print(numbers)
print(numbersTo10)

# advancements to range (increment parameter) - printing evens 
print(list(range(2, 10, 2))) 

# statistics 
print(min(numbersTo10))
print(max(numbersTo10))
print(sum(numbersTo10))

# for loops + math + array
sqaures = []
for i in range(1, 11):
  sqaures.append(i**2)
print(sqaures)

# same thing with list comprehensions (1 line + loop inside a [])
print([value**2 for value in range(1, 11)])

# exercises 
print(sum(range(1, 1000001)))
print(range(1, 21, 2))
print([value*3 for value in range(3, 31)])

# slices
players = ['nick', 'charles', 'martina', 'eli']
print(players[0:2])
print(players[:2])
print(players[-2:])

# slices to copy a list
food = ['pizza', 'sushi', 'hamburger']
fav_food = food[:]
print(food == fav_food)
food.append('french fries')
print(food == fav_food)

# tuples immutable 
point = (2, 10)
print(point[0])
print(point[1])
# but reassignable 
point = (3, 4)

# 4 space for indents (tab in sublime = 4 spaces)

