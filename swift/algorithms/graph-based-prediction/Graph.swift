import Foundation


struct Edge: Codable, Hashable {
    let origin: String
    let destination: String
    var weight: Int = 1

    public mutating func strengthen() {
        // Strengthen the edge to increase its importance
        weight += 1
    }
}


struct RouteGraph: Codable {
    var edges: [Edge] = []
    var lastVisitedLocation: String? = nil

    public mutating func visit(newLocation: String) {

        // At the very first visit, there is no last visited location yet,
        // so we set the last visited location to create an edge next time
        guard let lastVisitedLocation = lastVisitedLocation else {
            self.lastVisitedLocation = newLocation
            return
        }

        // Create the new edge between the last visited
        // location and the current location
        let newEdge = Edge(origin: lastVisitedLocation, destination: newLocation)

        if let index = edges.firstIndex(where: { edge in
            return edge.origin == newEdge.origin && edge.destination == newEdge.destination
        }) {
            // If this edge is already in the graph,
            // strenghten it instead of adding it to the graph
            edges[index].strengthen()
        } else {
            // Otherwise, append it to the existing edges
            edges.append(newEdge)
        }

        // Finally, set the current location from which
        // we will create the next edge
        self.lastVisitedLocation = newLocation
    }

    public func getLocationSuggestions() -> [String] {
        guard let lastVisitedLocation = lastVisitedLocation else {return []}

        // Get applicable suggestions. To do this:
        // - get all edges, which have the last visited location as origin
        // - sort all edges by their importance (i.e. their weight)
        // - get the destination from each of these edges

        return edges
            .filter {$0.origin == lastVisitedLocation}
            .sorted {$0.weight > $1.weight}
            .map {$0.destination}
    }

}
