//
//  UnitView.swift
//  CONVERTIT
//
//  Created by Rand AlMuhanna on 12/06/1444 AH.
//

import SwiftUI

struct UnitView: View {
    
    var viewModel : UnitConverterViewModel
    @Binding var selectedUnit: UnitConverterViewModel

    var body: some View {
        
        Button {
                  withAnimation {
                      selectedUnit = viewModel
                  }
              } label: {
                  
                      Text(viewModel.unitType)
                      .padding()
                     // .padding(.vertical ,10)
                      .overlay(
                      RoundedRectangle(cornerRadius: 10)
                        .stroke(.black , lineWidth: 0.5)
                      )
                      .font(.subheadline)
                          .foregroundColor(.black)
                        
                  
//                     Spacer()
                      
              }
                 // .frame(width: 63 ,height: 29)
       .padding(.vertical)
              }

    }


struct UnitView_Previews: PreviewProvider {
    static var previews: some View {
        UnitView(viewModel: .distance, selectedUnit: .constant(.distance))
    }
}
