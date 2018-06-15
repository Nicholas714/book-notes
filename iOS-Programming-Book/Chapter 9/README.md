# Chapter 9 - Debugging

## A Buggy Project

* Xcode's debugger is called LLDB, which is the tool that helps find bugs and fix them
* Renaming a IBAction function and not rehooking it up = NSInvalidArgumentException and tells you "unrecognized selector sent to instance xxx"
* The bulk is called a stack trace, a list of all functions or methods that were called up to the point of the application crash
Example:
0 CoreFoundation	[...]	__exceptionPreprocess + 171
call number, module name, memory address, function or method
* Other things may be like putting a UISwitch instead of a UIButton, which when called and you use a UISwitch function there will be an error
* print statements are not removed when built for release 
* Sometimes using Objective-C classes can make it much harder to find where bugs exist
* This creates helpful need for break points
* When you activate breakpoints, you will have a nice debug display: debug navigator (calling functions), variables view (showing values of variables), debug area, debug bar (controlling current), console
* Controllers include: continue program execution as normal, step over (don't go inside the method call), step into (enters function), step out (continues until the current function is exited)
* Using step into you can go line by line and examine values (green thing will pop up on side) and mouse over to see value
* You can even put sounds on breakpoints when they run! (click "Edit Breakpoint")
* Delete breakpoints by dragging them away
* Another cool thing is go to the breakpoint tab at bottom left and click + and set "Exception Breakpoint" and add it. This will make a breakpoint at a line that throws an exception to easily debug it
* Another cool one is a "Symbolic Breakpoint" which will stop every time a method is called (click + then symbolic breakpoint and type in your method name as the symbol)
* Swift has 4 literal expressions that can be used for logging information:
```print(print("Method \(#function) in file: \(#file) line: \(#line) called."))```
#file - String - the name of the file where the expression appears
#line - Int - the line number the expression appears on
#column - Int - the column number the expression begins in
#function - String - the name of the declaration the expression appears in

## The Console

* Xcode's LLDM console is great, butis also has a command line interface to type in commands
* It is active whenever there is a blue (lldb) prompt on the console (happens for breakpoints)
* type in step to step, po self to print the self reference, and even po array to see array contents (po = print-object)
* *Another cool ons ie expr which runs an expression like ```expr self.view.tinyColor = UIColor.red``` and then ```continue```
* For more commands, enter help in the lldb list