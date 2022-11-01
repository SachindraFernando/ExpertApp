//
//  WelcomeView.swift
//  ExpertApp
//
//  Created by Sachindra Fernando on 2022-11-01.
//

import SwiftUI

struct WelcomeView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack{
            colorBackground
            NavigationView{
                VStack(alignment: .center, spacing: 20) {
                   Text("Expert System")
                        .font(.system(size: 32, weight: .heavy))
                        .foregroundColor(Color.blue)
                    
                    Spacer()
                    
                    Text("In artificial intelligence, an expert system is a computer system that emulates the decision-making ability of a human expert. Expert systems are designed to solve complex problems by reasoning about knowledge, like an expert, and not by following the procedure of a developer as is the case in conventional programming")
                        .font(.system(size: 16, weight: .regular))
                         .foregroundColor(Color.black)
                    
                    Spacer()
                    
                    NavigationLink(destination: ScenarioView()) {
                                        Text("Scenarios")
                                        .frame(minWidth: 0, maxWidth: 300)
                                        .padding()
                                        .foregroundColor(.white)
                                        .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(20)
                                        .font(.title)
                                }
                    Spacer()

                }//:VStack
                .padding(20)
           
            }//:NavigationLink
        }//:ZStack
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
       
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
