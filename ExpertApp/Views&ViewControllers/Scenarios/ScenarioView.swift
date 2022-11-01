//
//  ScenarioView.swift
//  ExpertApp
//
//  Created by Sachindra Fernando on 2022-11-01.
//

import SwiftUI

struct ScenarioView: View {
    
    // MARK: - Properties
    @State var scenarios: [Scenario] = []
    @StateObject var vm = ScenarioVM()
    
    // MARK: - Body
    var body: some View {
        ZStack{
            colorBackground
            VStack(alignment: .leading){
                
                // MARK: - Header
                HeaderView(headerName: "Scenarios", icon: "chevron.left")
                
                VStack(alignment: .center, spacing: 20) {
                    GeometryReader { geometry in
                        ScrollView(.vertical , showsIndicators: false) {
                            LazyVStack(spacing: 24) {
                                ForEach(vm.scenarios, id: \.caseid) { scenario in
                                    NavigationLink(destination: ScenarioDetailView(scenario: scenario), label: {
                                        VStack{
                                            Text("\(scenario.text ?? "")")
                                                .font(.system(size: 18, weight: .regular))
                                                .foregroundColor(Color.black)
                                        }
                                        .padding()
                                        .fixedSize(horizontal: false, vertical: true)
                                        .frame(width: .infinity, height: 50, alignment: .leading)
                                        .background(
                                            ZStack {
                                                RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1)
                         
                                            })
                                    })
                                }
                                
                            }
                            
                        }
                        .frame(width: geometry.size.width)
                        
                    }
                    
                }//:VStack
                .onAppear() {
                    // MARK: - Network Call
                    vm.getScenariosList { (scenarios,_,_ ) in
                        
                    }
                    
                }
                .padding(20)
                    
            }//:VStack
        }//:ZStack
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ScenarioView_Previews: PreviewProvider {
    static var previews: some View {
        ScenarioView()
    }
}
