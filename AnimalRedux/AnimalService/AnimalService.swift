//
//  AnimalService.swift
//  AnimalRedux
//
//  Created by Кирилл Тила on 22.05.2022.
//

import Combine
import Foundation

enum AnimalServiceError: Error, CaseIterable {
    case unknown
    case networkError
}

struct AnimalService {
    
    var requestNumber: Int = 0
    
    func generateAnimals() -> AnyPublisher<String, AnimalServiceError> {
        let animals = ["Cat", "Dog", "Crow", "Horse", "Iguana", "Cow", "Racoon"]
        let number = Double.random(in: 0..<5)
        return Future<String, AnimalServiceError> { promise in
            DispatchQueue.global(qos: .background).asyncAfter(deadline: .now() + number) {
                let randomError = Int.random(in: 0..<2)
                if randomError != 0 {
                    let result = animals.randomElement() ?? ""
                    promise(.success(result))
                }
                promise(.failure(AnimalServiceError.allCases.randomElement()!))
                
            }
        }
        .eraseToAnyPublisher()
    }
    
}
