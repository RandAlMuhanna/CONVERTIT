//
//  UnitConverterView.swift
//  CONVERTIT
//
//  Created by Rand AlMuhanna on 12/06/1444 AH.
//

import SwiftUI

struct UnitConverterView: View {
    

    
    // To determine which unit is user selected
    @State var WhichUnitIsSelected = 0
    @State var selectedUnits : UnitConverterViewModel = .distance

    // Input from user (input and output unit its a dimension and gave it init value)
    @State private var input = 0.0
    @State private var inputUnit: Dimension = UnitLength.meters
    @State private var outputUnit: Dimension = UnitLength.kilometers
    @State private var selectedBTN : Bool = false
    @FocusState private var inputFocused: Bool
    
    @State private var SwapUnit: Dimension?
    
    let unitType = [
        [UnitLength.meters , UnitLength.miles , UnitLength.kilometers , UnitLength.yards , UnitLength.feet],
        [UnitMass.grams , UnitMass.kilograms , UnitMass.pounds , UnitMass.ounces],
        [UnitTemperature.celsius , UnitTemperature.fahrenheit , UnitTemperature.kelvin],
        [UnitDuration.hours , UnitDuration.minutes ,UnitDuration.seconds] ,
        [UnitVolume.cups , UnitVolume.teaspoons , UnitVolume.tablespoons]
    ]
    
    // A formatter that provides localized representations of units and measurements
    let formatter: MeasurementFormatter
    
    
    // Haneen There is the result
    var result: String {
        
        let inputMeasurement = Measurement(value: input, unit: inputUnit)
        let outputMeasurement = inputMeasurement.converted(to: outputUnit)
        return formatter.string(from: outputMeasurement)
    }
    

    var body: some View {
        
        NavigationView {
            
            
            VStack {
                VStack(spacing : 15){
                    
                    // Scroller Header Contain all Units
                    ScrollView(.horizontal){
                        
                        HStack{
                            
                            ForEach(UnitConverterViewModel.allCases , id: \.rawValue) { viewModel in
                                UnitView(viewModel: viewModel, selectedUnit: $selectedUnits)
                                
                                    .font(.subheadline)
                                //To change the color and font of selected units
                                    .fontWeight(selectedUnits == viewModel ? .bold : .regular)
                                    .foregroundColor(selectedUnits == viewModel ? Color("AppColor") : Color.black)
                            }
                        }
                        
                        .onChange(of: selectedUnits) { newSelection in
                            let units = unitType[newSelection.rawValue]
                            inputUnit = units[0]
                            outputUnit = units[1]
                            
                        }
                    }
                    .frame(width:350 ,height:100)
                    
                    
                    HStack(spacing:25){
                        
                        Picker("From", selection: $inputUnit){
                            ForEach(unitType[selectedUnits.rawValue], id: \.self){
                                Text(formatter.string(from: $0).capitalized)
                                
                            }
                        }.accentColor(.black)
                            .frame(width: 113 , height: 39)
                            .background(RoundedRectangle(cornerRadius: 10 ).fill(Color.white).opacity(0.5))
                            .shadow(
                                color: Color.gray.opacity(0.5),
                                radius: 5,
                                x: -8,
                                y: 8 )
                        
                        Button {
                            
                            //Swap between inputUnit And OutputUnit
                            SwapUnit = inputUnit
                            inputUnit = outputUnit
                            outputUnit = SwapUnit!
                            
                        } label: {
                            Image(systemName: "arrow.left.arrow.right")
                                .foregroundColor(Color("AppColor"))
                        }
                        
                        
                        Picker("To", selection: $outputUnit){
                            ForEach(unitType[selectedUnits.rawValue], id: \.self){
                                Text(formatter.string(from: $0).capitalized)
                                
                            }
                        }.accentColor(.black)
                            .frame(width: 113 , height: 39)
                            .background(RoundedRectangle(cornerRadius: 10 )
                                .fill(Color.white).opacity(0.5))
                        
                            .shadow(
                                color: Color.gray.opacity(0.5),
                                radius: 5,
                                x: -8,
                                y: 8 )
                        Button{
                            //
                        } label: {
                            Image(systemName: "mic")
                                .foregroundColor(Color("AppColor"))
                            
                        }
                        
                    } .frame(width: 50)
                    
                    
                    VStack(alignment: .leading) {
                        
                        
                        Stepper("Amount", value: $input, format:
                                .number)
                        .frame(width: 340,height: 39)
                        .textFieldStyle(.plain)
                        .focused($inputFocused)
                        .keyboardType(.decimalPad)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black , lineWidth: 0.5)
                        )
                        .padding()
                        .padding(.horizontal,20)
                    }
                    
                }.frame(width: 367 , height: 255)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                
                VStack(alignment: .leading){
                    
                    HStack(spacing: 80) {
                        
                        
                        HStack{
                            
                            Text(input.formatted())
                            Text(inputUnit.id.capitalized)
                            
                        }
                        
                        
                        Text("=")
                        
                        Text(result.capitalized)
                    }
                    
                }.frame(width: 367 , height: 300)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                
                
//                    .toolbar{
//                        ToolbarItemGroup(placement: .keyboard) {
//                            Button("Done"){
//                                inputFocused = false
//
//                            }
//                        }
//
//                    }
            }
            
            .navigationTitle("Measurements ")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.gray.opacity(0.1))
        }
        
        
    }
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
    }
}

struct UnitConverterView_Previews: PreviewProvider {
    static var previews: some View {
        UnitConverterView()
    }
}


extension Dimension: Identifiable {
    public var id: String {
        let formatter: MeasurementFormatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        return formatter.string(from: self)
    }
}
