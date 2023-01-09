//
//  Curncy.swift
//  CONVERTIT
//
//  Created by Haneen Behery on 12/06/1444 AH.
//

import SwiftUI

struct Curncy: View {
    struct CustomColor{
        static let CurryGray = Color("CurryGray")
    }
    @State var showingDetail = false
    @State var han = 1
    @State  var inc: Double = 0.0
    @State private var selectedCurr = 0
    @State private var selectedCurr2 = 1
    @State private var selectedCurr3 = 0
    @State private var selectedCurr4 = 1
    //  @State private var selectedCurr = ""
    @State var amount : String = "1.00"
    //  @State var amount = 1
    @State  private var itemse = 0
    @State var itemse1 = 1
    var curr = ["EUR","USD", "SAR", "UAE","EGP", "TRY" ]
    
    func convert(_ convert: String) -> String{
        var conversion: Double = 1.0
        
        let amount = Double(convert) ?? 0.0
        let selectedd = curr[selectedCurr]
        let to = curr[selectedCurr2]
        
        let eurorates = [ "EUR":1.0 ,"USD":1.06, "SAR":4.00, "UAE":3.91, "EGP":28.95, "TRY":19.96]
        let usdorates = [ "EUR":0.94 ,"USD":1.0, "SAR":3.76, "UAE":3.76, "EGP":27.20, "TRY":18.76]
        let sarrates = [ "EUR":0.25 ,"USD":0.27, "SAR":1.0, "UAE":0.98, "EGP":7.24, "TRY":4.97]
        
        switch (selectedd){
        case "EUR":
            conversion = amount * (eurorates[to] ?? 0.0)
        case "USD":
            conversion = amount * (usdorates[to] ?? 0.0)
        case "SAR":
            conversion = amount * (sarrates[to] ?? 0.0)
        default:
            print("error")
        }
        
        //   conversion = inc
        inc = inc + conversion
        
        return String(format: "%.2f" , conversion)
    }
    
    func increses(_ increses: Double) -> Double{
        
        while han <= 5 {
            inc = inc + 10
            han = han + 1
        }
        return Double(inc)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    var body: some View {
        ZStack{
            //   background(Color.CustomColor.CurryGray)
            Color("CurryGray").edgesIgnoringSafeArea(.all)
            VStack{
                ZStack{
                    CardView()
                    VStack{
                        
                        HStack{
                            Picker(selection: $selectedCurr, label: Text("")) {
                                ForEach(0 ..< curr.count) {index in
                                    Text(self.curr[index]).tag(index)
                                }
                            }.frame(width: 80, height: 2).padding()
                            
                            Button(action: {
                                self.showingDetail.toggle()
                                
                                if self.showingDetail {
                                    
                                    selectedCurr  = selectedCurr3
                                    selectedCurr2 = selectedCurr4
                                    selectedCurr3 = selectedCurr2
                                    selectedCurr4 = selectedCurr
                                    
                                }
                                //  if (showingDetail == true){
                                //    self.selectedCurr =  selectedCurr3
                                //   self.selectedCurr2 = selectedCurr4
                                //   self.selectedCurr = selectedCurr4
                                //    self.selectedCurr2 = selectedCurr3
                                
                                //  }
                                
                                
                            }) {
                                
                                Image(systemName: "arrow.left.arrow.right")
                                
                            }
                            
                            Picker(selection: $selectedCurr2, label: Text("")) {
                                ForEach(0 ..< curr.count) {index in
                                    Text(self.curr[index]).tag(index)
                                }
                            }.frame(width: 80, height: 2).padding()
                            
                            //  Picker("", selection: $selectedCurr2) {
                            //     ForEach(curr, id: \.self) {
                            //   Text($0)
                            //  }
                            // }.frame(width: 80, height: 2).padding()
                            
                        }
                        
                        
                        // Picker(selection: $itemse, label: Text("from")){
                        //    ForEach (0..<curr.count){index in Text(self.curr[index])}.tag(index)
                        //  }
                        
                        // Menu ("op") {
                        //      ForEach(curr, id: \.self){ curr in
                        //   Button(curr, action: placeOrder)
                        //  Button("Adjust Order", action: adjustOrder)
                        //  Button("Cancel", action: cancelOrder)
                        //   }
                        //   }.frame(width: 100, height: 70).border(.black).cornerRadius(10)
                        
                        
                        TextField("enter amount", text: $amount).keyboardType(.decimalPad).padding()
                        //  Stepper("\(amount)", value: $amount, in :1...100000).padding()
                    }
                    
                }
                
                ZStack{
                    CardViewbig()
                    VStack{
                        HStack{
                            Text("\(amount) \(curr[selectedCurr])").padding()
                            Spacer()
                            Image (systemName: "equal")
                            Spacer()
                            Text("\(convert(amount)) \(curr[selectedCurr2])").padding()
                            
                        }
                        
                        Divider()
                        
                    }
                }.padding()
                
                //     Text ("\(increses(inc))")
                
                
            }
        }
        
    }
    
    //  func placeOrder() { }
    
}

struct Curncy_Previews: PreviewProvider {
    static var previews: some View {
        Curncy()
    }
}
