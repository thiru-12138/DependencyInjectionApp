//
//  UserView.swift
//  DependencyInjectionApp
//
//  Created by Thirumalai Ganesh G on 22/11/25.
//

import SwiftUI

struct UserView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject private var vm: UserViewModel
    
    init() {
        _vm = StateObject(wrappedValue: UserViewModel(service: Service()))
    }
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Initializer Injection").font(Font.system(size: 30.0, weight: .bold))
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
                
                Text(vm.name)
                
                Spacer()
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        .task {
            await vm.loadUser()
        }
    }
}

#Preview {
    UserView()
}
