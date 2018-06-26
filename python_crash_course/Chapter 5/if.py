companies = ['Apple', 'Microsoft', 'Tesla']

if 'Apple' in companies and 'Microsoft' in companies:
	print("Lots of competition.")

age = 23

if age < 18:
	print("not old enough")
elif age < 21:
	print("almost there")
else:
	print("you are old enough!")

if 'Amazon' not in companies or 'Google' not in companies:
	print("Not in!")

if companies:
	print("not empty!")
