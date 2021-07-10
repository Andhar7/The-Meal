//
//  MainView.swift
//  challenge
//
//  Created by Andrej Kling on 09.07.21.
//

import SwiftUI
 

@available(iOS 15.0, *)
struct MainView: View {
 
    @State private var show = false
    
    @State private var shimmer = false
    
    @StateObject var manager = MealData()
    
    @Namespace private var name
    
    var body: some View {
        
        ZStack(alignment: .top) {
            
            RadialGradient(gradient: Gradient(colors: [Color("Color2"), Color("Color1")]), center: .center, startRadius: 5, endRadius: 280)
                .edgesIgnoringSafeArea([.all])
            
            VStack(spacing: 0) {
                
                topView()
                
                TopButtonsView()
                
                if !show {
                    
                    CircleView(meal: manager.getCurrentRecipe(), index: manager.currentRecipeIndex, counts: manager.data.count, manager: manager, name: name)
                        .padding(.bottom, -35)
                        .onTapGesture {
                            withAnimation(.spring()){
                                manager.select[0] = manager.getCurrentRecipe()
                                show.toggle()
                            }
                        }
                    
                    Text(manager.getCurrentRecipe().title)
                        .font(.system(size: 19, weight: .bold, design: .serif))
                        .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("Color5"), Color.white]), startPoint: .trailing, endPoint: shimmer ? .leading : .trailing))
                        .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                        .task {
                            shimmer.toggle()
                        }
                    
                    Spacer().frame(height: 21)
                    
                    HStack {
                        
                        Text(manager.getCurrentRecipe().sum[3])
                            .font(.system(size: 15, weight: .regular, design: .serif))
                            .opacity(0.7)
                            .padding(.horizontal, 10)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("Color5"), Color.white]), startPoint: .leading, endPoint: shimmer ? .leading : .trailing))
                            .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                        
                        Text(manager.getCurrentRecipe().sum[4])
                            .font(.system(size: 15, weight: .regular, design: .serif))
                            .opacity(0.8)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [Color("Color5"), Color.white]), startPoint: .trailing, endPoint: shimmer ? .leading : .trailing))
                            .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                            .padding(.horizontal, 10)
                            .padding(.bottom, 25)
                    }
                    
                }
                
                Spacer().frame(height: 12)
                
                if !show {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        
                        HStack(spacing: 15) {
                            
                            ForEach(meals) { item in
                                
                                CardBotoomView(meal: item)
                                    .animation(Animation.easeIn(duration: 0.9))
                                
                            }
                        }
                        .padding(.horizontal, 15)
                    }
                }
            }
            .padding(.bottom, 150)
            
            if show {
                
                DetailView(show: $show, shimmer: $shimmer, manager: manager, name: name)
                  
            }
        }
    }
}
 

@available(iOS 15.0, *)
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct topView : View {
    
    var body: some View {
        
        HStack {
            
            Spacer().frame(width: 33)
            
            Image(systemName: "line.horizontal.3.decrease")
                .font(.title2)
                .foregroundColor(.gray)
            
            Spacer(minLength: 0)
            
            BonosView()
            
            Spacer(minLength: 0)
            
            Image(systemName: "bell.fill")
                .font(.title2)
                .foregroundColor(.gray)
                .overlay(
                  
                    Circle()
                        .frame(height: 8)
                        .foregroundColor(Color.orange.opacity(0.6))
                        .padding(.bottom, 31)
                        .padding(.leading)
             
                )
            
            Spacer().frame(width: 33)
        }
        .padding(.top, 35)
        
    }
}
