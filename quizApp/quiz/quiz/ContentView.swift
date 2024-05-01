//
//  ContentView.swift
//  quiz
//
//  Created by StudentAM on 4/26/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView{
            ZStack{
                //create the background image
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("MOVIE QUIZ!")
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 115)
                        .font(.system(size: 50))
                        .foregroundColor(.gray)
                        .background(Color.white)
                        .cornerRadius(10)
                        .padding(.bottom, 290)
                    //when button is pressed, navigates it to the gameview
                    NavigationLink(destination: GameView().navigationBarBackButtonHidden(true)) {
                        Text("START")
                        .font(.custom("MadimiOne-Regular", size: 50))
                        .multilineTextAlignment(.center)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                        .frame(width: 200, height: 60)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
