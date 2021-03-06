//
//  SCSTrackingEventFactory.h
//  SCSCoreKit
//
//  Created by Loïc GIRON DIT METAZ on 17/05/2017.
//  Copyright © 2017 Smart AdServer. All rights reserved.
//

#import <Foundation/Foundation.h>
#if TARGET_OS_IOS || (TARGET_OS_IPHONE && !TARGET_OS_TV)
#import <SCSCoreKit/SCSTrackingEvent.h>
#elif TARGET_OS_TV
#import <SCSCoreKitTV/SCSTrackingEvent.h>
#endif

NS_ASSUME_NONNULL_BEGIN

/**
 Represents a generic tracking event factory.
 
 A tracking event factory object class will be used to construct arrays of tracking events
 that will be used by an instance of SCSTrackingEventManager.
 */
@protocol SCSTrackingEventFactory <NSObject>

/**
 Returns all the tracking events generated by the factory.
 
 @return An array of tracking events.
 */
- (NSArray<id <SCSTrackingEvent>> *)trackingEvents;

@end

NS_ASSUME_NONNULL_END
