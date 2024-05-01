//
//  EndView.swift
//  quiz
//
//  Created by StudentAM on 4/30/24.
//

import SwiftUI

struct EndView: View {
    //The final score to show what score you got
    var finalScore: Int
    var body: some View {
        NavigationView{
            ZStack{
                Image("background")
                VStack{
                    //shows what your score is
                    Text("Your score is \(finalScore)/10!")
                        .multilineTextAlignment(.center)
                        .frame(width: 300, height: 115)
                        .font(.system(size: 30))
                        .foregroundColor(.gray)
                        .background(Color.white)
                        .border(Color.gray)
                        .cornerRadius(10)
                        .padding(.bottom, 20)
                    //if the score is less than 6 good try pops up
                    if finalScore < 6 {
                        Text("Good Try! :)")
                            .multilineTextAlignment(.center)
                            .frame(width: 150, height: 75)
                            .font(.system(size: 20))
                            .border(Color.gray)
                            .foregroundColor(.green)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.bottom, 290)
                        //if the score is equal or more than 6 good job pops up
                    } else if finalScore >= 6{
                        Text("Good Job! :)")
                            .multilineTextAlignment(.center)
                            .frame(width: 150, height: 75)
                            .font(.system(size: 20))
                            .border(Color.gray)
                            .foregroundColor(.green)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.bottom, 290)
                    }
                    //navigares back to the start screen
                    NavigationLink {
                        ContentView().navigationBarBackButtonHidden()
                    } label: {
                        Text("Try Again?")
                            .font(.custom("MadimiOne-Regular", size: 30))
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(Color.white)
                            .border(Color.gray)
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
    EndView(finalScore: 0)
}
