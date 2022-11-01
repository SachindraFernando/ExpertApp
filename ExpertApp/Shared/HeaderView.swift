//
//  HeaderView.swift
//  ExpertApp
//
//  Created by Sachindra Fernando on 2022-11-01.
//

import SwiftUI

struct HeaderView: View {
    
    //MARK: - PROPERITY
    var headerName:String
    var icon:String

    //MARK: - SCREEN NAVIGATION
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        HStack {
            
          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
          }, label: {
              
            Image(systemName: icon)
                  .foregroundColor(.gray)
          })
          
          Spacer()
          
          Text("\(headerName)")
                .font(.system(size: 22, weight: .heavy))
                .foregroundColor(Color.gray)
            
          Spacer()
          

             
        } //: HSTACK
        .padding(.top,40)
        .padding(.bottom)
        .padding(.leading,16)
        .padding(.trailing,16)
        .ignoresSafeArea(.all, edges: .top)
        .background(
            ZStack {
                RoundedRectangle(cornerRadius: 16).stroke(Color("bg"), lineWidth: 1).shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 0)
                
                Color.white
            })

    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(headerName: "", icon: "")
            .previewLayout(.sizeThatFits)
    }
}
