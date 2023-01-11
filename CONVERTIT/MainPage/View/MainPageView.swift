//
//  MainPageView.swift
//  CONVERTIT
//
//  Created by Rand AlMuhanna on 17/06/1444 AH.
//

import SwiftUI




struct LocalizableStrings {
    static let unitConverter  = NSLocalizedString("Units Converter", comment: "")
    static let currencyConverter  = NSLocalizedString("Currency Converter", comment: "")
    
    static let distanceUnit = NSLocalizedString("Distance", comment: "")
    static let massUnit  = NSLocalizedString("Mass", comment: "")
    static let tempUnit = NSLocalizedString("Temperature", comment: "")
    static let timeUnit  = NSLocalizedString("Time", comment: "")
    static let volumeUnit  = NSLocalizedString("Volume", comment: "")

}

struct MainPageView: View {
    
    
    @State private var selectedItem: ConverterScrollerViewModel = .units
    
    @Namespace var animation
    
    var body: some View {
        
        VStack(spacing : 60){
            
            
       Spacer()
            
            ScrollerBetweenOptions
            

        }
    }
}


struct MainPageView_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}



extension MainPageView {
    
    
 
    var ScrollerBetweenOptions : some View {
        
        
        VStack{
            
            
            HStack{
                

                ForEach(ConverterScrollerViewModel.allCases , id: \.rawValue) { item in
                VStack {
                    Text(item.type)
                   
                        .font(.subheadline)
                        .fontWeight(selectedItem == item ? .semibold : .regular)
                    .foregroundColor(selectedItem == item ? Color("AppColor"): .gray)
                    
                    if selectedItem == item {
                        Capsule()
                            .frame(height: 4)
                            .foregroundColor(Color("AppColor"))
                        
                        // Custom animation effect
                            .matchedGeometryEffect(id: "Filter", in: animation)
                    }else {
                        Capsule()
                            .foregroundColor(.clear)
                            .frame(height: 2)
                        
                    }
                    
                }
                
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedItem = item
                    }
                }
                }
                
                
                // Divider under the two options
            }
            .overlay(Divider().offset(x:0 , y: 17))
            
            
            if selectedItem == .units {
                UnitConverterView()
            } else {
                CurrenciesConverterView()
            }
        }
        
        
    }
    
}
