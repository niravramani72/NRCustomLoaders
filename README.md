# NRCustomLoaders

`NRCustomLoaders` is a Swift package providing a suite of customizable loading indicators and progress bars for SwiftUI applications. This package includes various loader types such as linear, circular, pulsing, and dot-based loaders to enhance user experience during loading states.

## Components

### 1. `CircularLoader`
A circular loader that displays a rotating animation to indicate a loading state.

### 2. `DotLoader`
A dot-based loader where multiple dots animate to indicate loading.

### 3. `LinearProgressBar`
A customizable linear progress bar that shows progress as a horizontal bar.

### 4. `PulsingLoader`
A pulsing loader that uses a pulsating animation effect to indicate loading.


## Installation

### Using Swift Package Manager

1. Open your Xcode project.
2. Navigate to `File` > `Add Packages...`.
3. Enter the URL of the `NRCustomLoaders` package repository (or choose "Add Local Package" if you're using a local package).
4. Select the package and add it to your project.

### Manual Installation

1. Clone the repository:
   ```sh
   git clone https://github.com/niravramani72/NRCustomLoaders.git
   ```
2. Drag the `NRCustomLoaders` folder into your Xcode project.


## Example

Here is a complete example of using the dynamic loaders in a SwiftUI view:

```swift
import SwiftUI
import NRCustomLoaders

struct ContentView: View {
    @State private var isLoading = true
    @State private var progress: Double = 0.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Button("Toggle Loading") {
                isLoading.toggle()
                progress = 0.0
            }
            .padding()
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(8)
            
            Text("LinearProgressBar")
                .padding()
 
            LinearProgressBar(progress: progress, color: .blue, lineWidth: 8, animationDuration: 1.0)
                           .frame(height: 20)
                           .padding()
            
            Button("Animate Linear Progress") {
                progress = 1.0
            }.padding()
            
            HStack() {
                Text("CircularLoader")
                    .padding()
                CircularLoader(isLoading: isLoading)
                    .padding()
            }
            
            HStack {
                Text("PulsingLoader")
                    .padding()
                PulsingLoader(isLoading: isLoading)
                    .padding()
            }
            
            HStack {
                Text("DotLoader")
                    .padding()
                DotLoader(isLoading: isLoading)
                    .padding()
            }
            Spacer()
           
        }
        .padding()
    }
}
```
