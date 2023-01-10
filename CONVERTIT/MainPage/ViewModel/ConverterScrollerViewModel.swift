//
//  ConverterScrollerViewModel.swift
//  CONVERTIT
//
//  Created by Rand AlMuhanna on 17/06/1444 AH.
//

import Foundation



enum ConverterScrollerViewModel :Int , CaseIterable {
    
    case units
    case currency
    
    
    var type : String{
        
        get {
                   switch(self) {
                   case .units:
                       return LocalizableStrings.unitConverter
                   case .currency:
                       return LocalizableStrings.currencyConverter
                  
                   }
               }
        
        
    }
}
