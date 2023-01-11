//
//  CurrenciesConverterView.swift
//  CONVERTIT
//
//  Created by Haneen on 17/06/1444 AH.
//


import SwiftUI

struct CurrenciesConverterView: View {


     struct CustomColor{
         static let Tercoaz = Color("AppColor")
     }
     @State var showingDetail = false
     //  @State var han = 1
     //  @State  var inc: Double = 0.0
     @State  var selectedCurr = 0
     @State  var selectedCurr2 = 1
     @State  var Swap = 0
     //  @State private var selectedCurr4 = 1
     //  @State private var selectedCurr = ""
     @State var amount : String = "1"
     @State var amount2 : String = "2.00"
     @State var amount3 : String = "3.00"
     @State var amount4 : String = "4.00"
     @State var amount5 : String = "5.00"
     @State var amount6 : String = "6.00"
     //  @State var amount = 1
     // @State var itemse = 0
     //@State var itemse1 = 1
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
         //  inc = inc + conversion
         
         return String(format: "%.2f" , conversion)
     }
     
     //  func increses(_ increses: Double) -> Double{
     
     //   while han <= 5 {
     //      inc = inc + 10
     //     han = han + 1
     //    }
     //   return Double(inc)
     // }
       
     var body: some View {
         NavigationView{
             //   ZStack{
             //   background(Color.CustomColor.CurryGray)
             
             VStack{
                             List{
                                 Section{
                                     // CardView()
                                     VStack(spacing : 15){
                                         //  Color("CurryGray").edgesIgnoringSafeArea(.all)
                                         
                                         
                                         HStack(spacing : 30){
                                             Picker(selection: $selectedCurr, label: Text("")) {
                                                 ForEach(0 ..< curr.count) {index in
                                                     Text(self.curr[index]).tag(index)
                                                 }
                                             }                                .pickerStyle(.menu)

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
                                             // .frame(width: 70)
                                             
                                             
                                             
                                             
                                        //    Spacer()
                                             
                                             Button(action: {
                                                 Swap = selectedCurr
                                                 selectedCurr = selectedCurr2
                                                 selectedCurr2 = Swap
                                                 
                                                 //                                    self.showingDetail.toggle()
                                                 //
                                                 //                                    if self.showingDetail {
                                                 //                                        selectedCurr = selectedCurr3
                                                 //                                        selectedCurr = selectedCurr2
                                                 //                                        selectedCurr3 = selectedCurr2
                                                 //
                                                 //                                     //   selectedCurr  = selectedCurr3
                                                 //                                      //  selectedCurr2 = selectedCurr4
                                                 //                                      //  selectedCurr3 = selectedCurr2
                                                 //                                      //  selectedCurr4 = selectedCurr
                                                 //
                                                 //                                    }
                                                 //  if (showingDetail == true){
                                                 //    self.selectedCurr =  selectedCurr3
                                                 //   self.selectedCurr2 = selectedCurr4
                                                 //   self.selectedCurr = selectedCurr4
                                                 //    self.selectedCurr2 = selectedCurr3
                                                 
                                                 //  }
                                                 
                                                 
                                             }) {
                                                 
                                                 Image(systemName: "arrow.left.arrow.right").foregroundColor(CustomColor.Tercoaz)
                                                 
                                             }.buttonStyle(.plain)
                                             
                                           //   Spacer()
                                             
                                             Picker(selection: $selectedCurr2, label: Text("")) {
                                                 ForEach(0 ..< curr.count) {index in
                                                     Text(self.curr[index]).tag(index)
                                                 }
                                             }                                .pickerStyle(.menu)

                                             .accentColor(.black)
                                                 .frame(width: 113 , height: 39)
                                                 .background(RoundedRectangle(cornerRadius: 10 )
                                                    .fill(Color.white).opacity(0.5))
                                             
                                                 .shadow(
                                                    color: Color.gray.opacity(0.5),
                                                    radius: 5,
                                                    x: -8,
                                                    y: 8 )
                                             
                                             //.frame(width: 80, height: 2).padding()
                                                 .labelsHidden()
                                             
                                         }.frame(width: 50)
                                         
                                         
                                         
                                         HStack{
                                             
                                             Button(action: {
                                                 let incmount = Double(amount) ?? 0.0
                                                 amount = ("\(incmount + 1)")
                                                 
                                                 
                                             }) {
                                                 
                                                 Image(systemName: "plus").foregroundColor(CustomColor.Tercoaz)
                                                 
                                             }.padding(.horizontal).buttonStyle(.plain)
                                             //.buttonStyle(.plain)
                                             //    Spacer()
                                             
                                             TextField("enter amount", text: $amount).keyboardType(.decimalPad)
                                                 .multilineTextAlignment(.center)
                                             
                                             
                                             //  Stepper("\(amount)", value: $amount, in :1...100000).padding()
                                             
                                             
                                             
                                            // Spacer()
                                             
                                             Button(action: {
                                                 let incmount = Double(amount) ?? 0.0
                                                 amount = ("\(incmount - 1)")
                                                 
                                                 
                                             }) {
                                                 
                                                 Image(systemName: "minus").foregroundColor(CustomColor.Tercoaz)
                                                 
                                             }.padding(.horizontal).buttonStyle(.plain)
                                             //.buttonStyle(.plain).frame(width: 20, height: 20)
                                         }
                                         .frame(width: 310,height: 39)
                                         .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.black , lineWidth: 0.5))
                                         .padding()
                                         
                                     }.frame(height: 190)
                             //.background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                         
                         
                     }
                     
                       //  Spacer()
                     Section{
                         VStack{
                             HStack{
                                 Text("\(amount) \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount)) \(curr[selectedCurr2])").padding()
                                 
                             }
                             
                             //  Divider()
                             
                         }
                         
                         VStack{
                             HStack{
                                 Text("\(amount2) \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount2)) \(curr[selectedCurr2])").padding()
                                 
                                 
                             }
                             
                             
                         }
                         
                         VStack{
                             HStack{
                                 Text("\(amount3) \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount3)) \(curr[selectedCurr2])").padding()
                                 
                                 
                             }
                             
                             //       Divider()
                             
                         }
                         
                         VStack{
                             HStack{
                                 Text("\(amount4) \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount4)) \(curr[selectedCurr2])").padding()
                                 
                                 
                             }
                             
                         }
                         
                         VStack{
                             HStack{
                                 Text("\(amount5) \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount5)) \(curr[selectedCurr2])").padding()
                                 
                                 
                             }
                             
                         }
                         
                         VStack{
                             HStack{
                                 Text("\(amount6) \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount6)) \(curr[selectedCurr2])").padding()
                                 
                                 
                             }
                             
                         }
                         
                         //Text ("\(increses(inc))")
                     }
                 }.listStyle(.insetGrouped)
                 
                 
                 //  Text ("\(increses(inc))")
                 
                 
             }
//             .navigationTitle("Curruncy")
             //}.navigationTitle("Curruncy")
                 .navigationBarTitleDisplayMode(.inline)
                
             
         }.onChange(of: amount){ _ in
             let newAmount = Double(amount) ?? 0.0
             
             amount2 = "\(newAmount + 1)"
             amount3 = "\(newAmount + 2)"
             amount4 = "\(newAmount + 3)"
             amount5 = "\(newAmount + 4)"
             amount6 = "\(newAmount + 5)"
         }
         
     }
     
     //  func placeOrder() { }
     
 }


struct CurrenciesConverterView_Previews: PreviewProvider {
 static var previews: some View {
     CurrenciesConverterView()
 }
}

