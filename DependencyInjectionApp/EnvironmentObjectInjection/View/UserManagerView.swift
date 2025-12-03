//
//  UserManagerView.swift
//  DependencyInjectionApp
//
//  Created by Thirumalai Ganesh G on 22/11/25.
//

import SwiftUI

struct UserManagerView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var manager : UserManager
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Environment Injection").font(Font.system(size: 30.0, weight: .bold))
                    Spacer()
                }.padding()
                
                Spacer()
                
                Text(manager.username)

                Spacer()
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Dismiss")
                        .frame(width: 300, height: 50)
                        //.frame(maxWidth: .infinity,maxHeight: .infinity)
                })
                .frame(width: 300, height: 50)
                .font(Font.system(size: 15, weight: .bold))
                .background(.purple)
                .foregroundStyle(.white)
                .clipShape(.capsule)
                .clipped()
            }
        }
    }
}

#Preview {
    UserManagerView()
}
