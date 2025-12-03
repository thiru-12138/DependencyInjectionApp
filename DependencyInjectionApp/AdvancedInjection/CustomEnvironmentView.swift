//
//  CustomEnvironmentView.swift
//  DependencyInjectionApp
//
//  Created by Thirumalai Ganesh G on 22/11/25.
//

import SwiftUI

struct CustomEnvironmentView: View {
    @Environment(\.apiUrl) var apiurl
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Custom Environment").font(Font.system(size: 30, weight: .bold))
                    Spacer()
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "multiply.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30, alignment: .center)
                            .foregroundStyle(.red)
                    })
                }.padding()
                
                Spacer()
                
                Text("\(apiurl)")

                Spacer()
            }
        }
    }
}

#Preview {
    CustomEnvironmentView()
}
