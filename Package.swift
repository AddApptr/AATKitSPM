// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AATKitSPM",
    defaultLocalization: "en",
    platforms: [.iOS(.v11)],
    products: [

        .library(name: "AATKit-Core", targets: ["AATKit-Core"]),
        .library(name: "AATKit-AATAdMobMediationAdapter", targets: ["AATKit-AATAdMobMediationAdapter"]),

        // Dependencies
        .library(name: "AATKit-GoogleMobileAds", targets: ["AATKit-GoogleMobileAds"]),
        .library(name: "AATKit-AppLovin", targets: ["AATKit-AppLovin"]),
        .library(name: "AATKit-AppLovinMax", targets: ["AATKit-AppLovinMax"]),
        .library(name: "AATKit-Amazon", targets: ["AATKit-Amazon"]),
        .library(name: "AATKit-Bluestack", targets: ["AATKit-Bluestack"]),
        .library(name: "AATKit-Criteo", targets: ["AATKit-Criteo"]),
        .library(name: "AATKit-FeedAd", targets: ["AATKit-FeedAd"]),
        .library(name: "AATKit-GraviteRTB", targets: ["AATKit-GraviteRTB"]),
        .library(name: "AATKit-Smaato", targets: ["AATKit-Smaato"]),
        .library(name: "AATKit-SmartAd", targets: ["AATKit-SmartAd"]),
        .library(name: "AATKit-YOC", targets: ["AATKit-YOC"]),
        .library(name: "AATKit-InMobi", targets: ["AATKit-InMobi"]),
        .library(name: "AATKit-IronSource", targets: ["AATKit-IronSource"]),
        .library(name: "AATKit-AppNexus", targets: ["AATKit-AppNexus"]),
        .library(name: "AATKit-PubNative", targets: ["AATKit-PubNative"]),
        .library(name: "AATKit-Prebid", targets: ["AATKit-Prebid"]),
        .library(name: "AATKit-Teads", targets: ["AATKit-Teads"]),
        .library(name: "AATKit-Tappx", targets: ["AATKit-Tappx"]),
        .library(name: "AATKit-Unity", targets: ["AATKit-Unity"]),
        .library(name: "AATKit-Vungle", targets: ["AATKit-Vungle"]),
        .library(name: "AATKit-OguryAds", targets: ["AATKit-OgurySdk"]),
        .library(name: "AATKit-Datonomy", targets: ["AATKit-Datonomy"]),
        .library(name: "AATKit-Mintegral", targets: ["AATKit-Mintegral"]),

        // CMPs
        .library(name: "AATKit-GoogleCMP", targets: ["AATKit-GoogleCMP"]),
        .library(name: "AATKit-SourcePointCMP", targets: ["AATKit-SourcePointCMP"]),


        // Default Dependencies
        .library(name: "AATKit-Default", targets: ["AATKit-GoogleMobileAds",
                                                   "AATKit-AppLovin",
                                                   "AATKit-AppLovinMax",
                                                   "AATKit-Amazon",
                                                   "AATKit-Bluestack",
                                                   "AATKit-Criteo",
                                                   "AATKit-FeedAd",
                                                   "AATKit-GraviteRTB",
                                                   "AATKit-GoogleCMP",
                                                   "AATKit-SourcePointCMP",
                                                   "AATKit-Smaato",
                                                   "AATKit-SmartAd",
                                                   "AATKit-YOC",
                                                   "AATKit-InMobi",
                                                   "AATKit-IronSource",
                                                   "AATKit-AppNexus",
                                                   "AATKit-OgurySdk",
                                                   "AATKit-PubNative",
                                                   "AATKit-Prebid",
                                                   "AATKit-Tappx",
                                                   "AATKit-Unity",
                                                   "AATKit-Vungle",
                                                   "AATKit-Mintegral",
                                                  ]),

    ],
    dependencies: [
        // AdNetworks supporting SPM
        .package(name: "AppLovinSDK", url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", .exact("11.11.4")),
        .package(name: "GoogleMobileAds", url: "https://github.com/googleads/swift-package-manager-google-mobile-ads", .exact("10.12.0")),
        // same as in https://github.com/googleads/swift-package-manager-google-mobile-ads package file
        .package(name: "GoogleUserMessagingPlatform",url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"3.0.0"),
        .package(name: "TeadsSDK", url: "https://github.com/teads/TeadsSDK-iOS", .exact("5.0.27"))
    ],
    targets: [
        // AATKit target
        .target(name:"AATKit-Core",
                dependencies: ["AATKit"],
                path: "./Sources/AATKit"),

        // AATAdMobMediationAdapter target
        .target(name:"AATKit-AATAdMobMediationAdapter",
                dependencies: [ "AATKit-GoogleMobileAds",
                                "AATKit"
                              ],
                path: "./Sources/AATAdMobMediationAdapter"),

        // MARK - Dependencies Targets
        .target(name: "AATKit-GoogleMobileAds",
                dependencies: [ "AATGoogleAdsAdapter", .product(name: "GoogleMobileAds", package: "GoogleMobileAds")],
                path: "./Sources/GoogleMobileAdsSources"),

            .target(name: "AATKit-AppLovin",
                    dependencies: ["AppLovinSDK", "AATAppLovinAdapter"],
                    path: "./Sources/AppLovinSources"),
        
            .target(name: "AATKit-AppLovinMax",
                    dependencies: ["AppLovinSDK", "AATAppLovinMaxAdapter"],
                    path: "./Sources/AppLovinMaxSources"),

            .target(name:"AATKit-AppNexus",
                    dependencies: ["AppNexusSDK", "AATAppNexusAdapter", "OMSDK_Microsoft"],
                    path: "./Sources/AppNexusSources"),

            .target(name:"AATKit-Amazon",
                    dependencies: ["DTBiOSSDK", "AATAmazonAdapter"],
                    path: "./Sources/AmazonSources"),

            .target(name:"AATKit-Bluestack",
                    dependencies: ["BlueStackSDK", "OMSDK_Madvertise", "AATBluestackAdapter"],
                    path: "./Sources/BluestackSources"),

            .target(name:"AATKit-Criteo",
                    dependencies: ["CriteoPublisherSdk", "AATCriteoAdapter"],
                    path: "./Sources/CriteoSources"),

            .target(name:"AATKit-FeedAd",
                    dependencies: ["FeedAd", "AATFeedAdAdapter"],
                    path: "./Sources/FeedAdSources"),

            .target(name:"AATKit-GraviteRTB",
                    dependencies: ["GraviteRTB", "AATGraviteRTBAdapter"],
                    path: "./Sources/GraviteRTB"),

            .target(name:"AATKit-OgurySdk",
                    dependencies: ["OgurySdk", "OguryAds", "OguryCore", "OMSDK_Ogury", "AATOguryAdapter"],
                    path: "./Sources/OguryAdsSources"),

            .target(name:"AATKit-GoogleCMP",
                    dependencies: [.product(name: "GoogleUserMessagingPlatform", package: "GoogleUserMessagingPlatform"), "AATGoogleCMPAdapter"],
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
                                   "SmaatoSDKVideo",
                                   "AATSmaatoAdapter"],
                    path: "./Sources/SmaatoSources"),

            .target(name:"AATKit-SmartAd",
                    dependencies: ["SASDisplayKit", "AATSmartAdAdapter"],
                    path: "./Sources/SmartAdSources"),

            .target(name:"AATKit-Tappx",
                    dependencies: ["Tappx", "OMSDK_Tappx", "AATTappxAdapter"],
                    path: "./Sources/Tappx"),

            .target(name:"AATKit-YOC",
                    dependencies: ["VisxSDK", "AATYOCAdapter"],
                    path: "./Sources/YOCSources"),

            .target(name:"AATKit-InMobi",
                    dependencies: ["InMobiSDK", "AATInMobiAdapter"],
                    path: "./Sources/InMobiSources"),

            .target(name:"AATKit-IronSource",
                    dependencies: ["IronSource", "AATIronSourceAdapter"],
                    path: "./Sources/IronSourceSources"),

            .target(name:"AATKit-PubNative",
                    dependencies: ["HyBid", "OMSDK_Pubnativenet", "AATPubNativeAdapter"],
                    path: "./Sources/PubnativeSources"),

            .target(name:"AATKit-Prebid",
                    dependencies: ["PrebidMobile", "AATDFPPrebidAdapter"],
                    path: "./Sources/PrebidSources"),

            .target(name:"AATKit-Teads",
                    dependencies: ["TeadsSDK", "AATTeadsAdapter"],
                    path: "./Sources/TeadsSources"),

            .target(name:"AATKit-Unity",
                    dependencies: ["UnityAds", "AATUnityAdapter"],
                    path: "./Sources/UnitySources"),

            .target(name:"AATKit-Vungle",
                    dependencies: ["VungleSDK", "AATVungleAdapter"],
                    path: "./Sources/VungleSources"),

            .target(name:"AATKit-Datonomy",
                    dependencies: ["DatonomyKit", "AATDatonomyAdapter"],
                    path: "./Sources/DatonomySources"),

            .target(name:"AATKit-Mintegral",
                    dependencies: ["MTGSDK", "MTGSDKNativeAdvanced", "MTGSDKBanner", "MTGSDKNewInterstitial", "MTGSDKBidding", "MTGSDKReward", "MTGSDKCNAddition", "MTGSDKSplash", "MTGSDKInterstitial", "MTGSDKInterstitialVideo", "AATMintegralAdapter"],
                    path: "./Sources/MintegralSources"),

            .target(name:"AATKit-SourcePointCMP",
                    dependencies: ["ConsentViewController", "AATSourcePointCMPAdapter"],
                    path: "./Sources/SourcePointSources"),

        // Mark: Binary Targets
        // AATKit
            .binaryTarget(name: "AATKit", path: "./Dependencies/AATKit/AATKit.xcframework"),

        // AATAdMobMediationAdapter
        .binaryTarget(name: "AATAdMobMediationAdapter", path: "./Dependencies/AATAdMobMediationAdapter/AATAdMobMediationAdapter.xcframework"),

        // Amazon
        .binaryTarget(name: "DTBiOSSDK", path: "./Dependencies/Amazon/DTBiOSSDK.xcframework"),

        // Bluestack
        .binaryTarget(name: "BlueStackSDK", path: "./Dependencies/Bluestack/BlueStackSDK.xcframework"),
        .binaryTarget(name: "OMSDK_Madvertise", path: "./Dependencies/Bluestack/OMSDK_Madvertise.xcframework"),

        // Criteo
        .binaryTarget(name: "CriteoPublisherSdk", path: "./Dependencies/Criteo/CriteoPublisherSdk.xcframework"),

        // FeedAd
        .binaryTarget(name: "FeedAd", path: "./Dependencies/FeedAd/FeedAd.xcframework"),

        // GraviteRTB
        .binaryTarget(name: "GraviteRTB", path: "./Dependencies/GraviteRTB/RTBSDK.xcframework"),

        // Ogury
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

        .binaryTarget(name: "Tappx", path: "./Dependencies/Tappx/TappxFramework.xcframework"),
        .binaryTarget(name: "OMSDK_Tappx", path: "./Dependencies/Tappx/OMSDK_Tappx.xcframework"),

        // YOC
        .binaryTarget(name: "VisxSDK", path: "./Dependencies/YOC/VisxSDK.xcframework"),

        // InMobi
        .binaryTarget(name: "InMobiSDK", path: "./Dependencies/InMobi/InMobiSDK.xcframework"),

        // IronSource
        .binaryTarget(name: "IronSource", path: "./Dependencies/IronSource/IronSource.xcframework"),

        // PubNative
        .binaryTarget(name: "HyBid", path: "./Dependencies/Pubnative/HyBid.xcframework"),
        .binaryTarget(name: "OMSDK_Pubnativenet", path: "./Dependencies/Pubnative/OMSDK_Pubnativenet.xcframework"),

        // Prebid
        .binaryTarget(name: "PrebidMobile", path: "./Dependencies/Prebid/PrebidMobile.xcframework"),

        // Unity
        .binaryTarget(name: "UnityAds", path: "./Dependencies/Unity/UnityAds.xcframework"),

        // Vungle
        .binaryTarget(name: "VungleSDK", path: "./Dependencies/Vungle/VungleAdsSDK.xcframework"),

        // Datonomy
        .binaryTarget(name: "DatonomyKit", path: "./Dependencies/Datonomy/DatonomyKit.xcframework"),

        // AppNexusSDK
        .binaryTarget(name: "AppNexusSDK", path: "./Dependencies/AppNexusSDK/AppNexusSDK.xcframework"),
        .binaryTarget(name: "OMSDK_Microsoft", path: "./Dependencies/AppNexusSDK/OMSDK_Microsoft.xcframework"),

        // Mintegral
        .binaryTarget(name: "MTGSDK", path:"./Dependencies/Mintegral/MTGSDK.xcframework"),
        .binaryTarget(name: "MTGSDKNativeAdvanced", path:"./Dependencies/Mintegral/MTGSDKNativeAdvanced.xcframework"),
        .binaryTarget(name: "MTGSDKBanner", path:"./Dependencies/Mintegral/MTGSDKBanner.xcframework"),
        .binaryTarget(name: "MTGSDKNewInterstitial", path:"./Dependencies/Mintegral/MTGSDKNewInterstitial.xcframework"),
        .binaryTarget(name: "MTGSDKBidding", path:"./Dependencies/Mintegral/MTGSDKBidding.xcframework"),
        .binaryTarget(name: "MTGSDKReward", path:"./Dependencies/Mintegral/MTGSDKReward.xcframework"),
        .binaryTarget(name: "MTGSDKCNAddition", path:"./Dependencies/Mintegral/MTGSDKCNAddition.xcframework"),
        .binaryTarget(name: "MTGSDKSplash", path:"./Dependencies/Mintegral/MTGSDKSplash.xcframework"),
        .binaryTarget(name: "MTGSDKInterstitial", path:"./Dependencies/Mintegral/MTGSDKInterstitial.xcframework"),
        .binaryTarget(name: "MTGSDKInterstitialVideo", path:"./Dependencies/Mintegral/MTGSDKInterstitialVideo.xcframework"),

        // SourcePoint
        .binaryTarget(name: "ConsentViewController", path: "./Dependencies/SourcePoint/ConsentViewController.xcframework"),

        // AATKit Adapters
        .binaryTarget(name: "AATAmazonAdapter", path: "./Dependencies/AATKit/Adapters/AATAmazonAdapter.xcframework"),
        .binaryTarget(name: "AATAppLovinAdapter", path: "./Dependencies/AATKit/Adapters/AATAppLovinAdapter.xcframework"),
        .binaryTarget(name: "AATAppLovinMaxAdapter", path: "./Dependencies/AATKit/Adapters/AATAppLovinMaxAdapter.xcframework"),
        .binaryTarget(name: "AATAppNexusAdapter", path: "./Dependencies/AATKit/Adapters/AATAppNexusAdapter.xcframework"),
        .binaryTarget(name: "AATBluestackAdapter", path: "./Dependencies/AATKit/Adapters/AATBluestackAdapter.xcframework"),
        .binaryTarget(name: "AATCriteoAdapter", path: "./Dependencies/AATKit/Adapters/AATCriteoAdapter.xcframework"),
        .binaryTarget(name: "AATDFPPrebidAdapter", path: "./Dependencies/AATKit/Adapters/AATDFPPrebidAdapter.xcframework"),
        .binaryTarget(name: "AATFacebookAdapter", path: "./Dependencies/AATKit/Adapters/AATFacebookAdapter.xcframework"),
        .binaryTarget(name: "AATFeedAdAdapter", path: "./Dependencies/AATKit/Adapters/AATFeedAdAdapter.xcframework"),
        .binaryTarget(name: "AATGraviteRTBAdapter", path: "./Dependencies/AATKit/Adapters/AATGraviteRTBAdapter.xcframework"),
        .binaryTarget(name: "AATGoogleAdsAdapter", path: "./Dependencies/AATKit/Adapters/AATGoogleAdsAdapter.xcframework"),
        .binaryTarget(name: "AATGoogleCMPAdapter", path: "./Dependencies/AATKit/Adapters/AATGoogleCMPAdapter.xcframework"),
        .binaryTarget(name: "AATInMobiAdapter", path: "./Dependencies/AATKit/Adapters/AATInMobiAdapter.xcframework"),
        .binaryTarget(name: "AATIronSourceAdapter", path: "./Dependencies/AATKit/Adapters/AATIronSourceAdapter.xcframework"),
        .binaryTarget(name: "AATOguryAdapter", path: "./Dependencies/AATKit/Adapters/AATOguryAdapter.xcframework"),
        .binaryTarget(name: "AATPubNativeAdapter", path: "./Dependencies/AATKit/Adapters/AATPubNativeAdapter.xcframework"),
        .binaryTarget(name: "AATSmaatoAdapter", path: "./Dependencies/AATKit/Adapters/AATSmaatoAdapter.xcframework"),
        .binaryTarget(name: "AATSmartAdAdapter", path: "./Dependencies/AATKit/Adapters/AATSmartAdAdapter.xcframework"),
        .binaryTarget(name: "AATTappxAdapter", path: "./Dependencies/AATKit/Adapters/AATTappxAdapter.xcframework"),
        .binaryTarget(name: "AATTeadsAdapter", path: "./Dependencies/AATKit/Adapters/AATTeadsAdapter.xcframework"),
        .binaryTarget(name: "AATUnityAdapter", path: "./Dependencies/AATKit/Adapters/AATUnityAdapter.xcframework"),
        .binaryTarget(name: "AATVungleAdapter", path: "./Dependencies/AATKit/Adapters/AATVungleAdapter.xcframework"),
        .binaryTarget(name: "AATYOCAdapter", path: "./Dependencies/AATKit/Adapters/AATYOCAdapter.xcframework"),
        .binaryTarget(name: "AATDatonomyAdapter", path: "./Dependencies/AATKit/Adapters/AATDatonomyAdapter.xcframework"),
        .binaryTarget(name: "AATMintegralAdapter", path: "./Dependencies/AATKit/Adapters/AATMintegralAdapter.xcframework"),
        .binaryTarget(name: "AATSourcePointCMPAdapter", path: "./Dependencies/AATKit/Adapters/AATSourcePointCMPAdapter.xcframework"),
    ]
)


