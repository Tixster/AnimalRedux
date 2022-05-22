//
//  Middleware.swift
//  AnimalRedux
//
//  Created by Кирилл Тила on 22.05.2022.
//

import Foundation
import Combine

struct AnimalMiddleware {
    
    static func middleware(service: AnimalService) -> Middleware<AppState, ReduxAction> {
        return { state, action in
            guard let action = action as? AnimalAction else {
                return Empty().eraseToAnyPublisher()
            }
            switch action {
            case .fetchAnimal:
                return service.generateAnimals()
                    .subscribe(on: DispatchQueue.main)
                    .map({ AnimalAction.setCurrentAnimal(animal: $0)})
                    .eraseToAnyPublisher()
            default: break
            }
            return Empty().eraseToAnyPublisher()
        }
    }
    
}
