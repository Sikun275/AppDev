//
//  ContentView.swift
//  L3Demo
//
//  Created by Sikun Chen on 2024-11-18.
//

import SwiftUI

struct ContentView: View {
    
    @State var playercard = "card3"
    @State var CPUcard = "card9"
    
    
    @State var playerscore = 0
    @State var CPUscore = 0
    
    var body: some View {
        ZStack{
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            
            VStack{
                Image("logo")
                
                HStack{
                    Image(playercard)
                    Image(CPUcard )
                }
                
            
                
                Button {
                    deal()
                } label: {
                    Image("button")
                }

                
                HStack{
                    Spacer()
                    
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(playerscore))
                            .font(.largeTitle)
                    }
                    
                    Spacer()
        
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .padding(.bottom, 10)
                        Text(String(CPUscore))
                            .font(.largeTitle)
                    }
                    Spacer()
                }
                .padding()
                .foregroundColor(Color.white)
            
            }
            
    
        
            
            
        }
        
        
        
    }
    
    func deal(){
        var playerval = Int.random(in: 2...14)
        var CPUval = Int.random(in: 2...14)
        
        
        playercard = "card" + String(playerval)
        CPUcard = "card" + String(CPUval)
        
        if playerval > CPUval{
            playerscore += 1
        }else if playerscore < CPUval{
            CPUscore += 1
        }
            
    }
}

#Preview {
    ContentView()
}
