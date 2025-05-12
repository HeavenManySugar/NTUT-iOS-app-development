import UIKit
import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack {
                Color.red
                    .frame(height: 100)
                Color.blue
                    .frame(height: 100)
                Color.green
                    .frame(height: 100)
                Color.yellow
                    .frame(height: 100)
            }
        }
    }
}

#Preview {
    ContentView()
}
