//
//  ContentView.swift
//  MyCryptoCal
//
//  Created by Sikun Chen on 2024-11-19.
//

import SwiftUI

struct ContentView: View {
    @State var message = ""
    
    var body: some View {
        NavigationView{
            VStack {
                HStack{
                    Button(action: {}) {
                        NavigationLink(destination: Doge()) {
                            Image("DOGE_logo")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    
                    Button(action: {}) {
                        NavigationLink(destination: BTC()) {
                            Image("BTC_logo")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                   

                }
                
                
                HStack{
                    Button(action: {}) {
                        NavigationLink(destination: PEPE()) {
                            Image("PEPE_logo")
                                .resizable()
                                .scaledToFit()
                        }
                    }
                    
                    Button(action: {}) {
                        NavigationLink(destination: USDC()) {
                            Image("USDC_logo")
                                .resizable()
                                .scaledToFit()
                        }
                    }

                }
                
                HStack{
                    Spacer()
                    
                    Button("Add"){
                        message = "what to add"
                        
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(15)
                    
                    Spacer()
                    
                    Button("Remove"){
                        message = "what to remove "
                        
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(15)
                    
                    Spacer()
                    
                    Button(action: {}) {
                        NavigationLink(destination: Total()) {
                            Text("Total")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.gray)
                                .cornerRadius(15)
                        }
                    }
                
                    
                    Spacer()
                }
                
                Text(message)
                    .font(.caption)
                    .padding()
                
                
            }
            .buttonStyle(PlainButtonStyle())
            .padding()
            
            
        }
        .navigationTitle("Home page")
        
        
    }
}


#Preview {
    ContentView()
}
