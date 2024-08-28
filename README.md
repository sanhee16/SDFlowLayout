 # SDFlowLayout

SDFlowLayout is a fluid FlowLayout created with SwiftUI. This package is designed for iOS 14 and allows you to easily implement a GridView with flexible widths.


## Requirements

iOS 14.0
macOS 11.0  

## Features

- Supports a GridView with flexible widths.
- Easily customizable using SwiftUI views.
- Compatible with various data collections.

## Installation
You can install this package using Swift Package Manager. Add the following dependency to your Package.swift file:
### Swift Package Manager

```swift
/// Package.swift
/// ...
dependencies: [
    .package(url: "https://github.com/sanhee16/SDFlowLayout.git", branch: "main"),
]
/// ...
```

## Usage  
## Usage  

Here’s a simple example of how to use SDFlowLayout:
```swift
import SwiftUI
import SDFlowLayout

struct ContentView: View {
    let items = ["Item 1", "Item 2", "Item 3", "Item 4"]

    var body: some View {
        SDFlowLayout(data: items, id: \.self) { item in
            Text(item)
                .padding()
                .background(Color.blue)
                .cornerRadius(5)
        }
    }
}
```
### Parameters
- data: The collection of data to display.
- id: A key path to identify each data item.
- content: A closure that generates a view for each data item.
- viewBackground: The background color of the view (default: white).
- cloudBackground: The cloud background color (default: gray).
- font: The font for the text (default: body font).
- action: A closure to perform a specific action.


## Contributing
If you would like to contribute, please fork this repository and submit a pull request.



## Author

sanhee16, sinhioa20@gmail.com
