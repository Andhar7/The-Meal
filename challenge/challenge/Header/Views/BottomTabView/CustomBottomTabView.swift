//
//  BottomTabView.swift
//  challenge
//
//  Created by Andrej Kling on 09.07.21.
//

import SwiftUI

@available(iOS 15.0, *)
struct CustomBottomTabView: View {
    
    @State private var selection = "sun.max.fill"
 
    
    init() {
        
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            
            TabView(selection: $selection) {
                
                MainView()
                    .tag(systemImage[0])
                
                MoonView()
                    .tag(systemImage[1])
            }
            
            HStack(spacing: 210) {
                
                ForEach(systemImage, id:\.self) { index in
                    
                    TabButton(image: index, selectTab: $selection)
                }
            }
            .padding(.bottom, 35)
            .overlay(
                 
                Button(action: {
                
            }, label: {
                Image(systemName: "plus")
                    .padding(12)
                    .foregroundColor(Color("Color1"))
                    .background(Color("Color4"))
                    .cornerRadius(8)
                    .padding(.bottom, 75)
            })
            
            )
        }
    }
}

@available(iOS 15.0, *)
struct BottomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomBottomTabView()
    }
}

struct TabButton : View {
    
    var image : String
    @Binding var selectTab : String
    
    var body: some View {
        
        Button(action: {
            
            withAnimation(.spring()){
                selectTab = image
            }
            
        }, label: {
            
            Image(systemName: image)
             .font(.system(size: 21, weight: .regular, design: .serif))
             .foregroundColor(selectTab == image ? Color("Color4") : Color.white)
            
        })
        
    }
}

 var systemImage = ["sun.max.fill", "moon"]
