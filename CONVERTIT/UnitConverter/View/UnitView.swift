//
//  UnitView.swift
//  CONVERTIT
//
//  Created by Rand AlMuhanna on 12/06/1444 AH.
//

import SwiftUI

struct UnitView: View {
    
    var viewModel : UnitConverterViewModel
    @State var isSelected: Bool = false
    @Binding var selectedUnit: UnitConverterViewModel

    var body: some View {
        
        Button{
            
                  withAnimation {
                      selectedUnit = viewModel
                  }
              } label: {
                  
                      Text(viewModel.unitType)
                      .padding()
                      .overlay(
                      RoundedRectangle(cornerRadius: 10)
                        .stroke(.black , lineWidth: 0.5)
                      )
                          
                        
                         
//
                      
              }
                 // .frame(width: 63 ,height: 29)
//              .padding(.leading)
//              .padding(.trailing)
//      .padding(.vertical)
//      .padding(.horizontal,0.5)
              }

    }


struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView(viewModel: .distance, selectedUnit: .constant(.distance))
    }
}
