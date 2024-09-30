# iExpense
An expense tracker that separates personal costs from business costs (by Paul Hudson - [@twostraws](https://x.com/twostraws)).

## Archiving Swift objects with `Codable`

Swift will automatically generate some code for us that will archive and unarchive User instances for us as needed, but we still need to tell Swift when to archive and what to do with the data.

This part of the process is powered by a new type called `JSONEncoder`. Its job is to take something that conforms to `Codable` and send back that object in JavaScript Object Notation (JSON) – the name implies it’s specific to JavaScript, but in practice we all use it because it’s so fast and simple.

The `Codable` protocol doesn’t require that we use JSON, and in fact other formats are available, but it is by far the most common. In this instance, we don’t actually care what sort of data is used, because it’s just going to be stored in UserDefaults.

To convert our user data into JSON data, we need to call the `encode()` method on a `JSONEncoder`. This might throw errors, so it should be called with `try` or `try?` to handle errors neatly. For example, if we had a property to store a `User` instance, like this:

```
@State private var user = User(firstName: "Taylor", lastName: "Swift")
```

Then we could create a button that archives the user and save it to `UserDefaults` like this:

```
Button("Save User") {
    let encoder = JSONEncoder()

    if let data = try? encoder.encode(user) {
        UserDefaults.standard.set(data, forKey: "UserData")
    }
}
```