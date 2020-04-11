[TOC]

Swift Version for this snippet: 5

# Using Overlays

You can use the SwiftUI `overlay` modifier to achieve this effect:

```Swift
var body: some View {
    Color.black // The color you want to have in the background
    .edgesIgnoringSafeArea(.all)
    .overlay(
        // Your view
    )
}
```

# Custom View Modifiers to the Rescue!

To make this idea reusable, here is a view extension, that realizes just that!

```Swift
extension View {
    @inlinable public func background<Background>(
        _ background: Background,
        edgesIgnoringSafeArea edges: Edge.Set
    ) -> some View where Background : View {
        return background
        .edgesIgnoringSafeArea(edges)
        .overlay(self)
    }
}
```

Usage:

```Swift
var body: some View {
    YourView()
    .background(Color.black, edgesIgnoringSafeArea: .all)
}
```

Happy Coding!
