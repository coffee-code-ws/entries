import SwiftUI


/// A twitter view which shows the output.dd twitter feed.
struct TwitterView: View {
    @State private var isLoading = true

    private var newTweetURL: URL {
        // Create a new tweet with @OUTPUT.DD as text (urlencoded)
        let urlString = "https://twitter.com/intent/tweet?text=%40OUTPUT.DD"
        guard
            let url = URL(string: urlString)
        else { fatalError("Erroneous tweet url detected!") }
        return url
    }

    var body: some View {
        NavigationView {
            ZStack {
                TwitterHTMLView { loadingState in
                    switch loadingState {
                    case .idle:
                        isLoading = false
                    case .loading:
                        isLoading = true
                    }
                }
                if isLoading {
                    VStack {
                        Text("Loading Twitter Feed...")
                        ProgressView()
                    }
                }
            }
            .edgesIgnoringSafeArea(.vertical)
            .navigationBarTitle("Twitter")
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    Link(destination: newTweetURL, label: {
                        HStack {
                            Image(systemName: "plus")
                            Text("Tweet")
                        }
                    })
                }
            }
        }
    }
}
