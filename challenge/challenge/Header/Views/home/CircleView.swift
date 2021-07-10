//
//  CircleView.swift
//  challenge
//
//  Created by Andrej Kling on 09.07.21.
//

import SwiftUI

struct CircleView: View {
    
    let meal : Meal
    let index : Int
    let counts : Int
 
    @ObservedObject var manager : MealData
    
    public var name : Namespace.ID
  
   // @State private var data : Meal = meals[0]
    
    var body: some View {
        ZStack {
            
//            Circle()
//                .stroke(
//                    LinearGradient(
//                        gradient: Gradient(colors: [
//                           
//                            Color("Color2"), Color("Color5")
//                        ]),
//                        startPoint: .leading,
//                        endPoint: .trailing),
//                    lineWidth: 4
//                )
//                .scaleEffect(0.57)
            
            ArrowShape(reachedTop: index == 0, reachedBottom: index == counts - 1)
                .stroke(Color("Color5"), style:  StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                .frame(width: UIScreen.screenWidth - 33, height: UIScreen.screenWidth - 33)
                .scaleEffect(0.81)
            
            Image(meal.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: UIScreen.screenWidth - 180, height:  UIScreen.screenHeight / 4)
                .matchedGeometryEffect(id: "imageId", in: name)
            
            Circle()
                .fill(Color("Color2").opacity(0.2))
                .scaleEffect(0.65)
                .gesture(
                    DragGesture(minimumDistance: 10)
                        .onChanged({ value in
                    withAnimation(.spring()){
                        manager.chageSwipeValue(value: value.translation.height)
                    }
                })
                .onEnded({ value in
                    withAnimation(.spring()){
                        manager.swipeEnded(value: value.translation.height)
                    }
                })
                )
        }
    }
}

struct CircleView_Previews: PreviewProvider {
    
    @Namespace static var name
    
    static var previews: some View {
        CircleView(meal: meals[0], index: 0, counts: 0, manager: MealData(), name: name)
    }
}

extension UIScreen {
   static let screenWidth   = UIScreen.main.bounds.size.width
   static let screenHeight  = UIScreen.main.bounds.size.height
   static let screenSize    = UIScreen.main.bounds.size
}


