# Chapter 22 - Core Data

## Object Graphs 

* A collection of objects is called an object graph
* You tell Core Data the relationship between model objects and it will make sure their life time is consistent and updated 
* Core Data takes complete control of storage (it is usually an SQLite database), you would not even know how it is stored. You tell Core Data what needs to be stored and it will figure out how to store it 

## Entities 

* A relational database contains a table, which represnets a table (for ex: a Person table) where each row is an instance of person and each column is a type property (name, age, etc) which are called attributes 
* An entity would be a Photo model, and its attributes would be things like photoID
* In order to create a table, Command+N and create a new Data Model then add each property/attribute that needs to be stored that is inside the model by specifing its name and type
* For custom types, such as URL, set it to be Transformable

## Transformable

* For values that are not by default inside the Core Data type inspector (URL, etc), you set it to Transformable so it can be converted to a type that can be stored and then converted back when loading
* To do this, you make a subclass of ValueTransformer or if not set it will use NSKeyedUnarchiveFromDataTransformer which converts back and forth between data (as NSURL supports NSCoding, this class can automatically be used instead of subclassing from ValueTransformer

## NSManagedObject and subclasses 

* When an object is fetched by Core Data, it will return an NSManagedObject (sort of a data container)
* This is automatically generated by the Core Data object graph file by selecting the model class and open Left-Pane and click Codegen Manual/None and Editor > Create NSManagedObject item from menu
* Now, everything you need to add will go inside Model+CoreDataClass.swift 
* @NSManaged keyword shows that the variable is being controlled by CoreData and is no longer a constant and optional as it will be set at runtime

## NSPersistentContainer 

* There are many classes in the Core Data stack, but NSPersistentContainer abstracts them away 
* To create one, the name in the constructor must be the name of the data model file that contains all the entities 
* By default, this stores as a SQLite database and will require a compleition handler as it can take some time to complete 
* Now, you can interact with Core Data using its viewContext (which returns a NSManagedObjectContext that allows you to interact with your entities)
* This context is like a scratch pad, which is able to bring temp copies of entities into memory for a search for objects, use perform() (async) or performAndWait() (sync)
* To actually save, call persistentContainer.viewContext.save() 
* Things can be downloaded multiple times, so to prevent saving double ensure there are no duplicated photoID inside the data 

## Fetching Data

* This is done using a NSFetchRequest, and after it is executed you will get an array of the objects you are searching for
* sortDescriptors is an array that explains how to sort the data. Why an array? In case there are 2 that are the same, it will look at the next one (for instance, two same last names will look at the next descriptor which looks at first names too)
* NSPredicate is a class that containts a condition that must be true/false (for ex: NSPredicate(format: "#keyPath(Photo.photoID) == \(id)")) see Predicate Programming for more 
