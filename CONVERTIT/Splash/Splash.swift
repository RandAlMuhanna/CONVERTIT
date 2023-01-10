//
//  Splash.swift
//  CONVERTIT
//
//  Created by Rand AlMuhanna on 16/06/1444 AH.
//

import SwiftUI

let backgroundGradient = LinearGradient(
    colors: [Color(red: 225 / 255, green: 225 / 255, blue: 225 / 255),Color(red: 11 / 255, green: 122 / 255, blue: 117 / 255)],
    
    startPoint: .bottom, endPoint: .top)

struct Splash: View {
    @State var isActive:Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5

    var body: some View {
        if isActive {
            MainPageView()
        }
        else{
            ZStack{
                
                backgroundGradient
                    .edgesIgnoringSafeArea(.all)

                VStack{
                    
                   
                        
                    Text("CONVERT IT")
                    
                        .font(.title.weight(.bold))
                      //  .font(Font.custom("footnote", size: 36))
                        .foregroundColor(Color.white)
                    
  }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear{
                    withAnimation(.easeIn(duration: 1.2)){
                        self.size=0.9
                        self.opacity=1.0
                    }
                }.onAppear{
                    DispatchQueue.main.asyncAfter(deadline:.now()+2.0 )
                    {
                        self.isActive=true
                    }
                }
            }
        }
        
       
      
    }
}

struct Splash_Previews: PreviewProvider {
    static var previews: some View {
        Splash()
    }
}
