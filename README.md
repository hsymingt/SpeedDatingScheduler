I used an MVVM architecture which is mostly successful at maintaining a clear separation of concerns, but there are a few things that should ideally be moved around. For example, pretty much all of the UI is configured in the view controller when realistically that configuration should live in the presenter. I built it all out in the view controller to get it working quickly with the intention of later pulling it out in the presenter but didn't get around to that.

With regard to data persistance I ended up using UserDefaults. CoreData actually makes way more sense to use in this situation but I spent a lot of time (definitely too much time) trying to get it to work (I have never actually used core data directly before) and then ultimately decided to switch to UserDefaults so that I wouldn't waste any more time. If I had gotten CoreData to work I would have also implemented pagination to optimize performance, and would have ensured that the data access was thread safe in order to prevent any potential race conditions.

I also did not implement any error handling, but would have liked to had I had more time.

With regard to additional functionality, I would have liked to create an additional screen containing event details that would appear when you tap on an event from the list

I didn't get around to completing the random user API integration. I did create a data manager that executes the request successsfully, but I did not have time to build out all of the models necessary to decode the json into objects and build out the UI piece.
