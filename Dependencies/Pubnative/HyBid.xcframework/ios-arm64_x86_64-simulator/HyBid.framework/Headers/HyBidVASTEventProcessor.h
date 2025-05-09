//
//  Copyright © 2021 PubNative. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>
#import "HyBidVASTAdTrackingEventType.h"
#import "HyBidVASTTracking.h"
#import "HyBidVASTImpression.h"

typedef NS_ENUM(NSInteger, HyBidVASTUrlType) {
    HyBidVASTImpressionURL,
    HyBidVASTClickTrackingURL,
    HyBidVASTParserErrorURL,
    HyBidVASTErrorURL,
};

@protocol HyBidVASTEventProcessorDelegate <NSObject>

- (void)eventProcessorDidTrackEventType:(HyBidVASTAdTrackingEventType)event;

@end

@interface HyBidVASTEventProcessor : NSObject

- (id)initWithEventsDictionary:(NSDictionary<NSString *, NSMutableArray<NSString *> *> *)eventDictionary progressEventsDictionary:(NSDictionary<NSString *, NSString *> *)progressEventDictionary delegate:(id<HyBidVASTEventProcessorDelegate>)delegate;


- (id)initWithEvents:(NSArray<HyBidVASTTracking *> *)events delegate:(id<HyBidVASTEventProcessorDelegate>)delegate;

// sends the given VASTEvent
- (void)trackEventWithType:(HyBidVASTAdTrackingEventType)type;
- (void)trackProgressEvent:(NSString*)offset;
- (void)trackImpression:(HyBidVASTImpression*)impression;
- (void)trackImpressionWith:(NSString*)impressionURL;

- (void)sendVASTBeaconUrl:(NSString *)url withTrackingType:(NSString *)trackingType;
// sends the set of http requests to supplied URLs, used for Impressions, ClickTracking, and Errors.
- (void)sendVASTUrls:(NSArray *)urls withType:(HyBidVASTUrlType)type;

- (void)setCustomEvents:(NSArray<HyBidVASTTracking *> *)events;

@end
