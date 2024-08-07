//
//  SMARemoteConfigParser.h
//  SmaatoSDKCore
//
//  Created by ashu on 11/07/22.
//  Copyright © 2022 Smaato Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

#if !__has_feature(objc_arc)
#define JSONAutoRelease(param) ([param autorelease]);
#else
#define JSONAutoRelease(param) (param)
#endif

@interface SMARemoteConfigUrl: NSObject
@property (nonatomic, copy) NSString *somaURL;
@property (nonatomic, copy) NSString *somaDntURL;
@property (nonatomic, copy) NSString *adviolationURL;
@property (nonatomic, copy) NSString *somaUBURL;
@property (nonatomic, copy) NSString *configurationURL;
@property (nonatomic, copy) NSString *configLogURL;
@property (nonatomic, copy) NSString *eventLogURL;

@end

@interface SMARemoteConfigAttributes: NSObject
@property (nonatomic, strong) NSNumber *sessionIDFrequency;
@property (nonatomic, strong) NSNumber *loactionValidforPeriod;
@property (nonatomic, strong) NSNumber *vastAdVisibilityRatio;
@property (nonatomic, strong) NSNumber *vastAdVisibilityTimems;
@property (nonatomic, strong) NSNumber *noRetriesAfterntrErrinUB;
@end

@interface SMARemoteConfigVideoAttributes: NSObject
@property (nonatomic, strong) NSNumber *width;
@property (nonatomic, strong) NSNumber *bitrate;
@end

@interface SMARemoteConfigVideoQuality: NSObject
@property (nonatomic, retain) NSDictionary *low;
@property (nonatomic, retain) NSDictionary *medium;
@property (nonatomic, retain) NSDictionary *high;
@end

@interface SMASupportedFeature: NSObject
@property (nonatomic, retain) NSString *featureName;
@property (nonatomic) BOOL featureIsEnabled;
@property (nonatomic, retain) NSString *minSupportedSDKVersion;
@end

@interface SMAButtonSize: NSObject
@property (nonatomic) NSInteger small;
@property (nonatomic) NSInteger mid;
@end

@interface SMAVideoSkip: NSObject
@property (nonatomic) NSInteger mid;
@property (nonatomic) NSInteger large;
@end

@interface SMADisplayClose: NSObject
@property (nonatomic) NSInteger mid;
@property (nonatomic) NSInteger large;
@end

@interface SMAButtonDelay: NSObject
@property (nonatomic, retain) SMAVideoSkip *videoSkip;
@property (nonatomic, retain) SMADisplayClose *displayClose;
@end

@interface SMARemoteConfigParser: NSObject
@property (nonatomic, retain) SMARemoteConfigUrl *urls;
@property (nonatomic, retain) SMARemoteConfigAttributes *properties;
@property (nonatomic, retain) SMARemoteConfigVideoQuality *videoQuality;
@property (nonatomic, retain) SMAButtonSize *buttonSize;
@property (nonatomic, retain) SMAButtonDelay *buttonDelay;
@property (nonatomic) NSMutableArray<SMASupportedFeature *> *supportedFeatures;

@end
