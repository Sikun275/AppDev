//
//  ContentView.swift
//  L2Demo
//
//  Created by Sikun Chen on 2024-11-15.
//

import SwiftUI

struct ContentView: View {
    @State private var message: String = ""
    
    var body: some View {
        VStack {
            Image("Dogecoin_Logo")
            
            HStack{
                Button("Click Me") {
                    message = "AHHHH."
                }
                .padding()
                .background(Color.gray)
                .foregroundColor(Color.orange)
                .cornerRadius(10)
                
                Button("Guess What") {
                    message = "Wrong guess."
                }
                .padding()
                .background(Color.orange)
                .foregroundColor(Color.gray)
                .cornerRadius(10)
            }
               
            Text(message)
                .font(.caption)
                .padding()
        }
        .padding()
        .background(Rectangle()
            .foregroundColor(Color.yellow)
            .shadow(radius: 15)
        )
        
    }
    
}

#Preview {
    ContentView()
}
