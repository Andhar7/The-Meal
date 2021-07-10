//
//  MoonView.swift
//  challenge
//
//  Created by Andrej Kling on 10.07.21.
//

import SwiftUI

struct MoonView: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            RadialGradient(gradient: Gradient(colors: [Color("Color2"), Color("Color1")]), center: .center, startRadius: 5, endRadius: 180)
                .edgesIgnoringSafeArea([.all])
            
            topView()
   
            
            ScrollView(showsIndicators: false) {
                
                VStack(spacing: 33) {
                    
                    ForEach(meals) { i in
               
                           CardBotoomView(meal: i)
                    }
                }
                .background(Color.black.opacity(0.1))
                .blur(radius: 0.2)
                .padding(.top, 131)
            }
        }
    }
}

struct MoonView_Previews: PreviewProvider {
    static var previews: some View {
        MoonView()
    }
}
