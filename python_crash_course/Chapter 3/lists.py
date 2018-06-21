# creating a list
bicycles = ['trek', 'cannondale', 'redline', 'specialized']
print(bicycles)

# accessing elements 
print(bicycles[0].title())

# go backwards by making index negative 
print("the last index is " + bicycles[-1].title())
print("the second to last index is " + bicycles[-2])

# changing elements 
bicycles[0] = "sport"
print(bicycles)

# adding elements
bicycles.append('family')
print(bicycles)

# inserting elements 
bicycles.insert(1, 'second bicycle')
print(bicycles)

# removing elmeents 
del bicycles[1]
print(bicycles)

print('removing:' + bicycles.pop(-1))
print(bicycles)

# specific item remove
bicycles.remove("sport")
print(bicycles)

# sorting
cars = ['bmw', 'audi', 'toyota', 'nisson']
cars.sort()
print(cars)
noneReverse = sorted(cars)
cars.sort(reverse=True)
print("reversed " + str(cars) + " and not reversed " + str(noneReverse))

# reverse contents 
cars = ['bmw', 'audi', 'toyota', 'nisson']
cars.reverse()
print(cars)

# length
print(len(cars))