message = "What is your age? "
age = int(raw_input(message))

if age < 21:
	print("You are under 21.")
else:
	print("You are 21 or above.")

message = "Say something cool."
response = ""

while response != 'quit':
	response = raw_input(message)
	print("I say back: " + response)

print("Done!")
