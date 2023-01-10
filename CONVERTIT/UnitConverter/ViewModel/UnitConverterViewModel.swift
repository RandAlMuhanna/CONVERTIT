//
//  UnitConverterViewModel.swift
//  CONVERTIT
//
//  Created by Rand AlMuhanna on 12/06/1444 AH.
//

import Foundation

enum UnitConverterViewModel: Int , CaseIterable {
    
   case distance
   case mass
   case temperature
   case time
   case volume
    
    
    var unitType: String {
           
        get {
                   switch(self) {
                   case .distance:
                       return LocalizableStrings.distanceUnit
                   case .mass:
                       return LocalizableStrings.massUnit
                   case .temperature:
                       return LocalizableStrings.tempUnit
                   case .time:
                       return LocalizableStrings.timeUnit
                   case .volume:
                       return LocalizableStrings.volumeUnit

                  
                   }
               }
       }
    
    var dimensions: [Dimension] {
           switch self {
           case .distance: return [UnitLength.meters , UnitLength.miles , UnitLength.kilometers , UnitLength.yards , UnitLength.feet]
           case .mass: return [UnitMass.grams , UnitMass.kilograms , UnitMass.pounds , UnitMass.ounces]
           case .temperature: return [UnitTemperature.celsius , UnitTemperature.fahrenheit , UnitTemperature.kelvin]
           case .time: return [UnitDuration.hours , UnitDuration.minutes ,UnitDuration.seconds]
           case .volume: return [UnitVolume.cups , UnitVolume.teaspoons , UnitVolume.tablespoons]
           }
           
       }
    
}
