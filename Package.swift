// swift-tools-version:5.8
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
        .library(name: "AATKit-Mintegral", targets: ["AATKit-Mintegral"]),
        .library(name: "AATKit-Facebook", targets: ["AATKit-Facebook"]),
        .library(name: "AATKit-DisplayIO", targets: ["AATKit-DisplayIO"]),
        .library(name: "AATAppNexusAdapter", targets: ["AATAppNexusAdapter"]),
        .library(name: "AATAmazonAdapter", targets: ["AATAmazonAdapter"]),

        // CMPs
        .library(name: "AATKit-GoogleCMP", targets: ["AATKit-GoogleCMP"]),
        .library(name: "AATKit-SourcePointCMP", targets: ["AATKit-SourcePointCMP"]),
        .library(name: "AATKit-AppConsentCMP", targets: ["AATKit-AppConsentCMP"]),

        // Default Dependencies
        .library(name: "AATKit-Default", targets: ["AATKit-GoogleMobileAds",
                                                   "AATKit-AppLovin",
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
                                                   "AATKit-Facebook",
                                                   "AATKit-AppNexus",
                                                   "AATKit-Prebid"
                                                  ]),

    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: Version(13, 2, 0)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: Version(12, 4, 0)),
        .package(url: "https://github.com/GeoEdgeSDK/AppHarbrSDK.git", exact: Version(1, 21, 1)),
        .package(url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git", "1.1.0"..<"4.0.0"),
        .package(url: "https://github.com/AddApptr/RTBSPM.git", branch: "1.7.0"),
//        .package(name: "TeadsSDK", url: "https://github.com/teads/TeadsSDK-iOS", .exact("5.1.3")), Conflict in AppLovin dependency
    ],
    targets: [
        // AATKit target
        .target(name:"AATKit-Core",
                dependencies: ["AATKit"],
                path: "./Sources/AATKit"),

        // AATAdMobMediationAdapter target
        .target(name:"AATKit-AATAdMobMediationAdapter",
                dependencies: ["AATKit-GoogleMobileAds", "AATKit"],
                path: "./Sources/AATAdMobMediationAdapter"),

        // AATAdMobDSPAdapter
        .target(name:"AATKit-AATAdMobDSPAdapter",
                dependencies: [ "AATKit-GoogleMobileAds", "AATKit", "AATKit-GraviteRTB", "AATAdMobDSPAdapter"],
                path: "./Sources/AATAdMobDSPAdapter"),

        // GooglePartnerBidding
        .target(name:"AATKit-GooglePartnerBidding",
                dependencies: [
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "AATKit", "AATKit-GraviteRTB",
                    "AATAdMobDSPAdapter"
                ],
                path: "./Sources/GooglePartnerBiddingSources"),

        // MARK - Dependencies Targets
        .target(name: "AATKit-GoogleMobileAds",
                dependencies: [
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "AATGoogleAdsAdapter",
                ],
                path: "./Sources/GoogleMobileAdsSources"),

        .target(name: "AATKit-AppLovin",
                dependencies: [
                    .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                    "AATAppLovinAdapter"
                ],
                path: "./Sources/AppLovinSources"),

        .target(name:"AATKit-AppHarbr",
                dependencies: [
                    .product(name: "AppHarbrSDK", package: "AppHarbrSDK"),
                    "AATAppHarbrAdapter"
                ],
                path: "./Sources/AppHarbr"),

        .target(name:"AATKit-AppNexus",
                dependencies: ["AATAppNexusSDKTarget", "AATOMSDK_Microsoft", "AATAppNexusAdapter"],
                path: "./Sources/AppNexusSources"),

        .target(name:"AATKit-Amazon",
                dependencies: ["AATDTBiOSSDK", "AATAmazonAdapter"],
                path: "./Sources/AmazonSources"),

        .target(name:"AATKit-Criteo",
                dependencies: ["AATCriteoPublisherSdk", "AATCriteoAdapter"],
                path: "./Sources/CriteoSources"),

        .target(name:"AATKit-FeedAd",
                dependencies: ["AATFeedAd", "AATFeedAdAdapter"],
                path: "./Sources/FeedAdSources"),

        .target(name:"AATKit-GraviteRTB",
                dependencies: [
                    .product(name: "RTBSPM", package: "RTBSPM"),
                    "AATGraviteRTBAdapter"
                ],
                path: "./Sources/GraviteRTB"),

        .target(name:"AATKit-OgurySdk",
                dependencies: ["AATOgurySdk", "AATOguryAds", "AATOguryCore", "AATOMSDK_Ogury", "AATOguryAdapter"],
                path: "./Sources/OguryAdsSources"),

        .target(name:"AATKit-GoogleCMP",
                dependencies: [
                    .product(name: "GoogleUserMessagingPlatform", package: "swift-package-manager-google-user-messaging-platform"),
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "AATGoogleCMPAdapter"
                ],
                path: "./Sources/GoogleCMPSources"),


        .target(name:"AATKit-Facebook",
                dependencies: [
                    .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                    "AATFacebookAdapter",
                    "AATFBAudienceNetwork",
                    "AATMetaAdapter"
                ],
                path: "./Sources/FacebookSources"),

        .target(name:"AATKit-Smaato",
                dependencies: [
                    "AATOMSDK_Smaato",
                    "AATSmaatoSDKBanner",
                    "AATSmaatoSDKCore",
                    "AATSmaatoSDKInterstitial",
                    "AATSmaatoSDKNative",
                    "AATSmaatoSDKOpenMeasurement",
                    "AATSmaatoSDKOutstream",
                    "AATSmaatoSDKRewardedAds",
                    "AATSmaatoSDKRichMedia",
                    "AATSmaatoSDKVideo",
                    "AATSmaatoAdapter"
                ],
                path: "./Sources/SmaatoSources"),

        .target(name:"AATKit-SmartAd",
                dependencies: ["AATSASDisplayKit", "AATSmartAdAdapter"],
                path: "./Sources/SmartAdSources"),

        .target(name:"AATKit-Tappx",
                dependencies: ["AATTappx", "AATOMSDK_Tappx", "AATTappxAdapter"],
                path: "./Sources/Tappx"),

        .target(name:"AATKit-Teads",
                dependencies: ["AATTeadsSDK", "AATOMSDK_Teadstv", "AATTeadsAdapter"],
                path: "./Sources/TeadsSources"),

        .target(name:"AATKit-YOC",
                dependencies: ["AATVisxSDK", "AATYOCAdapter"],
                path: "./Sources/YOCSources"),

        .target(name:"AATKit-InMobi",
                dependencies: ["AATInMobiSDK", "AATInMobiAdapter"],
                path: "./Sources/InMobiSources"),

        .target(name:"AATKit-IronSource",
                dependencies: ["AATIronSource", "AATIronSourceAdapter"],
                path: "./Sources/IronSourceSources"),

        .target(name:"AATKit-Kidoz",
                dependencies: ["AATKidoz", "AATKidozAdapter"],
                path: "./Sources/KidozSources"),

        .target(name:"AATKit-PubNative",
                dependencies: ["AATHyBid", "AATOMSDK_Pubnativenet", "AATATOM", "AATPubNativeAdapter"],
                path: "./Sources/PubnativeSources"),

        .target(name:"AATKit-Prebid",
                dependencies: ["AATPrebidMobile", "AATDFPPrebidAdapter"],
                path: "./Sources/PrebidSources"),

        .target(name:"AATKit-Unity",
                dependencies: ["AATUnityAds", "AATUnityAdapter"],
                path: "./Sources/UnitySources"),

        .target(name:"AATKit-Vungle",
                dependencies: ["AATVungleSDK", "AATVungleAdapter"],
                path: "./Sources/VungleSources"),

        .target(name:"AATKit-Mintegral",
                dependencies: [
                    "AATMTGSDK",
                    "AATMTGSDKNativeAdvanced",
                    "AATMTGSDKBanner",
                    "AATMTGSDKNewInterstitial",
                    "AATMTGSDKBidding",
                    "AATMTGSDKReward",
                    "AATMTGSDKSplash",
                    "AATMTGSDKInterstitialVideo",
                    "AATMintegralAdapter"
                ],
                path: "./Sources/MintegralSources"),

        .target(name:"AATKit-SourcePointCMP",
                dependencies: ["AATConsentViewController", "AATSourcePointCMPAdapter"],
                path: "./Sources/SourcePointSources"),

        .target(name:"AATKit-AppConsentCMP",
                dependencies: ["AATAppConsent", "AATAppConsentAdapter"],
                path: "./Sources/AppConsentCMP"),

        .target(name:"AATKit-DisplayIO",
                dependencies: ["AATDisplayIO", "AATDisplayIOAdapter"],
                path: "./Sources/DisplayIOSources"),
        // Mark: Binary Targets
        // AATKit
            .binaryTarget(name: "AATKit", path: "./Dependencies/AATKit/AATKit.xcframework"),

        // AATAdMobMediationAdapter
        .binaryTarget(name: "AATAdMobMediationAdapter", path: "./Dependencies/AATAdMobMediationAdapter/AATAdMobMediationAdapter.xcframework"),

        // AATAdMobDSPAdapter
        .binaryTarget(name: "AATAdMobDSPAdapter", path: "./Dependencies/AATKit/Adapters/AATAdMobDSPAdapter.xcframework"),

        // Amazon
        .binaryTarget(name: "AATDTBiOSSDK", path: "./Dependencies/Amazon/DTBiOSSDK.xcframework"),

        // Criteo
        .binaryTarget(name: "AATCriteoPublisherSdk", path: "./Dependencies/Criteo/CriteoPublisherSdk.xcframework"),

        // FeedAd
        .binaryTarget(name: "AATFeedAd", path: "./Dependencies/FeedAd/FeedAd.xcframework"),

        // Ogury
        .binaryTarget(name: "AATOguryCore", path: "./Dependencies/Ogury/OguryCore.xcframework"),
        .binaryTarget(name: "AATOguryAds", path: "./Dependencies/Ogury/OguryAds.xcframework"),
        .binaryTarget(name: "AATOMSDK_Ogury", path: "./Dependencies/Ogury/OMSDK_Ogury.xcframework"),
        .binaryTarget(name: "AATOgurySdk", path: "./Dependencies/Ogury/OgurySdk.xcframework"),

        // Smaato
        .binaryTarget(name: "AATOMSDK_Smaato", path: "./Dependencies/Smaato/OMSDK_Smaato.xcframework"),
        .binaryTarget(name: "AATSmaatoSDKBanner", path: "./Dependencies/Smaato/SmaatoSDKBanner.xcframework"),
        .binaryTarget(name: "AATSmaatoSDKCore", path: "./Dependencies/Smaato/SmaatoSDKCore.xcframework"),
        .binaryTarget(name: "AATSmaatoSDKInterstitial", path: "./Dependencies/Smaato/SmaatoSDKInterstitial.xcframework"),
        .binaryTarget(name: "AATSmaatoSDKNative", path: "./Dependencies/Smaato/SmaatoSDKNative.xcframework"),
        .binaryTarget(name: "AATSmaatoSDKOpenMeasurement", path: "./Dependencies/Smaato/SmaatoSDKOpenMeasurement.xcframework"),
        .binaryTarget(name: "AATSmaatoSDKOutstream", path: "./Dependencies/Smaato/SmaatoSDKOutstream.xcframework"),
        .binaryTarget(name: "AATSmaatoSDKRewardedAds", path: "./Dependencies/Smaato/SmaatoSDKRewardedAds.xcframework"),
        .binaryTarget(name: "AATSmaatoSDKRichMedia", path: "./Dependencies/Smaato/SmaatoSDKRichMedia.xcframework"),
        .binaryTarget(name: "AATSmaatoSDKVideo", path: "./Dependencies/Smaato/SmaatoSDKVideo.xcframework"),

        //SmartAd
        .binaryTarget(name: "AATSASDisplayKit", path: "./Dependencies/SmartAd/SASDisplayKit.xcframework"),

        // Tappx
        .binaryTarget(name: "AATTappx", path: "./Dependencies/Tappx/TappxFramework.xcframework"),
        .binaryTarget(name: "AATOMSDK_Tappx", path: "./Dependencies/Tappx/OMSDK_Tappx.xcframework"),

        // Teads
        .binaryTarget(name: "AATTeadsSDK", path: "./Dependencies/TeadsSDK/TeadsSDK.xcframework"),
        .binaryTarget(name: "AATOMSDK_Teadstv", path: "./Dependencies/TeadsSDK/OMSDK_Teadstv.xcframework"),

        // YOC
        .binaryTarget(name: "AATVisxSDK", path: "./Dependencies/YOC/VisxSDK.xcframework"),

        // InMobi
        .binaryTarget(name: "AATInMobiSDK", path: "./Dependencies/InMobi/InMobiSDK.xcframework"),

        // IronSource
        .binaryTarget(name: "AATIronSource", path: "./Dependencies/IronSource/IronSource.xcframework"),

        // Kidoz
        .binaryTarget(name: "AATKidoz", path: "./Dependencies/Kidoz/KidozSDK.xcframework"),

        // PubNative
        .binaryTarget(name: "AATHyBid", path: "./Dependencies/Pubnative/HyBid.xcframework"),
        .binaryTarget(name: "AATOMSDK_Pubnativenet", path: "./Dependencies/Pubnative/OMSDK_Pubnativenet.xcframework"),
        .binaryTarget(name: "AATATOM", path: "./Dependencies/Pubnative/ATOM.xcframework"),

        // Prebid
        .binaryTarget(name: "AATPrebidMobile", path: "./Dependencies/Prebid/PrebidMobile.xcframework"),

        // Unity
        .binaryTarget(name: "AATUnityAds", path: "./Dependencies/Unity/UnityAds.xcframework"),

        // Vungle
        .binaryTarget(name: "AATVungleSDK", path: "./Dependencies/Vungle/VungleAdsSDK.xcframework"),

        // AppNexusSDK - for future updates, check https://github.com/appnexus/mobile-sdk-ios-spm/blob/main/Package.swift
        .binaryTarget(
            name: "AATOMSDK_Microsoft",
            url: "https://adsdkprod.azureedge.net/mobile/ios/releases/9.5.0/dynamic/OMSDK_Microsoft.zip",
            checksum: "22c9115cb46ee6301d8ef8972c2b77af0f00c55f93bc8cd28817ae62da99b670"
        ),
        .binaryTarget(
            name: "AATAppNexusSDKTarget",
            url: "https://adsdkprod.azureedge.net/mobile/ios/releases/9.5.0/dynamic/AppNexusSDKDynamic.zip",
            checksum: "d9f48664619e1a51aa29d7a93cfcb561c015cd69c84aebf152c04ecf2c56f36f"
        ),

        // Mintegral
        .binaryTarget(name: "AATMTGSDK", path:"./Dependencies/Mintegral/MTGSDK.xcframework"),
        .binaryTarget(name: "AATMTGSDKNativeAdvanced", path:"./Dependencies/Mintegral/MTGSDKNativeAdvanced.xcframework"),
        .binaryTarget(name: "AATMTGSDKBanner", path:"./Dependencies/Mintegral/MTGSDKBanner.xcframework"),
        .binaryTarget(name: "AATMTGSDKNewInterstitial", path:"./Dependencies/Mintegral/MTGSDKNewInterstitial.xcframework"),
        .binaryTarget(name: "AATMTGSDKBidding", path:"./Dependencies/Mintegral/MTGSDKBidding.xcframework"),
        .binaryTarget(name: "AATMTGSDKReward", path:"./Dependencies/Mintegral/MTGSDKReward.xcframework"),
        .binaryTarget(name: "AATMTGSDKSplash", path:"./Dependencies/Mintegral/MTGSDKSplash.xcframework"),
        .binaryTarget(name: "AATMTGSDKInterstitialVideo", path:"./Dependencies/Mintegral/MTGSDKInterstitialVideo.xcframework"),

        // Meta
        .binaryTarget(name: "AATFBAudienceNetwork", path:"./Dependencies/Facebook/FBAudienceNetwork.xcframework"),
        .binaryTarget(name: "AATMetaAdapter", path:"./Dependencies/Facebook/MetaAdapter.xcframework"),

        // AppConsent
        .binaryTarget(name: "AATAppConsent", path:"./Dependencies/AppConsentCMP/AppConsent.xcframework"),

        // SourcePoint
        .binaryTarget(name: "AATConsentViewController", path: "./Dependencies/SourcePoint/ConsentViewController.xcframework"),

        // DisplayIO
        .binaryTarget(name: "AATDisplayIO", path:"./Dependencies/DisplayIO/DIOSDK.xcframework"),

        // AATKit Adapters
        .binaryTarget(name: "AATAmazonAdapter", path: "./Dependencies/AATKit/Adapters/AATAmazonAdapter.xcframework"),
        .binaryTarget(name: "AATAppLovinAdapter", path: "./Dependencies/AATKit/Adapters/AATAppLovinAdapter.xcframework"),
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
        .binaryTarget(name: "AATMintegralAdapter", path: "./Dependencies/AATKit/Adapters/AATMintegralAdapter.xcframework"),
        .binaryTarget(name: "AATSourcePointCMPAdapter", path: "./Dependencies/AATKit/Adapters/AATSourcePointCMPAdapter.xcframework"),
        .binaryTarget(name: "AATAppConsentAdapter", path: "./Dependencies/AATKit/Adapters/AATAppConsentAdapter.xcframework"),
        .binaryTarget(name: "AATDisplayIOAdapter", path: "./Dependencies/AATKit/Adapters/AATDisplayIOAdapter.xcframework"),

    ]
)
