//
//  CustomEnvironmentModel.swift
//  DependencyInjectionApp
//
//  Created by Thirumalai Ganesh G on 22/11/25.
//

import Foundation
import SwiftUI

private struct APIUrlKey: EnvironmentKey {
    static let defaultValue = URL(string: "https://jsonplaceholder.typicode.com/users")!
}

extension EnvironmentValues {
    var apiUrl: URL {
        get { self[APIUrlKey.self] }
        set { self[APIUrlKey.self] = newValue }
    }
}
