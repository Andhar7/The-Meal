//
//  StarsView.swift
//  challenge
//
//  Created by Andrej Kling on 09.07.21.
//

import SwiftUI


struct StarsView: View {
    
    @State private var rating = 3
    
    var body: some View {
        ZStack {
            
            customStar
                .overlay(
                    overlayView.mask(customStar)
                )
        }
    }
    private var overlayView: some View {
        
        GeometryReader { geometry in
            
            ZStack(alignment: .leading) {
                
                Rectangle()
                    .foregroundColor(.yellow)
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
            }
            
        }
        .allowsHitTesting(false)
    }
    private var customStar : some View {
        HStack {
            
            ForEach(0 ..< 5) { item in
                
                Image(systemName: "star.fill")
                    .font(.footnote)
                    .foregroundColor(rating >= item ? Color.yellow : Color.gray)
                    .onTapGesture {
                        withAnimation(.easeInOut){
                            rating = item
                        }
                    }
            }
        }
        
    }
}

struct StarsView_Previews: PreviewProvider {
    static var previews: some View {
        StarsView()
    }
}


