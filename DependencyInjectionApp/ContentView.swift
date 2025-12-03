//
//  ContentView.swift
//  DependencyInjectionApp
//
//  Created by Thirumalai Ganesh G on 22/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var manager = UserManager()
    
    @State private var iMenus = ["Initializer Injection", "Environment Injection", "Advanced Injection"]
    
    @State private var isNavInitInject = false
    @State private var isNavProInject = false
    @State private var isNavEnvInject = false
        
    var body: some View {
        NavigationStack {
            ZStack {
                List(Array(iMenus.enumerated()), id: \.offset) { index, menu in
                    CustomButton(btnName: menu, action: {
                        switch index {
                        case 0:
                            self.isNavInitInject.toggle()
                        case 1:
                            self.isNavEnvInject.toggle()
                        case 2:
                            self.isNavProInject.toggle()

                        default:
                            break
                        }
                    })
                }
            }
            .navigationTitle("Dependency Injections")
//            .navigationDestination(isPresented: $isNavInitInject, destination: { UserView() })
//            .navigationDestination(isPresented: $isNavEnvInject, destination: { UserManagerView().environmentObject(manager) })
//            .navigationDestination(isPresented: $isNavProInject, destination: { CustomEnvironmentView().environment(\.apiUrl, URL(string: "https://web.whatsapp.com/")!) })
            .sheet(isPresented: $isNavInitInject, content: {
                UserView()
            })
            .fullScreenCover(isPresented: $isNavEnvInject, content: {
                UserManagerView().environmentObject(manager)
            })
            .popover(isPresented: $isNavProInject, content: {
                CustomEnvironmentView().environment(\.apiUrl, URL(string: "https://web.whatsapp.com/")!)
            })
        }
    }
}

#Preview {
    ContentView()
}

struct CustomButton: View {
    @State var btnName: String = ""
    let action: (() -> Void)?
    var body: some View {
        Button(action: {
            action?()
        }, label: {
            Text(btnName)
        })
    }
}
