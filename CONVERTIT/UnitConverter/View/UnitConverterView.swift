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
    @State private var input = 1.00
    @State private var input2 = 2.00
    @State private var input3 = 3.00
    @State private var input4 = 4.00
    @State private var input5 = 5.00
    @State private var input6 = 6.000
    
    @State private var inputUnit: Dimension = UnitLength.meters
    @State private var outputUnit: Dimension = UnitLength.kilometers
    @State private var selectedBTN : Bool = false
    @FocusState private var inputFocused: Bool
    
    @State private var SwapUnit: Dimension?
    
    @State private var Plus = 0
    
    let unitType = [
        [UnitLength.meters , UnitLength.miles , UnitLength.kilometers , UnitLength.yards , UnitLength.feet],
        [UnitMass.grams , UnitMass.kilograms , UnitMass.pounds , UnitMass.ounces],
        [UnitTemperature.celsius , UnitTemperature.fahrenheit , UnitTemperature.kelvin],
        [UnitDuration.hours , UnitDuration.minutes ,UnitDuration.seconds] ,
        [UnitVolume.cups , UnitVolume.teaspoons , UnitVolume.tablespoons]
    ]
    
    // A formatter that provides localized representations of units and measurements
    let formatter: MeasurementFormatter
    
    
    var body: some View {
        
        
        
        
        VStack(alignment: .center) {
            List{
                Section{
                    VStack(spacing : 15){
                        
                        // Scroller Header Contain all Units
                        ScrollView(.horizontal){
                            
                            HStack(spacing:8){
                                
                                ForEach(UnitConverterViewModel.allCases , id: \.rawValue) { viewModel in
                                    UnitView(viewModel: viewModel, selectedUnit: $selectedUnits)
                                    
                                    //To change the color and font of selected units
                                        .font(selectedUnits == viewModel ? .footnote.weight(.bold) : .footnote)
                                    
                                        .foregroundColor(selectedUnits == viewModel ? Color("AppColor") : Color.black)
                                }
                                //                                    Spacer()
                                
                            }
                            
                            .padding(.vertical)
                            .padding(.horizontal)
                            
                            .onChange(of: selectedUnits) { newSelection in
                                let units = unitType[newSelection.rawValue]
                                inputUnit = units[0]
                                outputUnit = units[1]
                                
                            }
                        }
                        .frame(width:350 ,height:100)
                        
                        
                        HStack(spacing:35){
                            
                            //                                Spacer()
                            
                            Picker("", selection: $inputUnit){
                                ForEach(unitType[selectedUnits.rawValue], id: \.self){
                                    Text(formatter.string(from: $0).capitalized)
                                        .font(.footnote.weight(.bold))
                                    
                                }
                            }
                            
                            .pickerStyle(.menu)
                            .accentColor(.black)
                            .frame(width: 113 , height: 39)
                            .background(RoundedRectangle(cornerRadius: 10 ).fill(Color.white).opacity(0.5))
                            .shadow(
                                color: Color.gray.opacity(0.5),
                                radius: 5,
                                x: -8,
                                y: 8 )
                            .labelsHidden()
                            
                            Button {
                                
                                //Swap between inputUnit And OutputUnit
                                SwapUnit = inputUnit
                                inputUnit = outputUnit
                                outputUnit = SwapUnit!
                                
                            } label: {
                                Image(systemName: "arrow.left.arrow.right")
                                    .foregroundColor(Color("AppColor"))
                            }.buttonStyle(.plain).accessibilityLabel(Text("Switch between 2 units you picked"))
                            
                            
                            Picker("", selection: $outputUnit){
                                ForEach(unitType[selectedUnits.rawValue], id: \.self){
                                    Text(formatter.string(from: $0).capitalized)
                                        .font(.footnote.weight(.bold))
                                    
                                }
                            }
                            
                            .pickerStyle(.menu)
                            .accentColor(.black)
                            .frame(width: 113 , height: 39)
                            .background(RoundedRectangle(cornerRadius: 10 )
                                .fill(Color.white).opacity(0.5))
                            
                            .shadow(
                                color: Color.gray.opacity(0.5),
                                radius: 5,
                                x: -8,
                                y: 8 )
                            
                            .labelsHidden()
                    
                        }
                        .frame(width: 50)
                        
                        
                        HStack{
                            Spacer()
                            
                            Button(action: {
                                

                                 input -= 1
                                
                                
                            }) {
                                
                                Image(systemName: "minus").foregroundColor(Color("AppColor"))
                            }
                            .accessibilityLabel(Text("Decrease Amount by 1"))
                            .padding(.horizontal).buttonStyle(.plain)
                                .padding()
                            
                            
                            TextField("Amount", value: $input, format:
                                    .number)
                            .textFieldStyle(.plain)
                            .focused($inputFocused)
                            .keyboardType(.decimalPad)
                            .multilineTextAlignment(.center)
                            
                            
                            Button(action: {
                                

                                 input += 1
                                
                                
                            }) {
                                
                                Image(systemName: "plus").foregroundColor(Color("AppColor"))
                                
                            }
                        .accessibilityLabel(Text("Increase Amount by 1"))
                        .padding(.horizontal).buttonStyle(.plain)
                                .padding()
                            
                            Spacer()
                            
                        }
                        
                        //TextField and + - Frame
                        .frame(width: 310,height: 39)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.black , lineWidth: 0.5))
                        .padding()
                        
                    }
                    //                        .frame(height: 230)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                }
                //   .frame(height: 220)
                
                
                Section{
                    
                    VStack{
                        
                       
                            HStack{
                                Text("\(input,specifier: "%.2f")  \(inputUnit.id)").padding()
                                    

                                Spacer()
                                
                                Image(systemName: "equal").foregroundColor(Color("AppColor"))
                                Spacer()
                                
                                Text(result(input: input, inputUnit: inputUnit, outputUnit: outputUnit).capitalized)
                                
                                


                            } .font(.system(size: 16, weight: .bold, design: .default))

                            

                        
                    }
                    
                   
                    
                    VStack{
                        
                        HStack {
                            
                            
                            
                            Text("\(input2,specifier: "%.2f")  \(inputUnit.id)").padding()
                            //                                        Text(input.formatted())
                            //                                        Text(inputUnit.id.capitalized)
                            Spacer()
                            
                            Image(systemName: "equal").foregroundColor(Color("AppColor"))
                            Spacer()
                            
                            Text(result(input: input2, inputUnit: inputUnit, outputUnit: outputUnit).capitalized)
                        }
                    }
                    
                    VStack{
                        
                        HStack {
                            
                            
                            
                            Text("\(input3,specifier: "%.2f")  \(inputUnit.id)").padding()
                            //                                        Text(input.formatted())
                            //                                        Text(inputUnit.id.capitalized)
                            Spacer()
                            
                            Image(systemName: "equal").foregroundColor(Color("AppColor"))
                            Spacer()
                            
                            Text(result(input: input3, inputUnit: inputUnit, outputUnit: outputUnit).capitalized)
                        }
                    }
                    
                    
                    VStack{
                        
                        HStack {
                            
                            
                            
                            Text("\(input4,specifier: "%.2f")  \(inputUnit.id)").padding()
                            //                                        Text(input.formatted())
                            //                                        Text(inputUnit.id.capitalized)
                            Spacer()
                            
                            Image(systemName: "equal").foregroundColor(Color("AppColor"))
                            Spacer()
                            
                            Text(result(input: input4, inputUnit: inputUnit, outputUnit: outputUnit).capitalized)
                        }
                    }
                    
                    
                    VStack{
                        
                        HStack {
                            
                            
                            
                            Text("\(input5,specifier: "%.2f")  \(inputUnit.id)").padding()
                            //                                        Text(input.formatted())
                            //                                        Text(inputUnit.id.capitalized)
                            Spacer()
                            
                            Image(systemName: "equal").foregroundColor(Color("AppColor"))
                            Spacer()
                            
                            Text(result(input: input5, inputUnit: inputUnit, outputUnit: outputUnit).capitalized)
                        }
                    }
                    
                    VStack{
                        
                        HStack {
                            
                            
                            
                            Text("\(input6,specifier: "%.2f")  \(inputUnit.id)").padding()
                            //                                        Text(input.formatted())
                            //                                        Text(inputUnit.id.capitalized)
                            Spacer()
                            
                            Image(systemName: "equal").foregroundColor(Color("AppColor"))
                            Spacer()
                            
                            Text(result(input: input6, inputUnit: inputUnit, outputUnit: outputUnit).capitalized)
                        }
                    }
                    
                }
                // .scaledToFill()
                .padding()
       
                .font(.custom("footnote", size: 16))

            }
            .listStyle(.insetGrouped)
            
 
            
        }
        .toolbar{
            ToolbarItemGroup(placement: .keyboard) {
                Button("Done"){
                    inputFocused = false
                    
                }
            }
            
        }
        
        
        .onChange(of: input){ _ in
            
            input2 = input2 + 1
            input3 = input3 + 2
            input4 = input4 + 3
            input5 = input2 + 4
            input6 = input2 + 5
            
            
        }
        
        
    }
    init() {
        formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
    }
    
}
func result(input: Double, inputUnit: Dimension, outputUnit: Dimension ) -> String {
    let formatter: MeasurementFormatter
    formatter = MeasurementFormatter()
    formatter.unitOptions = .providedUnit
    formatter.unitStyle = .medium
    let inputMeasurement = Measurement(value: input, unit: inputUnit)
    let outputMeasurement = inputMeasurement.converted(to: outputUnit)
    return formatter.string(from: outputMeasurement)
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
