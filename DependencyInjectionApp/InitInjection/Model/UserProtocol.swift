//
//  UserProtocol.swift
//  DependencyInjectionApp
//
//  Created by Thirumalai Ganesh G on 22/11/25.
//

import Foundation

protocol UserServiceProtocol {
    func fetchUser() async -> String
}

class Service: UserServiceProtocol {
    func fetchUser() async -> String {
        return "Guest"
    }
}
