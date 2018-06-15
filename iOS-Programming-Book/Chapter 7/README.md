# Chapter 7 - Localization

## Localization

* Internationalization = making sure information (date, number format, currency, etc) is displayed correctly
* Localization = providing appropriate sentences in application based on language
* To get current region locale, use Local.current
* For example, we set the text field to block multiple decimals being entered (1.2.3) but that is a Internationalization problem because we need to check for the decimal separator not only a period
* Also, for example 1,2 is not a double so we have to make a NumberFormatter use it
* Locale.current only has a few things, like currency, decimal separators, etc. but it is missing a key feature: language. This is handled by Internationalization

## Internationalization

* Done either with string tables, or multiple copies of resources (images, sounds, interface files) that will be set for different regions
* An Application Bundle is packaged with your all that contains all your resources (main bundle). You can access this Bundle with an instance of the class Bundle, and many classes to do load specific resources
* These files are placed inside lproj file with language-code_region-code as, for example, en_US so the english one is en_US.lproj
* When an application needs a value it looks inside the main bundle for an file with the language/region code and then loads in that file for specific resources for that region (if it does not find one, it looks at the locale and language settings of the device and loads the file from there)
* So the process is fully automatic
* Problem: You make 10 region storyboard files and you have to add a button to the english one, and now you need to add it 10 times
* Solution: Base Internationalization--which creates the Base.lpoj directory which contains main interface files. Localizing then is just providing a Localizable.strings file for all the string values)

## Preparing for Localizing

* View -> Assistant Editor -> Show Assistant Editor and then Preview -> X will show the view with Localization (and even change sizes with different phones)
* Xcode puts in pseudolanguage that is double-length so "hey" becomes "hey hey" to account for extreme language cases where it is much longer (if it fits then, it fits anywhere)-- to do this, select language and click it
* Trailing Space to Safe Areas makes it so it does not go out of the view (>= makes it the margin padding is >= 0)
* To localize Main.storyboard: Option+Command+1 and then see the Localization section, checking the box will now put it into a file under the Main.storyboard hierarchy for your editing.
* To add more languages select your project at the top and open the tab and then add new language and a new table will be added
* There is an Xcode bug if it does not work, see Pg. 135

## NSLocalizedString and String tables

* Many times strings are dynamically created and not specifically for storyboards, to display translated versions you must have a string table (key-value pairs)
* To make a string table, use NSLocalizedString("Value", comment: "Displayed above")
* We got code, but how to make the string table? Use a command line tool to generate it from your code
* cd into your directory and use 'genstrings MyFancyClass.swift' and this will create a Localizable.strings file (drag into Xcode)
* Open the new file and click "Localize" and then check the languages you want and it will generate those files and supply with translations

## For the more curious

* A Bundle represents a location on a file system that groups compiled code and resources together
* It can also be used to search ```let path = Bundle.main.url(forResource: "Boo", withExtension: "png")```
* The return will be a full URL from the search for it or nil if not found. Then you can have many images and the image name can be inside the string table like "\(pathNameFromL10n)" and load Tom.png for EN and Bob.png for ES
* The industry standard for Localization is XLIFF which Xcode natively supports importing from and exporting to
* How? Select the project and Editor > Export For Localization and follow the steps or Editor > Import Localizations
