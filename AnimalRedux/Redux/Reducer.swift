//
//  Reducer.swift
//  AnimalRedux
//
//  Created by Кирилл Тила on 22.05.2022.
//

import Foundation
import Combine

struct RootReducer: ReduxReducer {
    
    let animalReducer: AnimalReducer = .init()

    func reduce(_ state: inout AppState, _ action: ReduxAction) {
        animalReducer.reduce(&state.animal, action)
    }

}

struct AnimalReducer: ReduxReducer {
    
    func reduce(_ state: inout AnimalState, _ action: ReduxAction) {
        guard let action = action as? AnimalAction else { return }
        switch action {
        case .getAnimal:
            state.fetchInProgress = true
            state.fetchError = nil
        case .fetchError(let error):
            state.fetchInProgress = false
            switch error {
            case .networkError:
                state.fetchError = "Oops!.  It seems someone made a mistake!"
            default:
                state.fetchError = "I'm sorry, but the server went away"
            }
        case .fetchComplete(let animal):
            state.fetchError = nil
            state.fetchInProgress = false
            state.current = animal
        }
    }
    
    func getAnimtal() -> String {
        let animal = ["Cat",
                      "Dog",
                      "Crow",
                      "Horse",
                      "Iguana",
                      "Cow",
                      "Racoon"]
            .randomElement() ?? ""
        return animal
    }
    
}
