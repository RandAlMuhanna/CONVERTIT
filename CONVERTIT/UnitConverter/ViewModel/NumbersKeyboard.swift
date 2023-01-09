//
//  NumbersKeyboard.swift
//  CONVERTIT
//
//  Created by Rand AlMuhanna on 16/06/1444 AH.
//

import Foundation


class NumbersKeyboard: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
            }
        }
    }
}
