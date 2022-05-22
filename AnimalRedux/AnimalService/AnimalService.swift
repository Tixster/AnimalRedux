//
//  AnimalService.swift
//  AnimalRedux
//
//  Created by Кирилл Тила on 22.05.2022.
//

import Combine
import Foundation

struct AnimalService {
    
    func generateAnimals() -> AnyPublisher<String, Never> {
        let animals = ["Cat", "Dog", "Crow", "Horse", "Iguana", "Cow", "Racoon"]
        let number = Double.random(in: 0..<5)
        return Future<String, Never> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + number) {
                let result = animals.randomElement() ?? ""
                promise(.success(result))
            }
        }
        .eraseToAnyPublisher()
    }
    
}
