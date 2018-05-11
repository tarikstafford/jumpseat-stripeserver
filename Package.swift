// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "StripeJumpSeat",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),

        // Stripe Package
        .package(url: "https://github.com/vapor-community/stripe-provider.git", from: "2.0.2")
    ],
    targets: [
        .target(name: "App", dependencies: ["Vapor", "Stripe"]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)

