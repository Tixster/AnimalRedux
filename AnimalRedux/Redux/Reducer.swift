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
            state.currentAnimal = getAnimtal()
        case .fetchAnimal:
            state.currentAnimal = "Loading..."
        case .setCurrentAnimal(let animalName):
            state.currentAnimal = animalName
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
