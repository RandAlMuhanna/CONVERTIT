//
//  CardView.swift
//  CONVERTIT
//
//  Created by Haneen Behery on 15/06/1444 AH.
//

import SwiftUI

struct CardView: View{
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: cornerRadius)
                .strokeBorder(SwiftUI.Color.gray, lineWidth: 0.5)
                .shadow(color: Color.black.opacity(0.7),radius: 20,x:9,y:9)
                .frame(width: cardAndImageWidth, height: cardHeight)
                .background(SwiftUI.Color.white)
        
        }
    }
    
    private let cardAndImageWidth: CGFloat = 367
    private let cardHeight: CGFloat = 149
    private let cornerRadius: CGFloat = 10
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
