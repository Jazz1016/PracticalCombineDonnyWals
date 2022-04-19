import UIKit
import Combine

// Pre Combine

let myUrl = URL(string: "https://www.donnywals.com")!

func requestData(_ completion: @escaping (Result<Data, Error>) -> Void) {
    URLSession.shared.dataTask(with: myUrl) { data, response, error in
//        if let error = error { completion(.failure(error)) {
//            return
//        }
        guard let data = data else {
            return
//        preconditionFailure("If there is no error, data should be
//        􏰀→ present...") }
        }
        completion(.success(data))
    }.resume()
}

// Same functionality with combine

func requestDataCombine() -> AnyPublisher<Data, URLError> {
    URLSession.shared.dataTaskPublisher(for: myUrl)
        .map(\.data)
        .eraseToAnyPublisher()
}

//requestData()
//.decode(type: SomeModel.self, decoder: JSONDecoder()) .map { $0.name }
//.sink(receiveCompletion: { _ in },
//        receiveValue: { print($0) })
