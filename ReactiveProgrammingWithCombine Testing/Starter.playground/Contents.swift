import Foundation
import Combine


example(of: "Just publisher and sink subscription") {
    
    var subscriptions = Set<AnyCancellable>()
    
    let just = Just("Helo World!")  // Publisher
    
    let subscription = just
    .sink(receiveCompletion: { print("Recieved completion:", $0) },
          receiveValue: { print("Received:", $0) })
    
    subscription.cancel()  // Telling to the publisher I no longer want to recieve values from you
    
    just
    .sink(receiveCompletion: { print("Recieved completion 2:", $0) },
          receiveValue: { print("Received 2:", $0) })
    .store(in: &subscriptions)
}
