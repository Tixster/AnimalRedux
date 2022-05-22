//
//  Action.swift
//  AnimalRedux
//
//  Created by Кирилл Тила on 22.05.2022.
//

import Foundation

enum AnimalAction: ReduxAction {
    case getAnimal
    case fetchAnimal
    case setCurrentAnimal(animal: String)
}
