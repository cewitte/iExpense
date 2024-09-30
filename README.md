# iExpense
An expense tracker that separates personal costs from business costs (by Paul Hudson - [@twostraws](https://x.com/twostraws)).

## Storing user settings with `UserDefaults` and `@AppStorage`

You can use both `UserDefaults` and `@AppStorage` to store user data in between sessions (when a user closes the app and opens it back again), although the latter is easier to use.

To use `UserDefaults`, you can do like this:

```
UserDefaults.standard.set(tapCount, forKey: "Tap")
@State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
```

`@AppStorage` is much easier. All it takes is:

`@AppStorage("tapCount") private var tapCount = 0`

**Important:** When it comes to you submitting an app to the App Store, Apple asks that you let them know why you're loading and saving data using UserDefaults. This also applies to the `@AppStorage` property wrapper. It's nothing to worry about, they just want to make sure developers aren't trying to identify users across apps.