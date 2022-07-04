// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AATKitSPM",
    defaultLocalization: "en",
    platforms: [.iOS(.v10)],
    products: [

        .library(name: "AATKit-Core", targets: ["AATKit-Core"]),
        .library(name: "AATKit-M1-Core", targets: ["AATKit-M1-Core"]),
        .library(name: "AATKit-AATAdMobMediationAdapter", targets: ["AATKit-AATAdMobMediationAdapter"]),

        // Dependencies
        .library(name: "AATKit-GoogleMobileAds", targets: ["AATKit-GoogleMobileAds"]),
        .library(name: "AATKit-AppLovin", targets: ["AATKit-AppLovin"]),
        .library(name: "AATKit-Amazon", targets: ["AATKit-Amazon"]),
        .library(name: "AATKit-FeedAd", targets: ["AATKit-FeedAd"]),
        .library(name: "AATKit-Smaato", targets: ["AATKit-Smaato"]),
        .library(name: "AATKit-SmartAd", targets: ["AATKit-SmartAd"]),
        .library(name: "AATKit-AdColony", targets: ["AATKit-AdColony"]),
        .library(name: "AATKit-YOC", targets: ["AATKit-YOC"]),
        .library(name: "AATKit-InMobi", targets: ["AATKit-InMobi"]),
        .library(name: "AATKit-AppNexus", targets: ["AATKit-AppNexus"]),
        .library(name: "AATKit-PubNative", targets: ["AATKit-PubNative"]),
        .library(name: "AATKit-Prebid", targets: ["AATKit-Prebid"]),
        .library(name: "AATKit-Unity", targets: ["AATKit-Unity"]),
        .library(name: "AATKit-Vungle", targets: ["AATKit-Vungle"]),
        .library(name: "AATKit-OguryAds", targets: ["AATKit-OgurySdk"]),
        .library(name: "AATKit-IronSource", targets: ["AATKit-IronSource"]),

        // CMPs
        .library(name: "AATKit-OguryCMP", targets: ["AATKit-OguryCMP"]),
        .library(name: "AATKit-GoogleCMP", targets: ["AATKit-GoogleCMP"]),

        // Default Dependencies
        .library(name: "AATKit-Default", targets: ["AATKit-GoogleMobileAds",
                                                   "AATKit-AppLovin",
                                                   "AATKit-Amazon",
                                                   "AATKit-FeedAd",
                                                   "AATKit-OguryCMP",
                                                   "AATKit-GoogleCMP",
                                                   "AATKit-Smaato",
                                                   "AATKit-SmartAd",
                                                   "AATKit-AdColony",
                                                   "AATKit-YOC",
                                                   "AATKit-InMobi",
                                                   "AATKit-AppNexus",
                                                   "AATKit-OgurySdk",
                                                   "AATKit-PubNative",
                                                   "AATKit-Prebid",
                                                   "AATKit-Unity",
                                                   "AATKit-Vungle",
                                                   "AATKit-IronSource"
                                                  ]),
        // M1 Default dependencies
        .library(name: "AATKit-M1-Default", targets: ["AATKit-GoogleMobileAds",
                                                      "AATKit-AppLovin",
                                                      "AATKit-Amazon",
                                                      "AATKit-OguryCMP",
                                                      "AATKit-GoogleCMP",
                                                      "AATKit-Smaato",
                                                      "AATKit-SmartAd",
                                                      "AATKit-AdColony",
                                                      "AATKit-InMobi",
                                                      "AATKit-AppNexus",
                                                      "AATKit-PubNative",
                                                      "AATKit-Prebid",
                                                     ]),

    ],
    dependencies: [
        // AdNetworks supporting SPM
        .package(name: "AppNexusSDK", url: "https://github.com/appnexus/mobile-sdk-ios", .exact("7.22.0")),
        .package(name: "AppLovinSDK", url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", .exact("11.4.3")),
        .package(name: "GoogleMobileAds", url: "https://github.com/googleads/swift-package-manager-google-mobile-ads", .exact("9.6.0")),
        // same as in https://github.com/googleads/swift-package-manager-google-mobile-ads package file
        .package(name: "GoogleUserMessagingPlatform",url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"3.0.0"),
    ],
    targets: [
        // AATKit target
        .target(name:"AATKit-Core",
                dependencies: ["AATKit"],
                path: "./Sources/AATKit"),
        
        // AATKit M1 target
        .target(name:"AATKit-M1-Core",
                dependencies: ["AATKit-M1"],
                path: "./Sources/AATKit-M1"),

        // AATAdMobMediationAdapter target
        .target(name:"AATKit-AATAdMobMediationAdapter",
                dependencies: [ "AATKit-GoogleMobileAds",
                                "AATDependencyHelper",
                                "AATKit"
                              ],
                path: "./Sources/AATAdMobMediationAdapter"),

        // MARK - Dependencies Targets
        .target(name: "AATKit-GoogleMobileAds",
                dependencies: [ "AATDependencyHelper",
                                .product(name: "GoogleMobileAds", package: "GoogleMobileAds")
                              ],
                path: "./Sources/GoogleMobileAdsSources"),

        .target(name:"AATKit-AdColony",
                dependencies: ["AATAdColonyAdapter","AdColony"],
                path: "./Sources/AdColonySources"),

        .target(name: "AATKit-AppLovin",
                dependencies: ["AppLovinSDK"],
                path: "./Sources/AppLovinSources"),

        .target(name:"AATKit-AppNexus",
                dependencies: ["AppNexusSDK"],
                path: "./Sources/AppNexusSources"),

        .target(name:"AATKit-Amazon",
                dependencies: ["DTBiOSSDK"],
                path: "./Sources/AmazonSources"),

        .target(name:"AATKit-FeedAd",
                dependencies: ["FeedAd"],
                path: "./Sources/FeedAdSources"),

        .target(name:"AATKit-OguryCMP",
                dependencies: ["OguryChoiceManager", "OguryCore", "OgurySdk"],
                path: "./Sources/OguryCMPSources"),

        .target(name:"AATKit-OgurySdk",
                dependencies: ["OgurySdk", "OguryAds", "OguryCore", "OMSDK_Ogury"],
                path: "./Sources/OguryAdsSources"),

        .target(name:"AATKit-GoogleCMP",
                dependencies: [.product(name: "GoogleUserMessagingPlatform", package: "GoogleUserMessagingPlatform")],
                path: "./Sources/GoogleCMPSources"),

        .target(name:"AATKit-Smaato",
                dependencies: ["OMSDK_Smaato",
                               "SmaatoSDKBanner",
                               "SmaatoSDKCore",
                               "SmaatoSDKInterstitial",
                               "SmaatoSDKNative",
                               "SmaatoSDKOpenMeasurement",
                               "SmaatoSDKOutstream",
                               "SmaatoSDKRewardedAds",
                               "SmaatoSDKRichMedia",
                               "SmaatoSDKVideo"],
                path: "./Sources/SmaatoSources"),

        .target(name:"AATKit-SmartAd",
                dependencies: ["SASDisplayKit","SCSCoreKit"],
                path: "./Sources/SmartAdSources"),

        .target(name:"AATKit-YOC",
               dependencies: ["VisxSDK"],
               path: "./Sources/YOCSources"),

        .target(name:"AATKit-InMobi",
                dependencies: ["InMobiSDK"],
                path: "./Sources/InMobiSources"),

        .target(name:"AATKit-PubNative",
                dependencies: ["HyBid", "OMSDK_Pubnativenet"],
                path: "./Sources/PubnativeSources"),

        .target(name:"AATKit-Prebid",
                dependencies: ["PrebidMobile", "OMSDK_Prebidorg"],
                path: "./Sources/PrebidSources"),

        .target(name:"AATKit-Unity",
                dependencies: ["UnityAds"],
                path: "./Sources/UnitySources"),

        .target(name:"AATKit-Vungle",
                dependencies: ["VungleSDK"],
                path: "./Sources/VungleSources"),

        
        .target(name:"AATKit-IronSource",
                dependencies: ["IronSource"],
                path: "./Sources/IronSourceSources"),

        
        // Mark: Binary Targets
        // AATKit
        .binaryTarget(name: "AATKit", path: "./Dependencies/AATKit/AATKit.xcframework"),
        .binaryTarget(name: "AATKit-M1", path: "./Dependencies/AATKit-M1/AATKit-M1.xcframework"),

        // AATAdMobMediationAdapter
        .binaryTarget(name: "AATAdMobMediationAdapter", path: "./Dependencies/AATAdMobMediationAdapter/AATAdMobMediationAdapter.xcframework"),

        // Google
        .binaryTarget(name: "AATDependencyHelper", path: "./Dependencies/Google/AATDependencyHelper.xcframework"),

        // Amazon
        .binaryTarget(name: "DTBiOSSDK", path: "./Dependencies/Amazon/DTBiOSSDK.xcframework"),

        // FeedAd
        .binaryTarget(name: "FeedAd", path: "./Dependencies/FeedAd/FeedAd.xcframework"),

        // Ogury
        .binaryTarget(name: "OguryChoiceManager", path: "./Dependencies/Ogury/OguryChoiceManager.xcframework"),
        .binaryTarget(name: "OguryCore", path: "./Dependencies/Ogury/OguryCore.xcframework"),
        .binaryTarget(name: "OguryAds", path: "./Dependencies/Ogury/OguryAds.xcframework"),
        .binaryTarget(name: "OMSDK_Ogury", path: "./Dependencies/Ogury/OMSDK_Ogury.xcframework"),
        .binaryTarget(name: "OgurySdk", path: "./Dependencies/Ogury/OgurySdk.xcframework"),

        // Smaato
        .binaryTarget(name: "OMSDK_Smaato", path: "./Dependencies/Smaato/OMSDK_Smaato.xcframework"),
        .binaryTarget(name: "SmaatoSDKBanner", path: "./Dependencies/Smaato/SmaatoSDKBanner.xcframework"),
        .binaryTarget(name: "SmaatoSDKCore", path: "./Dependencies/Smaato/SmaatoSDKCore.xcframework"),
        .binaryTarget(name: "SmaatoSDKInterstitial", path: "./Dependencies/Smaato/SmaatoSDKInterstitial.xcframework"),
        .binaryTarget(name: "SmaatoSDKNative", path: "./Dependencies/Smaato/SmaatoSDKNative.xcframework"),
        .binaryTarget(name: "SmaatoSDKOpenMeasurement", path: "./Dependencies/Smaato/SmaatoSDKOpenMeasurement.xcframework"),
        .binaryTarget(name: "SmaatoSDKOutstream", path: "./Dependencies/Smaato/SmaatoSDKOutstream.xcframework"),
        .binaryTarget(name: "SmaatoSDKRewardedAds", path: "./Dependencies/Smaato/SmaatoSDKRewardedAds.xcframework"),
        .binaryTarget(name: "SmaatoSDKRichMedia", path: "./Dependencies/Smaato/SmaatoSDKRichMedia.xcframework"),
        .binaryTarget(name: "SmaatoSDKVideo", path: "./Dependencies/Smaato/SmaatoSDKVideo.xcframework"),

        //SmartAd
        .binaryTarget(name: "SASDisplayKit", path: "./Dependencies/SmartAd/SASDisplayKit.xcframework"),
        .binaryTarget(name: "SCSCoreKit", path: "./Dependencies/SmartAd/SCSCoreKit.xcframework"),

        //AdColony
        .binaryTarget(name: "AATAdColonyAdapter", path: "./Dependencies/AdColony/AATAdColonyAdapter.xcframework"),
        .binaryTarget(name: "AdColony", path: "./Dependencies/AdColony/AdColony.xcframework"),

        // YOC
        .binaryTarget(name: "VisxSDK", path: "./Dependencies/YOC/VisxSDK.xcframework"),

        // InMobi
        .binaryTarget(name: "InMobiSDK", path: "./Dependencies/InMobi/InMobiSDK.xcframework"),

        // PubNative
        .binaryTarget(name: "HyBid", path: "./Dependencies/Pubnative/HyBid.xcframework"),
        .binaryTarget(name: "OMSDK_Pubnativenet", path: "./Dependencies/Pubnative/OMSDK_Pubnativenet.xcframework"),

        // Prebid
        .binaryTarget(name: "PrebidMobile", path: "./Dependencies/Prebid/PrebidMobile.xcframework"),
        .binaryTarget(name: "OMSDK_Prebidorg", path: "./Dependencies/Prebid/OMSDK_Prebidorg.xcframework"),

        // Unity
        .binaryTarget(name: "UnityAds", path: "./Dependencies/Unity/UnityAds.xcframework"),

        // Vungle
        .binaryTarget(name: "VungleSDK", path: "./Dependencies/Vungle/VungleSDK.xcframework"),
        
        // IronSource
        .binaryTarget(name: "IronSource", path: "./Dependencies/IronSource/IronSource.xcframework"),
    ]
)


