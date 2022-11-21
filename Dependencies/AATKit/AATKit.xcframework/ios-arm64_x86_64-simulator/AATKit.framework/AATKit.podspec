#
#  Be sure to run `pod spec lint AATKit.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

    spec.name         = "AATKit"
    spec.version      = "3.0.15"
    spec.summary      = 'Mobile Ad Mediation Framework'
    spec.xcconfig =
    {
        'VALID_ARCHS' => 'arm64 armv7 x86_64',
        'VALID_ARCHS[sdk=iphoneos*]' => 'arm64 armv7',
        'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64 arm64',
    }

    spec.description  = <<-DESC
    Integrate many different advertising networks by adding this mediation framework only once.
    DESC

    spec.homepage     = 'https://bitbucket.org/addapptr/aatkit-ios/wiki/Home'

    spec.license      = {
        :type => 'Copyright',
        # U+2013: EN DASH
        :text => 'Copyright 2012\u20132020 AddApptr GmbH.'
    }

    spec.author             = { 'Addapptr GmbH' => 'support@addapptr.com' }
    spec.social_media_url   = "http://twitter.com/addapptr_gmbh"

    spec.platform     = :ios, '10.0'
    spec.swift_version = '5.0'
    
     spec.source       = {
       :http   => "https://ios-sdk.aatkit.com/aatkit-#{spec.version.to_s}.zip",
       :sha256 => 'c4f0d6a91fe540ab151d214f8e412b0fdc3ff1bf18652155f96a68d736144279'
     }

    
    #    spec.static_framework = true

    spec.default_subspecs = 'Default'

    spec.subspec 'Default' do |spec|
        spec.dependency 'AATKit/AdColony'
        spec.dependency 'AATKit/Admob'
        spec.dependency 'AATKit/AdX'
        spec.dependency 'AATKit/CriteoSDK'
        spec.dependency 'AATKit/DFP'
        spec.dependency 'AATKit/Facebook'
        spec.dependency 'AATKit/FeedAd'
        spec.dependency 'AATKit/Inmobi'
        spec.dependency 'AATKit/OguryAds'
        spec.dependency 'AATKit/PubNative'
        spec.dependency 'AATKit/Prebid'
        spec.dependency 'AATKit/Smaato'
        spec.dependency 'AATKit/SmartAdServer'
        spec.dependency 'AATKit/Unity'
        spec.dependency 'AATKit/AppLovin'
        spec.dependency 'AATKit/AppLovinMax'
        spec.dependency 'AATKit/AppNexus'
        spec.dependency 'AATKit/Vungle'
        spec.dependency 'AATKit/YOC'
    end # subspec Default

    spec.subspec 'Core' do |spec|
        #   spec.user_target_xcconfig = {
        #     'OTHER_LDFLAGS': '-ObjC',
        #   }

        spec.vendored_frameworks = [
        'AATKit/AATKit.xcframework'
        ]
    end # subspec Core

    # Google
    spec.subspec 'Admob' do |spec|
        spec.dependency 'AATKit/GoogleMobileAds'
    end # subspec Admob

    spec.subspec 'AdX' do |spec|
        spec.dependency 'AATKit/GoogleMobileAds'
    end # subspec AdX

    spec.subspec 'DFP' do |spec|
        spec.dependency 'AATKit/GoogleMobileAds'
    end # subspec DFP

    spec.subspec 'GoogleMobileAds' do |spec|
        spec.dependency 'AATKit/Core'
        spec.vendored_frameworks = [
        'AATKit/AATGoogleAdsAdapter.xcframework'
        ]
        spec.dependency 'Google-Mobile-Ads-SDK', '9.6.0'
    end # subspec GoogleMobileAds

    spec.subspec 'AdColony' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'AdColony', '4.9.0'
        spec.vendored_frameworks = [
        'AATKit/AATAdColonyAdapter.xcframework'
        ]
    end # subspec AdColony

    #require ios 12
    spec.subspec 'AmazonHB' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'AmazonPublisherServicesSDK', '4.5.1'
        spec.vendored_frameworks = [
        'AATKit/AATAmazonAdapter.xcframework'
        ]
    end # subspec AmazonHB

    # AppLovin
    spec.subspec 'AppLovinSDK' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'AppLovinSDK', '11.4.3'
        spec.vendored_frameworks = [
        'AATKit/AATAppLovinAdapter.xcframework'
        ]
    end # subspec ApplovinSDK

    spec.subspec 'AppLovin' do |spec|
        spec.dependency 'AATKit/AppLovinSDK'
    end # subspec Applovin

    spec.subspec 'AppLovinMax' do |spec|
        spec.dependency 'AATKit/AppLovinSDK'
        spec.vendored_frameworks = [
        'AATKit/AATAppLovinMaxAdapter.xcframework'
        ]
    end # subspec ApplovinMAX

    spec.subspec 'AppNexus' do |spec|
        spec.dependency 'AATKit/Core'
        spec.vendored_frameworks = [
        'AATKit/AATAppNexusAdapter.xcframework',
        'AATKit/subSDKs/AppNexusSDK_*/AppNexusSDK.xcframework',
        'AATKit/subSDKs/AppNexusSDK_*/OMSDK_Appnexus.xcframework'
        ]
    end # subspec AppNexus

    spec.subspec 'CriteoSDK' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'CriteoPublisherSdk', '4.5.0'
        spec.vendored_frameworks = [
        'AATKit/AATCriteoAdapter.xcframework'
        ]
    end # subspec CriteoSDK

    spec.subspec 'GoogleCMP' do |spec|
        spec.dependency 'AATKit/Core'
        spec.vendored_frameworks = [
        'AATKit/AATGoogleCMPAdapter.xcframework'
        ]
        spec.dependency 'GoogleUserMessagingPlatform', '2.0.0'
    end # subspec GoogleCMP

    spec.subspec 'Facebook' do |spec|
        spec.dependency 'AATKit/GoogleMobileAds'
        spec.dependency 'GoogleMobileAdsMediationFacebook', '6.11.1.0'
        spec.vendored_frameworks = [
        'AATKit/AATFacebookAdapter.xcframework'
        ]
    end # subspec Facebook

    spec.subspec 'FeedAd' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'FeedAd', '1.4.0'
        spec.vendored_frameworks = [
        'AATKit/AATFeedAdAdapter.xcframework'
        ]
    end # subspec FeedAd

    spec.subspec 'Inmobi' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'InMobiSDK', ' 10.0.7'
        spec.vendored_frameworks = [
        'AATKit/AATInMobiAdapter.xcframework'
        ]
    end # subspec Inmobi

    # OguryAds
    spec.subspec 'OguryAds' do |s|
        s.dependency 'AATKit/Core'
        s.dependency 'AATKit/OguryCMP'
        s.vendored_frameworks = [
        'AATKit/AATOguryAdapter.xcframework'
        ]
    end # subspec OguryAds

    # OguryCMP
    spec.subspec 'OguryCMP' do |s|
        s.dependency 'AATKit/Core'
        s.dependency 'OgurySdk', '2.1.0'
        s.vendored_frameworks = [
        'AATKit/AATOguryCMPAdapter.xcframework'
        ]
    end # subspec OguryAds

    spec.subspec 'PubNative' do |spec|
        spec.dependency 'AATKit/Core'
        spec.vendored_frameworks = [
        'AATKit/AATPubNativeAdapter.xcframework',
        'AATKit/subSDKs/Pubnative_*/HyBid.xcframework',
        'AATKit/subSDKs/Pubnative_*/OMSDK_Pubnativenet.xcframework'
        ]
    end # subspec PubNative

    spec.subspec 'Smaato' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'smaato-ios-sdk', '21.7.6'
        spec.vendored_frameworks = [
        'AATKit/AATSmaatoAdapter.xcframework'
        ]
    end # subspec Smaato

    spec.subspec 'SmartAdServer' do |spec|
        spec.dependency 'AATKit/Core'
        spec.vendored_frameworks = [
        'AATKit/AATSmartAdAdapter.xcframework'
        ]
        spec.dependency 'Smart-Display-SDK', '7.18.0'
    end # subspec SmartAdServer

    spec.subspec 'Unity' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'UnityAds', '4.2.1'
        spec.vendored_frameworks = [
        'AATKit/AATUnityAdapter.xcframework'
        ]
    end # subspec Unity

    # Teads (Optional)
    spec.subspec 'Teads' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'TeadsSDK', '5.0.17'
        spec.vendored_frameworks = [
        'AATKit/AATTeadsAdapter.xcframework'
        ]
    end # subspec TeadsSDK

    # require ios 12.1
    spec.subspec 'YOC' do |spec|
        spec.dependency 'AATKit/Core'
