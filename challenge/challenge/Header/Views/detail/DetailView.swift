//
//  DetailView.swift
//  challenge
//
//  Created by Andrej Kling on 09.07.21.
//

import SwiftUI

@available(iOS 15.0, *)
struct DetailView: View {
 
    @Binding var show : Bool
    @Binding var shimmer : Bool
    
    @ObservedObject var manager : MealData
    
    public var name : Namespace.ID
 
    var body: some View {
 
            ZStack(alignment: .trailing) {
//
//                RadialGradient(gradient: Gradient(colors: [Color("Color2"), Color("Color1")]), center: .center, startRadius: 5, endRadius: 180)
//                    .edgesIgnoringSafeArea([.all])
             
                imageView()
                
                MiddleView(show: $show, shimmer: $shimmer, manager: manager)
 
            }
           // .zIndex(-1)
    }
    func imageView() -> some View {
        
        HStack(spacing: -151) {
            
            Button(action: {
                withAnimation(.easeIn(duration: 0.5)){
                    manager.select[0] = manager.getCurrentRecipe()
                    show.toggle()
                }
            }, label: {
                Image(systemName: "arrow.left")
                    .padding(8)
                    .font(.title)
                    .foregroundColor(.white)
                    .background(Color("Color4").opacity(0.7))
                    .cornerRadius(12)
            })
            .zIndex(1)
            
            Image(manager.select[0].imageName)
                .resizable()
                .frame(width: 300, height: 300, alignment: .trailing)
                .matchedGeometryEffect(id: "imageId", in: name)
                .overlay(Color("Color1").opacity(0.6))
                .clipShape(Circle())
                .rotationEffect(.degrees(90))
                .offset(x: 120)
              
        }
        
    }
}

@available(iOS 15.0, *)
struct DetailView_Previews: PreviewProvider {
    
    @Namespace static var name
    
    static var previews: some View {
        DetailView( show: .constant(false), shimmer: .constant(false), manager: MealData(), name: name)
    }
}


