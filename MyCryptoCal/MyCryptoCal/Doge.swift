//
//  Doge.swift
//  MyCryptoCal
//
//  Created by Sikun Chen on 2024-11-19.
//

import SwiftUI

struct Doge: View {
    @State var curr_price = 4
    @State var curr_hold = 5
    
    var body: some View {
        
        VStack{
            Image("DOGE_logo")
                .resizable()
                .scaledToFit()
                .padding()
            
            HStack{
                VStack{
                    Text("Current Price")
                        .font(.title)
                    Text(String(curr_price))
                        .font(.largeTitle)
                
                    
                }
                VStack{
                    Text("Current Hold")
                        .font(.title)
                    Text(String(curr_hold))
                        .font(.largeTitle)
                    
                }
            }
            
            HStack{
                Button("Current Value"){
                    print("Place Holder")
                }
                .foregroundColor(.white)
                .padding()
                .background(Color.gray)
                .cornerRadius(15)
                
                
                
            }
            
            
            
            
            
        }
        
        
        
    }
}

#Preview {
    Doge()
}
