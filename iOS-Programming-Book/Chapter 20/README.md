# Chapter 20 - Web Services 

## Web Services 

* HTTP works by having your computer send a request to a server and the server sending back the requested page so the browser can format and display it
* There are usually parameters supplied in the URL to have the request customized 
* JSON = JavaScript Object Notation - a highly used way to parse data when requested from a website so quickly turn it into an object for use 
* There are many types of requests, see FlickrAPI.swift to see how to correctly build a URL and have it maintainable for different requests within an application 
* baseURL makes up URLComponents object, which then you can set the queryItems to add specific parameters 
* A request to make to a server is represented by URLRequest, which stores info for the request such as a timeout interval, a cache policy, and other metadata about the request 
* URLSession API is a collection of classes that use a request to communicate with a server in different ways
* URLSessionTask is responsible for communicating with a server 
* URLSession class is responsible for creating tasks that match a given configuration 
* PhotoStore will construct the URL Session from FlickrAPI and fetch images  
* Use property injection to set the PhotoStore from the AppDelegate 

## URL Session

* URLRequest has a few properties, allowsCellularAccess (gives access to LTE stuff), cachePolicy (how cache is used), allHTTPHeaderFields (meta data like character encoding), httpMethod (get, post, put, delete), timeoutInterval (how long it will try max)
* The class that starts the communication is URLSessionTask, which has 3 types (URLSessionDataTask to retrieve data, URLSessionDownloadTask to receive data and download it to file system, and URLSessionUploadTask to send data to a server)
* URLSession acts as a factory so you do not have to configure and setup all these different tasks (factory method!), but you can if you need to
* For example, session.dataTask(...) creates a URLSessionDataTask in the suspended state, so to start it use resume 
* After getting the data by getting the jsonString returned from the request, convert it to an object (here, Photo)
* JSON is just "key": "value" syntax, like a dictionary 
* JSONSerialization is used to separate each object and store in an array for parsing 
* Confirm it meets the required structure by checking if the object is [String: Any], etc 
* Requests as async, so usually a completion handler is called back when finished
* @escaping is used for a closure to signify that it may not get called immediately within the method 

## The Main Thread 

* Multi core processors allow multiple chunks of code to run at the same time, called parallel computing and when being run at the same time, concurrency 
* Main thread is used to modify the UI, while UISessionDataTask runs the completion handler in the background thread 
* To change thread to change something in the UI, use OperationQueue.main.addOperation { stuff }

## For the More Curious: HTTP

* HTTP specification is very specific to how requests can be made 
* A HTTP request has 3 parts: a request line, request headers, and an optional request body
* GET/POST mostly used, one for getting a resource and one for posting values
