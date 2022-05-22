//
//  Middleware.swift
//  AnimalRedux
//
//  Created by Кирилл Тила on 22.05.2022.
//

import Foundation
import Combine

enum AnimalMiddlewareError: Error {
    case unknown
    case networkError
}

struct AnimalMiddleware {
    
    static func middleware(service: AnimalService) -> Middleware<AppState, ReduxAction> {
        return { state, action in
            guard let action = action as? AnimalAction else {
                return Empty().eraseToAnyPublisher()
            }
            switch action {
            case .getAnimal:
                return service.generateAnimals()
                    .subscribe(on: DispatchQueue.main)
                    .map({ AnimalAction.fetchComplete(animal: $0)})
                    .catch { (error: AnimalServiceError) -> Just<ReduxAction> in
                        switch error {
                        case .unknown:
                            return Just(AnimalAction.fetchError(error: AnimalMiddlewareError.unknown))
                        case .networkError:
                            return Just(AnimalAction.fetchError(error: AnimalMiddlewareError.networkError))
                        }
                    }
                    .eraseToAnyPublisher()
            default: break
            }
            return Empty().eraseToAnyPublisher()
        }
    }
    
}

func logMiddleware() -> Middleware<AppState, ReduxAction> {
    return { state, action in
        print("Triggered action: \(action)")
        return Empty().eraseToAnyPublisher()
    }
}
