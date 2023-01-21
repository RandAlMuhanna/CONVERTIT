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
    
    @FocusState private var inputFocused: Bool

    @State var amount = 1.00
   
    
  //  @State var amount = 1.00
   // @State var amount : String = "1.00"
    @State var amount2  = 2.00
    @State var amount3  = 3.00
    @State var amount4  = 4.00
    @State var amount5  = 5.00
    @State var amount6  = 6.00
    
 //    @State var amount : String = "1.00"
    //@State var amount2 : String = "2.00"
   //  @State var amount3 : String = "3.00"
   //  @State var amount4 : String = "4.00"
   //  @State var amount5 : String = "5.00"
    // @State var amount6 : String = "6.00"
    
    
     //  @State var amount = 1
     // @State var itemse = 0
     //@State var itemse1 = 1
    // var curr = ["EUR","USD", "SAR", "UAE","EGP", "TRY" ]
    
    var curr = [NSLocalizedString("EUR", comment: ""),
                NSLocalizedString("USD", comment: ""),
                NSLocalizedString("SAR", comment: ""),
                NSLocalizedString("UAE", comment: ""),
                NSLocalizedString("EGP", comment: ""),
                NSLocalizedString("TRY", comment: ""),
               ]
     
     func convert(_ convert: Double) -> Double{
         var conversion: Double = 1.0
         
        let amount = Double(convert) ?? 0.0
         let selectedd = curr[selectedCurr]
         
         let to = curr[selectedCurr2]
         
         let eurorates = [ "EUR":1.00 ,"USD":1.06, "SAR":4.00, "UAE":3.91, "EGP":28.95, "TRY":19.96]
         let usdorates = [ "EUR":0.94 ,"USD":1.00, "SAR":3.76, "UAE":3.76, "EGP":27.20, "TRY":18.76]
         let sarrates = [ "EUR":0.25 ,"USD":0.27, "SAR":1.00, "UAE":0.98, "EGP":7.38, "TRY":5.00]
         let uaerates = [ "EUR":0.25 ,"USD":0.27, "SAR":1.02, "UAE":1.00, "EGP":7.54, "TRY":5.11]
         let egprates = [ "EUR":0.034 ,"USD":0.036, "SAR":0.14, "UAE":0.13, "EGP":1.04, "TRY":0.68]
         let tryrates = [ "EUR":0.050 ,"USD":0.053, "SAR":0.20, "UAE":0.20, "EGP":1.47, "TRY":1.00]
         
         
         let euroratesArabic = [ "يورو":1.00 ,"دولار امريكي":1.06, "ريال سعودي":4.00, "درهم إماراتي":3.91, "جنية مصري":28.95, "ليرة تركية":19.96]
         let usdoratesArabic = [ "يورو":0.94 ,"دولار امريكي":1.00, "ريال سعودي":3.76, "درهم إماراتي":3.76, "جنية مصري":27.20, "ليرة تركية":18.76]
         let sarratesArabic = [ "يورو":0.25 ,"دولار امريكي":0.27, "ريال سعودي":1.00, "درهم إماراتي":0.98, "جنية مصري":7.38, "ليرة تركية":5.00]
         let uaeratesArabic = [ "يورو":0.25 ,"دولار امريكي":0.27, "ريال سعودي":1.02, "درهم إماراتي":1.00, "جنية مصري":7.54, "ليرة تركية":5.11]
         let egpratesArabic = [ "يورو":0.034 ,"دولار امريكي":0.036, "ريال سعودي":0.14, "درهم إماراتي":0.13, "جنية مصري":1.04, "ليرة تركية":0.68]
         let tryratesArabic = [ "يورو":0.050 ,"دولار امريكي":0.053, "ريال سعودي":0.20, "درهم إماراتي":0.20, "جنية مصري":1.47, "ليرة تركية":1.00]
         
         
         switch (selectedd){
         case "EUR":
             conversion = amount * (eurorates[to] ?? 0.0)
         case "USD":
             conversion = amount * (usdorates[to] ?? 0.0)
         case "SAR":
             conversion = amount * (sarrates[to] ?? 0.0)
         case "UAE":
             conversion = amount * (uaerates[to] ?? 0.0)
         case "EGP":
             conversion = amount * (egprates[to] ?? 0.0)
         case "TRY":
             conversion = amount * (tryrates[to] ?? 0.0)
         case "يورو":
             conversion = amount * (euroratesArabic[to] ?? 0.0)
         case "دولار امريكي":
             conversion = amount * (usdoratesArabic[to] ?? 0.0)
         case "ريال سعودي":
             conversion = amount * (sarratesArabic[to] ?? 0.0)
         case "درهم إمراتي":
             conversion = amount * (uaeratesArabic[to] ?? 0.0)
         case "جنية مصري":
             conversion = amount * (egpratesArabic[to] ?? 0.0)
         case "ليرة تركية":
             conversion = amount * (tryratesArabic[to] ?? 0.0)
         default:
             print("error")
         }
         
         //   conversion = inc
         //  inc = inc + conversion
         
         return Double(conversion)
        // return String(format: "%.2f" , conversion)
     }
     
     //  func increses(_ increses: Double) -> Double{
     
     //   while han <= 5 {
     //      inc = inc + 10
     //     han = han + 1
     //    }
     //   return Double(inc)
     // }
       
     var body: some View {
      
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
                                             }.pickerStyle(.menu)
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
                                                 
                                 
                                                 
                                             }) {
                                                 
                                                 Image(systemName: "arrow.left.arrow.right").foregroundColor(CustomColor.Tercoaz)
                                                 
                                             }.buttonStyle(.plain) .accessibilityLabel(Text("Switch between 2 countries you picked"))
                                             
                                           //   Spacer()
                                             
                                             Picker(selection: $selectedCurr2, label: Text("")) {
                                                 ForEach(0 ..< curr.count) {index in
                                                     Text(self.curr[index]).tag(index)
                                                 }
                                             }   .pickerStyle(.menu)
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
                                                 amount = amount - 1
                                                 
                                                 
                                             }) {
                                                 
                                                 Image(systemName: "minus").foregroundColor(Color("AppColor"))
                                                 
                                             }.accessibilityLabel(Text("Decrease Amount by 1"))
                                             .padding(.horizontal).buttonStyle(.plain)
                                             //.buttonStyle(.plain)
                                             //    Spacer()
                                             
                                             TextField("Amount", value: $amount, format: .number)
                                                 .focused($inputFocused)
                                                 .keyboardType(.decimalPad)
                                                 .multilineTextAlignment(.center)
                                             
                                             
                                             //  Stepper("\(amount)", value: $amount, in :1...100000).padding()
                                             
                                             
                                             
                                             Spacer()
                                             Button(action: {
                                                 let incmount = Double(amount) ?? 0.0
                                                 amount = amount + 1
                                                 
                                                 
                                             }) {
                                                 
                                                 Image(systemName: "plus").foregroundColor(Color("AppColor"))
                                                 
                                             }.accessibilityLabel(Text("Increase Amount by 1"))
                                             .padding(.horizontal).buttonStyle(.plain)
                                             
                                        
                                             //.buttonStyle(.plain).frame(width: 20, height: 20)
                                         }
                                         .frame(width: 310,height: 39)
                                         .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(.black , lineWidth: 0.5))
                                         .padding()
                                         
                                     }.frame(width: 367 , height: 190)
                             //.background(RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.8)))
                         
                         
                     }
                     
                       //  Spacer()
                     Section{
                         VStack{
                             HStack{
                                 Text("\(amount,specifier: "%.2f") \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount),specifier: "%.2f") \(curr[selectedCurr2])").padding()
                                 
                             } .font(.system(size: 16, weight: .bold, design: .default))
                             
                             //  Divider()
                             
                         }
                         
                         VStack{
                             HStack{
                                 Text("\(amount2,specifier: "%.2f") \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount2),specifier: "%.2f") \(curr[selectedCurr2])").padding()
                                 
                             }
       
                         }
                         
                         VStack{
                             HStack{
                                 Text("\(amount3,specifier: "%.2f") \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount3),specifier: "%.2f") \(curr[selectedCurr2])").padding()
                                 
                             }
       
                         }
                         
                         VStack{
                             HStack{
                                 Text("\(amount4,specifier: "%.2f") \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount4),specifier: "%.2f") \(curr[selectedCurr2])").padding()
                                 
                             }
       
                         }
                         
                         VStack{
                             HStack{
                                 Text("\(amount5,specifier: "%.2f") \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount5),specifier: "%.2f") \(curr[selectedCurr2])").padding()
                                 
                             }
       
                         }

                         VStack{
                             HStack{
                                 Text("\(amount6,specifier: "%.2f") \(curr[selectedCurr])").padding()
                                 Spacer()
                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
                                 Spacer()
                                 Text("\(convert(amount6),specifier: "%.2f") \(curr[selectedCurr2])").padding()
                                 
                             }
       
                         }
                         
//                         VStack{
//                             HStack{
//                                 Text("\(amount2) \(curr[selectedCurr])").padding()
//                                 Spacer()
//                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
//                                 Spacer()
//                                 Text("\(convert(amount2)) \(curr[selectedCurr2])").padding()
//
//
//                             }
//
//
//                         }
//
//                         VStack{
//                             HStack{
//                                 Text("\(amount3) \(curr[selectedCurr])").padding()
//                                 Spacer()
//                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
//                                 Spacer()
//                                 Text("\(convert(amount3)) \(curr[selectedCurr2])").padding()
//
//
//                             }
//
//                             //       Divider()
//
//                         }
//
//                         VStack{
//                             HStack{
//                                 Text("\(amount4) \(curr[selectedCurr])").padding()
//                                 Spacer()
//                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
//                                 Spacer()
//                                 Text("\(convert(amount4)) \(curr[selectedCurr2])").padding()
//
//
//                             }
//
//                         }
//
//                         VStack{
//                             HStack{
//                                 Text("\(amount5) \(curr[selectedCurr])").padding()
//                                 Spacer()
//                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
//                                 Spacer()
//                                 Text("\(convert(amount5)) \(curr[selectedCurr2])").padding()
//
//
//                             }
//
//                         }
//
//                         VStack{
//                             HStack{
//                                 Text("\(amount6) \(curr[selectedCurr])").padding()
//                                 Spacer()
//                                 Image (systemName: "equal").foregroundColor(CustomColor.Tercoaz)
//                                 Spacer()
//                                 Text("\(convert(amount6)) \(curr[selectedCurr2])").padding()
//
//
//                             }
//
//                         }
                         
                         //Text ("\(increses(inc))")
                     }                .padding()

                                 
                     .font(.custom("footnote", size: 16))
                 }.listStyle(.insetGrouped)
                 
                 
                 //  Text ("\(increses(inc))")
                 
                 
             }
             .toolbar{
                 ToolbarItemGroup(placement: .keyboard) {
                     Button("Done"){
                         inputFocused = false
                         
                     }
                 }
                 
             }
       
                
             
         .onChange(of: amount){ _ in
             let newAmount = Double(amount) ?? 0.0
             
             amount2 = newAmount + 1
             amount3 = newAmount + 2
             amount4 = newAmount + 3
             amount5 = newAmount + 4
             amount6 = newAmount + 5
         }
         
     }
     
     //  func placeOrder() { }
     
 }


struct CurrenciesConverterView_Previews: PreviewProvider {
 static var previews: some View {
     CurrenciesConverterView()
 }
}
