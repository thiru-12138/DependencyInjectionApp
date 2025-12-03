//
//  UserViewModel.swift
//  DependencyInjectionApp
//
//  Created by Thirumalai Ganesh G on 22/11/25.
//

import Foundation


class UserViewModel: ObservableObject {
    @Published var name = ""
    private let service: UserServiceProtocol
    
    init(service: UserServiceProtocol) {
        self.service = service
    }
    
    func loadUser() async {
        let username = await service.fetchUser()
        Task {
            await MainActor.run { [weak self] in
                self?.name = username
            }
        }
    }
}
