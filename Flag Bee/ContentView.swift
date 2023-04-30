//
//  ContentView.swift
//  Flag Bee
//
//  Created by Praval Gautam on 30/04/23.
//

import SwiftUI

struct ContentView: View {
    @State private  var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria",
                     "Poland", "Russia", "Spain", "UK", "US",].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
  @State private var showingscore  = false
    @State private var scoreTitle  = ""
    @State private var score  = 0
    
    var body: some View {
        ZStack{
          RadialGradient(stops: [
            .init(color: Color(red:0.1,green:0.2,blue:0.45),location: 0.3),
            .init(color:Color(red:0.4,green:0.3,blue:0.90),location: 0.3)],
                         center: .top, startRadius: 200, endRadius:900)
                .ignoresSafeArea()
            VStack{
                VStack {
                    Text("The Flag of ")
                        .font(.largeTitle)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                    
                    Text(countries[correctAnswer])
                        .font(.largeTitle)
                        .fontWeight(.regular)
                        .foregroundColor(Color.white)
                    
                }
                
                ForEach(0..<3){
                    number in
                    Button{
                flagTapped(number)
                    }label: {
                        Image(countries[number])
                        
                    }
                }
                
                .alert(scoreTitle,isPresented: $showingscore){
                    Button("Continue",action: askQuestion)
                    
                }message: {
                    
                    Text("your score is \(score)")
                }

                
            }
        }
    }
        func flagTapped(_ number :Int){
            if number == correctAnswer{
                scoreTitle = "Correct"
                score+=1
            }
            else {
                scoreTitle = "Wrong"
         
            }
            showingscore = true
          
    }
    func askQuestion(){
        countries.shuffle()
        var correctAnswer = Int.random(in: 0...2)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
