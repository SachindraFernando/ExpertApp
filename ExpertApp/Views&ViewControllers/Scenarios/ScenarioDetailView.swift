//
//  ScenarioDetailView.swift
//  ExpertApp
//
//  Created by Sachindra Fernando on 2022-11-01.
//

import SwiftUI

struct ScenarioDetailView: View {
    
    // MARK: - Properties
    var scenario: Scenario
    
    @State var value = ""
    var placeholder = "Select Answer"
    var dropDownList = ["Restart", "Repair", "Hardware failure", "Software failure"]
    
    // MARK: - Body
    var body: some View {
        ZStack{
            colorBackground
            
            VStack(alignment: .center, spacing: 20) {
                GeometryReader { geometry in
                    ScrollView(.vertical , showsIndicators: false) {
                
                // MARK: - Header
                HeaderView(headerName: "Questions & Answers", icon: "chevron.left")
                
                // MARK: - Question
                Text(scenario.text ?? "")
                    .fontWeight(.semibold)
                    .lineLimit(2)
                    .font(.title2).multilineTextAlignment(.center)
                    .padding()
                // MARK: - Answer
                        Menu {
                            ForEach(dropDownList, id: \.self){ client in
                                Button(client) {
                                    self.value = client
                                }
                            }
                        } label: {
                            VStack(spacing: 5){
                                HStack{
                                    Text(value.isEmpty ? placeholder : value)
                                        .foregroundColor(value.isEmpty ? .gray : .black)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundColor(Color.blue)
                                        .font(Font.system(size: 20, weight: .bold))
                                }
                                .padding(.horizontal)
                                Rectangle()
                                    .fill(Color.blue)
                                    .frame(height: 2)
                            }
                            .padding(.horizontal, 20)
                        }

                        
                    }//: ScrollView
                    .frame(width: geometry.size.width)
                    
                }//:Geo
                
            }//:VStack
            
        }//:ZStack
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

//struct ScenarioDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ScenarioDetailView(scenario: <#Scenario#>)
//    }
//}