#        spec.dependency 'VisxSDK' ,'2.3.0'
        spec.vendored_frameworks = [
        'AATKit/AATYOCAdapter.xcframework',
        'AATKit/subSDKs/YOC_*/VisxSDK.xcframework',
        ]
    end # subspec YOC

    spec.subspec 'Vungle' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'VungleSDK-iOS', '6.11.0'
        spec.vendored_frameworks = [
        'AATKit/AATVungleAdapter.xcframework'
        ]
    end # subspec Vungle
    
    spec.subspec 'Prebid' do |spec|
        spec.dependency 'AATKit/Core'
#        spec.dependency 'PrebidMobile', '1.12.1'
        spec.dependency 'AATKit/GoogleMobileAds'
        spec.vendored_frameworks = [
        'AATKit/AATDFPPrebidAdapter.xcframework',
        'AATKit/subSDKs/Prebid_*/PrebidMobile.xcframework',
        'AATKit/subSDKs/Prebid_*/OMSDK_Prebidorg.framework'
        ]
    end # subspec Prebid

    # AATAdMobMediationAdapter (Optional)
    spec.subspec 'AATAdMobMediationAdapter' do |spec|
        spec.dependency 'AATKit/GoogleMobileAds'
        spec.vendored_frameworks = [
        'AATKit/AATAdMobMediationAdapter.xcframework'
        ]
    end # subspec AATAdMobMediationAdapter
    
    #requires ios 12.2
    spec.subspec 'BlueStack' do |spec|
        spec.dependency 'AATKit/Core'
        spec.dependency 'Bluestack-SDK-Core', '4.1.0'
        spec.vendored_frameworks = [
        'AATKit/AATBluestackAdapter.xcframework'
        ]
    end # subspec BlueStack
end
