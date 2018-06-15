# basic string usage
message = "hello world"
print(message)

message = "hello, world again"
print(message)

name = "nicholas grana"
print(name.title())
print(name.upper())
print(name.lower())
print("    far away".lstrip())

print("this is the " + str(4) + "th language I know")

# concatination (swift uses string interpolation)
first_name = "nicholas"
last_name = "grana"
full_name = first_name + " " + last_name
print(full_name)

message = "Hello, " + full_name.title() + "!"
print(message)

# special characters
message = "Languages:\n\tPython\n\tSwift\n\tJava"
print(message)

