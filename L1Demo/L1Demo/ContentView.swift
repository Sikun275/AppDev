//
//  ContentView.swift
//  L1Demo
//
//  Created by Sikun Chen on 2024-11-15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        ZStack {
            Color(.orange).ignoresSafeArea()
            
            VStack {
                Image("Dogecoin_Logo")
                    .resizable()
                    .cornerRadius(10)
                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fit/*@END_MENU_TOKEN@*/)
                    .padding(.all)
                Text("This is a Doge coin")
                    .font(.caption)
               
            }
            
            
        }
       
    }
}

#Preview {
    ContentView()
}
