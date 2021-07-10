//
//  CardBotoomView.swift
//  challenge
//
//  Created by Andrej Kling on 09.07.21.
//

import SwiftUI

struct CardBotoomView: View {
    
    let meal : Meal
    
    var body: some View {
        
        ZStack {
       
          //  Color("Color3")
            
            VStack  {
                
                HStack(alignment: .top, spacing: 3) {
                    
                    Image(meal.imageName)
                        .resizable()
                        .frame(width: 85, height: 85, alignment: .center)
                    
                    VStack(alignment: .leading) {
                        
                        Spacer().frame(height: 7)
                        
                        Text(meal.title)
                            .font(.footnote).bold()
                            .foregroundColor(.white)
                            .opacity(0.8)
                            .padding(.leading, 5)
                        
                        Spacer().frame(height: 18)
                        
                        Text(meal.sum[0])
                            .font(.footnote)
                            .foregroundColor(.white)
                            .padding(.leading, 5)
                            .opacity(0.7)
                        
                        HStack {
                            
                            StarsView()
                                .padding(.leading, 5)
                            
                            Text("(72)Recentas")
                                .font(.footnote)
                                .foregroundColor(.white)
                                .opacity(0.7)
                        }
                    }
                    
                    Text("9.2")
                        .font(.title3)
                        .foregroundColor(Color("Color4"))
                        .padding(.trailing, 5)
                }
            }
        }
    }
}

struct CardBotoomView_Previews: PreviewProvider {
    static var previews: some View {
        CardBotoomView(meal: meals[0])
    }
}

