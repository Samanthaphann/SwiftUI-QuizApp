//
//  GameView.swift
//  quiz
//
//  Created by StudentAM on 4/29/24.
//

import SwiftUI

struct GameView: View {
    //the index for the question, answers, and options
    let questions: [Question] = [
        Question(question: "What is the name of the high school in '10 Things I Hate About You'?", options: ["Padua High School", "Rydell High School", "Hollywood High School", "West Beverly High School"], answer: "Padua High School"),
        Question(question: "Who plays the character Kat Stratford in the movie?", options: ["Julia Stiles", "Amanda Bynes", "Lindsay Lohan", "Reese Witherspoon"], answer: "Julia Stiles"),
        Question(question: "Where does the movie take place?", options: ["San Jose", "Seattle", "New York", "Santa Cruz"], answer: "Seattle"),
        Question(question: "What is Bianca and Kat's last name?", options: ["White", "Anderson", "Smith", "Stratford"], answer: "Stratford"),
        Question(question: "What sport does Kat play?", options: ["basketball", "soccer", "volleyball", "football"], answer: "soccer"),
        Question(question: "How much was Patrick paid by Joey to take Kat to prom?", options: ["$300", "$100", "$255", "$200"], answer: "$300"),
        Question(question: "Who does Bianca originally want to go out with?", options: ["Cameron", "Patrick", "Joey", "Micheal"], answer: "Joey"),
        Question(question: "What language did Cameron pretend to know so he could tutor Bianca and get to know her?", options: ["Spanish","German","Mandarin", "French"], answer: "French"),
        Question(question: "What do Kat and Patrick do after she gets him out of detention", options: ["swimming", "paint-balling", "mini-golfing", "ice-skating"], answer: "paint-balling"),
        Question(question: "What is Mr. Stratford's job?", options: ["mechanic", "peditrician", "OB/GYN", "podiatrist"], answer: "OB/GYN")
    ]
    @State private var currentQuestionIndex: Int = 1
    @State var score: Int = 0
    @State var currentQuestion: Int = 0
    @State private var isRight: Bool = false
    @State private var chosenAnswer: Bool = false
    @State private var end: Bool = false
    @State private var finalScore: Int = 0
    @State private var finished: Bool = false
    var body: some View {
        NavigationView{
            ZStack{
                Image("background")
                VStack{
                    //shows the score
                    Text("score: \(score)")
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.gray)
                    //shows what question you're on
                    Text("Question \(currentQuestionIndex)/10")
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                    //shows the question
                    Text("\(questions[currentQuestion].question)")
                        .frame(width: 300, height: 75)
                        .background(Color.white)
                        .cornerRadius(10)
                        .foregroundColor(.gray)
                        .border(Color.gray)
                        .multilineTextAlignment(.center)
                        .padding()
                    VStack {
                        //lists the option for the quiz
                        ForEach(questions[currentQuestion].options, id: \.self){ answer in
                            Button(action: {
                                checkAnswer(questions[currentQuestion], answer)
                            }, label: {
                                Text("\(answer)")
                                    .frame(width: 300, height: 50)
                                    .background(
                                        //add corner radius
                                        RoundedRectangle(cornerRadius: 10)
                                        //when the button is right, it turns green, when the button is wrong it turns red
                                            .fill(
                                                chosenAnswer && questions[currentQuestion].answer == answer ? Color.green : (chosenAnswer ? Color.red : Color.white)
                                            )
                                    )
                                    .foregroundColor(.gray)
                                    .border(Color.gray)
                                    .padding(15)
                            })
                        }
                        HStack{
                            //if a answer is picked, it adds one to the question score and when the button is pressed it moves to the next question
                            if chosenAnswer{
                                Button {
                                    if currentQuestionIndex < 10{
                                        currentQuestion += 1
                                        currentQuestionIndex += 1
                                        chosenAnswer = false
                                    } else{
                                        finished = true
                                    }
                                } label: {
                                    if currentQuestionIndex < 10{
                                        //if question is less than 10, goes to the next question
                                        Text("Next Question")
                                            .padding()
                                            .background(Color.white)
                                            .foregroundColor(.gray)
                                            .cornerRadius(10)
                                            .border(Color.gray)
                                    } else if currentQuestionIndex == 10{
                                        //if question is 10, goes to the endview to get score
                                        NavigationLink(destination: EndView(finalScore: score)) {
                                            Text("get your final score! ")
                                                .padding()
                                                .background(Color.white)
                                                .foregroundColor(.gray)
                                                .cornerRadius(10)
                                                .border(Color.gray)
                                    }
                                }

                            }
                        }
                        }
                    }
                }
            }
        }
    }
    //checks if answer is right or wrong
    func checkAnswer(_ questions: Question, _ optionPicked: String){
        //when answer clicked is right, it adds 1 to the score
        if chosenAnswer == false && questions.answer == optionPicked{
            isRight = true
            score += 1
            finalScore += 1
        } else{
            //when answer is wrong it doesn't update score
            isRight = false
            chosenAnswer = false
            score += 0
        }
        chosenAnswer = true
    }
}

#Preview {
    GameView()
}
