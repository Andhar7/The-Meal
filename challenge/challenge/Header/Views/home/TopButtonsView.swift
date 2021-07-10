//
//  TopButtonsView.swift
//  challenge
//
//  Created by Andrej Kling on 09.07.21.
//

import SwiftUI

struct TopButtonsView: View {
    
    @State private var selected = "Recipe"
    
    var body: some View {
        
        HStack {
            
            ForEach(buttons, id:\.self) { i in
                
                Sample(title: i, selected: $selected)
            }
        }
        
    }
    
}

struct TopButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        TopButtonsView()
    }
}
var buttons = [ "Recipe", "Customise"]
 

struct Sample : View {
    
    var title : String
    @Binding var selected : String
    
    var body: some View {
        
        Button(action: {
             selected = title
        }, label: {
            Text(title)
                .font(.footnote).bold()
                .opacity(0.9)
                .foregroundColor(selected == title ? .white : .gray)
        })
    }
}
