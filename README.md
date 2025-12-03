# DependencyInjectionApp

✅ What is Dependency Injection?

Dependency Injection (DI) is a design pattern where an object's dependencies are provided (injected) from outside, instead of the object creating them itself.

⭐ Types of Dependency Injection

    🚀 Initializer Injection → Most common
    🚀 Property Injection
    🚀 Environment Injection (SwiftUI specific)

✅ 1. Initializer Injection (Recommended)
Step 1: Create a protocol
protocol UserServiceProtocol {
    func fetchUser() -> String
}
Step 2: Create real service
class UserService: UserServiceProtocol {
    func fetchUser() -> String { "John Doe" }
}
Step 3: ViewModel with DI
class UserViewModel: ObservableObject {
    @Published var name = ""
    let service: UserServiceProtocol

    init(service: UserServiceProtocol) {
        self.service = service
    }

    func load() {
        name = service.fetchUser()
    }
}

Step 4: Inject in View
struct ContentView: View {
    @StateObject var vm: UserViewModel

    init() {
        _vm = StateObject(wrappedValue: UserViewModel(service: UserService()))
    }

    var body: some View {
        Text(vm.name)
            .onAppear { vm.load() }
    }
}

✅ 2. EnvironmentObject Injection

Good for globally shared dependencies.

Service
class UserManager: ObservableObject {
    @Published var username = "Guest"
}

Inject into environment (App file)
@main
struct DemoApp: App {
    @StateObject var manager = UserManager()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)  // 🔥 DI via environment
        }
    }
}

Use inside view
struct ContentView: View {
    @EnvironmentObject var manager: UserManager

    var body: some View {
        Text("User: \(manager.username)")
    }
}

✅ 3. Custom EnvironmentKey (Advanced DI)

For singleton-like dependencies (API client, theme, etc.)

Step 1: Create EnvironmentKey
struct APIServiceKey: EnvironmentKey {
    static let defaultValue = APIService()
}

Step 2: Add environment value
extension EnvironmentValues {
    var apiService: APIService {
        get { self[APIServiceKey.self] }
        set { self[APIServiceKey.self] = newValue }
    }
}

Step 3: Inject in View
struct ContentView: View {
    @Environment(\.apiService) var apiService

    var body: some View {
        Text(apiService.getData())
    }
}

Step 4: Override (for testing)
ContentView()
    .environment(\.apiService, MockAPIService())

Why Dependency Injection is important in SwiftUI?

    🚀 Allows mocking services for testing
    🚀 Makes view models reusable
    🚀 Reduces tight coupling
    🚀 Improves testability and scalability
    🚀 Works naturally with SwiftUI’s environment system
