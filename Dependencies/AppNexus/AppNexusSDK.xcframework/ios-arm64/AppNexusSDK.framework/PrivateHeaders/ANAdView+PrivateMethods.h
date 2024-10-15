/*   Copyright 2014 APPNEXUS INC
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

#import "ANAdView.h"
#import "ANAdViewInternalDelegate.h"
#import "ANAdFetcher.h"
#import "PlacementTelemetryObject.h"
#import "TelemetryEventTracker.h"
#import "TelemetryUtiles.h"

@interface ANAdView (PrivateMethods) <ANAdViewInternalDelegate, ANMultiAdProtocol>

@property (nonatomic, readwrite, strong, nonnull)  ANAdFetcher  *adFetcher;

@property (nonatomic, readwrite)  BOOL  allowSmallerSizes;

/**
 List of views added as Friendly Obstructions
 */
@property (nonatomic, readonly, strong, nullable) NSMutableArray<UIView *> *obstructionViews;

/**
 * This property holds a reference to a PlacementTelemetryObject instance.
 *
 * @property placementTelemetryObject
 */
@property (nonatomic, readwrite, strong, nullable) PlacementTelemetryObject *placementTelemetryObject;

/**
 * This property is designated for storing information regarding the ad server's response, particularly focusing on fill data.
 *
 * @property telemetryAdServerResponseFillData
 */
@property (nonatomic, readwrite, strong, nullable) NSDictionary *telemetryAdServerResponseFillData;


-(void) sendConfigurationWithMARAdServerRequest:(NSString *)batchId;

/**
 * Records a telemetry event with the specified event type and data.
 *
 * This method is used to log or record a telemetry event, identified by a specified event type,
 * and optionally accompanied by additional data.
 *
 * @param event A nonnull NSString representing the type of the telemetry event to be recorded.
 *              This string should correspond to a predefined set of event types TelemetryEventsConstant.
 * @param data  A nullable NSDictionary containing additional data associated with the event.
 *
 */
-(void) recordTelemetryEvent:(nonnull NSString *)event andData:(nullable NSDictionary *)data;

//
- (void)initialize;
- (BOOL)errorCheckConfiguration;

- (void)loadAd;
- (void)loadAdFromHtml:(nonnull NSString *)html
                 width:(int)width
                height:(int)height;

- (void)loadAdFromVast: (nonnull NSString *)xml width: (int)width
                height: (int)height;

- (void)setAdResponseInfo:(nonnull ANAdResponseInfo *)adResponseInfo;

/**
 *  isInterstitialAd property to indicate whether the current ad is an interstitial ad.
 */
@property (nonatomic, readwrite)  BOOL  isInterstitialAd;

/**
 * Updates the telemetry data related to ad server responses from different place.
 */
- (void) updateTelemetryAdServerResponseData:(nonnull NSDictionary *)data;

@end
