//
// Copyright 2020 - present FeedAd GmbH. All rights reserved.
//
// By using the FeedAd SDK, you agree to our Terms of Service:
// https://feedad.com/tos
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

/// Configuration for FAFeedAd
@interface FAFeedAdConfig : NSObject

/// URL of content for the current screen (optional)
///
/// iOS Universal Link for the screen where the ad will be displayed.
@property (nonatomic, strong, nullable) NSURL *contentURL;

/// Custom tracking parameters (optional)
///
/// Specify custom parameters to pass additional tracking data about
/// the context of your placement. For example, this could be the
/// category of a certain item an user viewed in your app.
@property (nonatomic, strong, nullable) NSDictionary<NSString *, NSString *> *customParameters;

/// The ID of the placement (required)
///
/// Valid placement IDs are words of lowercase letters from a to z
/// and numbers from 0 to 9. The words can be separated by hyphens
/// or underscores. Multiple separators must not follow each other.
@property (nonatomic, copy, nullable) NSString *placementId;

/// URL to page of the publisher's website equivalent for the current screen (optional)
///
/// Can be an iOS Universal Link or a regular website URL to the equivalent page
/// on the publisher's website for the screen where the ad will be displayed.
@property (nonatomic, strong, nullable) NSURL *webContentURL;

@end

NS_ASSUME_NONNULL_END
