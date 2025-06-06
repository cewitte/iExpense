# iExpense
An expense tracker that separates personal costs from business costs (by Paul Hudson - [@twostraws](https://x.com/twostraws)).

![Home screen](images/iexpense_1_medium.png)

![Add expense](images/iexpense_2_medium.png)

![Updated home](images/iexpense_3_medium.png)

### Project 12 - Challenge 1: Start by upgrading it to use SwiftData 

Source URL: [link](https://www.hackingwithswift.com/books/ios-swiftui/swiftdata-wrap-up)

Branch: `project-12-challenge-1`

### Project 12 - Challenge 2: Add a customizable sort order option: by name or by amount

Source URL: [link](https://www.hackingwithswift.com/books/ios-swiftui/swiftdata-wrap-up)

Branch: `project-12-challenge-2`

### Project 12 - Challenge 3: Add a filter option to show all expenses, just personal expenses, or just business expenses

Source URL: [link](https://www.hackingwithswift.com/books/ios-swiftui/swiftdata-wrap-up)

Branch: `project-12-challenge-3`

### Accessibility challenge

Source URL: [link](https://www.hackingwithswift.com/books/ios-swiftui/fixing-bookworm)

Branch: `accessibility-challenge`

>Fix the list rows in iExpense so they read out the name and value in one single VoiceOver label, and their type in a hint.

```swift
var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    
                    Spacer()
                    
                    Text(item.amount, format: .currency(code: "USD"))
                }
                // Fix the list rows in iExpense so they read out the name and value in one single VoiceOver label, and their type in a hint.
                .accessibilityElement()
                .accessibilityLabel("\(item.name): \(item.amount)")
            }
            .onDelete(perform: removeItems)
        }
    }
```

`.accessibilityElement` makes the child views invisible to VoiceOver while `.accessibilityLabel` provides a custom label to the parent View.

## Acknowledgments

Original code created by: [Paul Hudson - @twostraws](https://x.com/twostraws) (Thank you!)

Made with :heart: by [@cewitte](https://x.com/cewitte)