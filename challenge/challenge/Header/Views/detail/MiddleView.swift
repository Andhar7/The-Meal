//
//  MiddleView.swift
//  challenge
//
//  Created by Andrej Kling on 09.07.21.
//

import SwiftUI

@available(iOS 15.0, *)
struct MiddleView: View {
 
    @Binding var show : Bool
    @Binding var shimmer : Bool
    
    @ObservedObject var manager : MealData
  
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0) {
        
            Spacer().frame(height: 333)
            
            HStack {
                
                Image(systemName: manager.select[0].imageSystem[1])
                    .font(.footnote)
                    .foregroundColor(.white)
                
                Text(manager.select[0].sum[1])
                    .font(.footnote)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            HStack {
                
                Image(systemName: manager.select[0].imageSystem[2])
                    .font(.footnote)
                    .foregroundColor(.white)
                
                Text(manager.select[0].sum[2])
                    .font(.footnote)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            HStack {
                
                Image(systemName: manager.select[0].imageSystem[3])
                    .font(.footnote)
                    .foregroundColor(.white)
                
                Text(manager.select[0].sum[3])
                    .font(.footnote)
                    .foregroundColor(.white)
            }
            .padding(.horizontal)
            
            Spacer().frame(height: 13)
            
            Text(manager.select[0].title)
                .font(.system(size: 18, weight: .bold, design: .serif))
                .italic()
                .padding(.horizontal)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("Color5"), Color.white]), startPoint: .trailing, endPoint: shimmer ? .leading : .trailing))
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                .task {
                    shimmer.toggle()
                }
            
            Text(manager.select[0].description)
                .font(.system(size: 15, weight: .regular, design: .serif))
                .italic()
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("Color5"), Color.white]), startPoint: .leading, endPoint: shimmer ? .leading : .trailing))
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                .padding(.horizontal)
            
            Spacer().frame(height: 0)
            
            Text("$\(manager.select[0].price)")
                .font(.system(size: 33, weight: .regular, design: .serif))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            HStack {
                
                StarsView()
                    .padding(.horizontal)
                
                Spacer().frame(width: -5)
                
                Text("(72)Recentas")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .opacity(0.7)
                
                Spacer().frame(width: 33)
                
                Button(action: {
                    
                }, label: {
                    HStack {
                        
                        Image(systemName: "plus")
                        
                        Text("Add to my list")
                        
                    }
                    .font(.footnote)
                    .foregroundColor(Color("Color4"))
                })
                
            }
        }
    }
}
