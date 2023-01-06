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
           
           switch self {
           case .distance: return "Distance"
           case .mass: return "Mass"
           case .temperature: return "Temperature"
           case .time: return "Time"
           case .volume: return "Volume"


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
