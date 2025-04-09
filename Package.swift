// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AATKitSPM",
    defaultLocalization: "en",
    platforms: [.iOS(.v12)],
    products: [

        .library(name: "AATKit-Core", targets: ["AATKit-Core"]),
        .library(name: "AATKit-AATAdMobMediationAdapter", targets: ["AATKit-AATAdMobMediationAdapter"]),
        .library(name: "AATKit-AATAdMobDSPAdapter", targets: ["AATKit-AATAdMobDSPAdapter"]),
        .library(name: "AATKit-GooglePartnerBidding", targets: ["AATKit-GooglePartnerBidding"]),

        // Dependencies
        .library(name: "AATKit-GoogleMobileAds", targets: ["AATKit-GoogleMobileAds"]),
        .library(name: "AATKit-AppLovin", targets: ["AATKit-AppLovin"]),
        .library(name: "AATKit-AppLovinMax", targets: ["AATKit-AppLovinMax"]),
        .library(name: "AATKit-AppNexus", targets: ["AATKit-AppNexus"]),
        .library(name: "AATKit-AppHarbr", targets: ["AATKit-AppHarbr"]),
        .library(name: "AATKit-Amazon", targets: ["AATKit-Amazon"]),
        .library(name: "AATKit-Criteo", targets: ["AATKit-Criteo"]),
        .library(name: "AATKit-FeedAd", targets: ["AATKit-FeedAd"]),
        .library(name: "AATKit-GraviteRTB", targets: ["AATKit-GraviteRTB"]),
        .library(name: "AATKit-Smaato", targets: ["AATKit-Smaato"]),
        .library(name: "AATKit-SmartAd", targets: ["AATKit-SmartAd"]),
        .library(name: "AATKit-YOC", targets: ["AATKit-YOC"]),
        .library(name: "AATKit-InMobi", targets: ["AATKit-InMobi"]),
        .library(name: "AATKit-IronSource", targets: ["AATKit-IronSource"]),
        .library(name: "AATKit-Kidoz", targets: ["AATKit-Kidoz"]),
        .library(name: "AATKit-PubNative", targets: ["AATKit-PubNative"]),
        .library(name: "AATKit-Prebid", targets: ["AATKit-Prebid"]),
        .library(name: "AATKit-Tappx", targets: ["AATKit-Tappx"]),
        .library(name: "AATKit-Teads", targets: ["AATKit-Teads"]),
        .library(name: "AATKit-Unity", targets: ["AATKit-Unity"]),
        .library(name: "AATKit-Vungle", targets: ["AATKit-Vungle"]),
        .library(name: "AATKit-OguryAds", targets: ["AATKit-OgurySdk"]),
        .library(name: "AATKit-Datonomy", targets: ["AATKit-Datonomy"]),
        .library(name: "AATKit-Mintegral", targets: ["AATKit-Mintegral"]),
        .library(name: "AATKit-Facebook", targets: ["AATKit-Facebook"]),
        .library(name: "AATKit-DisplayIO", targets: ["AATKit-DisplayIO"]),


        // CMPs
        .library(name: "AATKit-GoogleCMP", targets: ["AATKit-GoogleCMP"]),
        .library(name: "AATKit-SourcePointCMP", targets: ["AATKit-SourcePointCMP"]),
        .library(name: "AATKit-AppConsentCMP", targets: ["AATKit-AppConsentCMP"]),

        // Default Dependencies
        .library(name: "AATKit-Default", targets: ["AATKit-GoogleMobileAds",
                                                   "AATKit-AppLovin",
                                                   "AATKit-AppLovinMax",
                                                   "AATKit-GraviteRTB",
                                                   "AATKit-Smaato",
                                                   "AATKit-SmartAd",
                                                   "AATKit-YOC",
                                                   "AATKit-InMobi",
                                                   "AATKit-IronSource",
                                                   "AATKit-OgurySdk",
                                                   "AATKit-PubNative",
                                                   "AATKit-Unity",
                                                   "AATKit-Vungle",
                                                   "AATKit-Mintegral",
                                                   "AATKit-GooglePartnerBidding",
                                                   "AATKit-Criteo",
                                                   "AATKit-Tappx",
                                                   "AATKit-Facebook"
                                                   // "AATKit-AppNexus", Issues in the privacy file
                                                   // Missing privacyInfo file
                                                   // "AATKit-Prebid",
                                                  ]),

    ],
    dependencies: [
        // AdNetworks supporting SPM
        .package(name: "AppLovinSDK", url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", .exact("13.2.0")),
        .package(name: "AppHarbrSDK", url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", .exact("1.19.0")),
        .package(name: "GoogleMobileAds", url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", .exact("12.2.0")),
        // same as in https://github.com/googleads/swift-package-manager-google-mobile-ads package file
        .package(name: "GoogleUserMessagingPlatform", url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(name: "RTBSPM", url: "https://github.com/AddApptr/RTBSPM", .exact("1.6.2"))
//        .package(name: "TeadsSDK", url: "https://github.com/teads/TeadsSDK-iOS", .exact("5.1.3")), Conflict with AppLovin dependency
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

        // AATAdMobDSPAdapter
        .target(name:"AATKit-AATAdMobDSPAdapter",
                dependencies: [ "AATKit-GoogleMobileAds", "AATKit", "AATKit-GraviteRTB", "AATAdMobDSPAdapter"],
                path: "./Sources/AATAdMobDSPAdapter"),

        // GooglePartnerBidding
        .target(name:"AATKit-GooglePartnerBidding",
                dependencies: [ "AATKit-GoogleMobileAds", "AATKit", "AATKit-GraviteRTB", "AATAdMobDSPAdapter"],
                path: "./Sources/GooglePartnerBiddingSources"),

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

            .target(name:"AATKit-AppHarbr",
                    dependencies: ["AppHarbrSDK", "AATAppHarbrAdapter"],
                    path: "./Sources/AppHarbr"),

            .target(name:"AATKit-AppNexus",
                    dependencies: ["AppNexusSDK", "OMSDK_Microsoft", "AATAppNexusAdapter"],
                    path: "./Sources/AppNexusSources"),

            .target(name:"AATKit-Amazon",
                    dependencies: ["DTBiOSSDK", "AATAmazonAdapter"],
                    path: "./Sources/AmazonSources"),

            .target(name:"AATKit-Criteo",
                    dependencies: ["CriteoPublisherSdk", "AATCriteoAdapter"],
                    path: "./Sources/CriteoSources"),

            .target(name:"AATKit-FeedAd",
                    dependencies: ["FeedAd", "AATFeedAdAdapter"],
                    path: "./Sources/FeedAdSources"),

            .target(name:"AATKit-GraviteRTB",
                    dependencies: ["RTBSPM", "AATGraviteRTBAdapter"],
                    path: "./Sources/GraviteRTB"),

            .target(name:"AATKit-OgurySdk",
                    dependencies: ["OgurySdk", "OguryAds", "OguryCore", "OMSDK_Ogury", "AATOguryAdapter"],
                    path: "./Sources/OguryAdsSources"),

            .target(name:"AATKit-GoogleCMP",
                    dependencies: [.product(name: "GoogleUserMessagingPlatform", package: "GoogleUserMessagingPlatform"), "AATGoogleCMPAdapter"],
                    path: "./Sources/GoogleCMPSources"),


            .target(name:"AATKit-Facebook",
                    dependencies: ["AATKit-GoogleMobileAds", "AATFacebookAdapter", "FBAudienceNetwork", "MetaAdapter"],
                    path: "./Sources/FacebookSources"),

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

            .target(name:"AATKit-Teads",
                    dependencies: ["TeadsSDK", "OMSDK_Teadstv", "AATTeadsAdapter"],
                    path: "./Sources/TeadsSources"),

            .target(name:"AATKit-YOC",
                    dependencies: ["VisxSDK", "AATYOCAdapter"],
                    path: "./Sources/YOCSources"),

            .target(name:"AATKit-InMobi",
                    dependencies: ["InMobiSDK", "AATInMobiAdapter"],
                    path: "./Sources/InMobiSources"),

            .target(name:"AATKit-IronSource",
                    dependencies: ["IronSource", "AATIronSourceAdapter"],
                    path: "./Sources/IronSourceSources"),

            .target(name:"AATKit-Kidoz",
                    dependencies: ["Kidoz", "AATKidozAdapter"],
                    path: "./Sources/KidozSources"),

            .target(name:"AATKit-PubNative",
                    dependencies: ["HyBid", "OMSDK_Pubnativenet", "ATOM", "AATPubNativeAdapter"],
                    path: "./Sources/PubnativeSources"),

            .target(name:"AATKit-Prebid",
                    dependencies: ["PrebidMobile", "AATDFPPrebidAdapter"],
                    path: "./Sources/PrebidSources"),

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
                    dependencies: ["AATConsentViewController", "AATSourcePointCMPAdapter"],
                    path: "./Sources/SourcePointSources"),

            .target(name:"AATKit-AppConsentCMP",
                    dependencies: ["AppConsent", "AATAppConsentAdapter"],
                    path: "./Sources/AppConsentCMP"),

            .target(name:"AATKit-DisplayIO",
                    dependencies: ["DisplayIO", "AATDisplayIOAdapter"],
                    path: "./Sources/DisplayIOSources"),
        // Mark: Binary Targets
        // AATKit
        .binaryTarget(name: "AATKit", path: "./Dependencies/AATKit/AATKit.xcframework"),

        // AATAdMobMediationAdapter
        .binaryTarget(name: "AATAdMobMediationAdapter", path: "./Dependencies/AATAdMobMediationAdapter/AATAdMobMediationAdapter.xcframework"),

        // AATAdMobDSPAdapter
        .binaryTarget(name: "AATAdMobDSPAdapter", path: "./Dependencies/AATKit/Adapters/AATAdMobDSPAdapter.xcframework"),

        // Amazon
        .binaryTarget(name: "DTBiOSSDK", path: "./Dependencies/Amazon/DTBiOSSDK.xcframework"),

        // Criteo
        .binaryTarget(name: "CriteoPublisherSdk", path: "./Dependencies/Criteo/CriteoPublisherSdk.xcframework"),

        // FeedAd
        .binaryTarget(name: "FeedAd", path: "./Dependencies/FeedAd/FeedAd.xcframework"),

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

        // Tappx
        .binaryTarget(name: "Tappx", path: "./Dependencies/Tappx/TappxFramework.xcframework"),
        .binaryTarget(name: "OMSDK_Tappx", path: "./Dependencies/Tappx/OMSDK_Tappx.xcframework"),

        // Teads
        .binaryTarget(name: "TeadsSDK", path: "./Dependencies/TeadsSDK/TeadsSDK.xcframework"),
        .binaryTarget(name: "OMSDK_Teadstv", path: "./Dependencies/TeadsSDK/OMSDK_Teadstv.xcframework"),

        // YOC
        .binaryTarget(name: "VisxSDK", path: "./Dependencies/YOC/VisxSDK.xcframework"),

        // InMobi
        .binaryTarget(name: "InMobiSDK", path: "./Dependencies/InMobi/InMobiSDK.xcframework"),

        // IronSource
        .binaryTarget(name: "IronSource", path: "./Dependencies/IronSource/IronSource.xcframework"),

        // Kidoz
        .binaryTarget(name: "Kidoz", path: "./Dependencies/Kidoz/KidozSDK.xcframework"),

        // PubNative
        .binaryTarget(name: "HyBid", path: "./Dependencies/Pubnative/HyBid.xcframework"),
        .binaryTarget(name: "OMSDK_Pubnativenet", path: "./Dependencies/Pubnative/OMSDK_Pubnativenet.xcframework"),
        .binaryTarget(name: "ATOM", path: "./Dependencies/Pubnative/ATOM.xcframework"),

        // Prebid
        .binaryTarget(name: "PrebidMobile", path: "./Dependencies/Prebid/PrebidMobile.xcframework"),

        // Unity
        .binaryTarget(name: "UnityAds", path: "./Dependencies/Unity/UnityAds.xcframework"),

        // Vungle
        .binaryTarget(name: "VungleSDK", path: "./Dependencies/Vungle/VungleAdsSDK.xcframework"),

        // Datonomy
        .binaryTarget(name: "DatonomyKit", path: "./Dependencies/Datonomy/DatonomyKit.xcframework"),

        // AppNexusSDK - for future updates, check https://github.com/appnexus/mobile-sdk-ios-spm/blob/main/Package.swift
        .binaryTarget(
            name: "OMSDK_Microsoft",
            url: "https://adsdkprod.azureedge.net/mobile/ios/releases/9.2.1/dynamic/OMSDK_Microsoft.zip",
            checksum: "f0b7cc1c45095a99bcd16e21250610a7614bbdf3d3c99e5f3ee8d762d9fe7dde"
        ),
        .binaryTarget(
            name: "AppNexusSDK",
            url: "https://adsdkprod.azureedge.net/mobile/ios/releases/9.2.1/dynamic/AppNexusSDKDynamic.zip",
            checksum: "a122b9d51dd6c58aec384e1c65bd82d1da2fcdebcedf0cfb3e2b328bd9ced38b"
        ),

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

        // Meta
        .binaryTarget(name: "FBAudienceNetwork", path:"./Dependencies/Facebook/FBAudienceNetwork.xcframework"),
        .binaryTarget(name: "MetaAdapter", path:"./Dependencies/Facebook/MetaAdapter.xcframework"),

        // AppConsent
        .binaryTarget(name: "AppConsent", path:"./Dependencies/AppConsentCMP/AppConsent.xcframework"),

        // SourcePoint
        .binaryTarget(name: "AATConsentViewController", path: "./Dependencies/SourcePoint/ConsentViewController.xcframework"),

        // DisplayIO
        .binaryTarget(name: "DisplayIO", path:"./Dependencies/DisplayIO/DIOSDK.xcframework"),

        // AATKit Adapters
        .binaryTarget(name: "AATAmazonAdapter", path: "./Dependencies/AATKit/Adapters/AATAmazonAdapter.xcframework"),
        .binaryTarget(name: "AATAppLovinAdapter", path: "./Dependencies/AATKit/Adapters/AATAppLovinAdapter.xcframework"),
        .binaryTarget(name: "AATAppLovinMaxAdapter", path: "./Dependencies/AATKit/Adapters/AATAppLovinMaxAdapter.xcframework"),
        .binaryTarget(name: "AATAppHarbrAdapter", path: "./Dependencies/AATKit/Adapters/AATAppHarbrAdapter.xcframework"),
        .binaryTarget(name: "AATAppNexusAdapter", path: "./Dependencies/AATKit/Adapters/AATAppNexusAdapter.xcframework"),
        .binaryTarget(name: "AATCriteoAdapter", path: "./Dependencies/AATKit/Adapters/AATCriteoAdapter.xcframework"),
        .binaryTarget(name: "AATDFPPrebidAdapter", path: "./Dependencies/AATKit/Adapters/AATDFPPrebidAdapter.xcframework"),
        .binaryTarget(name: "AATFacebookAdapter", path: "./Dependencies/AATKit/Adapters/AATFacebookAdapter.xcframework"),
        .binaryTarget(name: "AATFeedAdAdapter", path: "./Dependencies/AATKit/Adapters/AATFeedAdAdapter.xcframework"),
        .binaryTarget(name: "AATGraviteRTBAdapter", path: "./Dependencies/AATKit/Adapters/AATGraviteRTBAdapter.xcframework"),
        .binaryTarget(name: "AATGoogleAdsAdapter", path: "./Dependencies/AATKit/Adapters/AATGoogleAdsAdapter.xcframework"),
        .binaryTarget(name: "AATGoogleCMPAdapter", path: "./Dependencies/AATKit/Adapters/AATGoogleCMPAdapter.xcframework"),
        .binaryTarget(name: "AATInMobiAdapter", path: "./Dependencies/AATKit/Adapters/AATInMobiAdapter.xcframework"),
        .binaryTarget(name: "AATIronSourceAdapter", path: "./Dependencies/AATKit/Adapters/AATIronSourceAdapter.xcframework"),
        .binaryTarget(name: "AATKidozAdapter", path: "./Dependencies/AATKit/Adapters/AATKidozAdapter.xcframework"),
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
        .binaryTarget(name: "AATAppConsentAdapter", path: "./Dependencies/AATKit/Adapters/AATAppConsentAdapter.xcframework"),
        .binaryTarget(name: "AATDisplayIOAdapter", path: "./Dependencies/AATKit/Adapters/AATDisplayIOAdapter.xcframework"),

    ]
)
