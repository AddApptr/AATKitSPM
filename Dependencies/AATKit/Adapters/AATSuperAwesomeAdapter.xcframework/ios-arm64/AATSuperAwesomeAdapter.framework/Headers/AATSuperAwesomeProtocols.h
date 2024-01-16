//
//  AATSuperAwesomeProtocols.h
//  AATKit
//
//  Created by Mahmoud Amer on 05.01.24.
//  Copyright © 2024 AddApptr GmbH. All rights reserved.
//
#import <UIKit/UIKit.h>

#ifndef AATSuperAwesomeProtocols_h
#define AATSuperAwesomeProtocols_h

#pragma mark - Banner

@protocol AATSuperAwesomeBannerDelegate <NSObject>
- (void)bannerViewDidReceiveAd:(NSObject *)bannerView;
- (void)bannerViewDidFailToReceiveAd:(NSObject *)bannerView errorMessage:(NSString *)errorMessage;
- (void)bannerViewDidRecordClick:(NSObject *)bannerView;
- (void)bannerViewDidPauseForAd:(NSObject *)bannerView;
- (void)bannerViewDidResumeAfterAd:(NSObject *)bannerView;
@end

@protocol AATSuperAwesomeBannerProtocol <NSObject>
@property NSString *adID;
@property CGSize *adSize;
@property UIViewController *viewController;
@property (weak) NSObject<AATSuperAwesomeBannerDelegate>* delegate;

- (void)unload;
- (void)pause;
- (void)resume:(UIViewController *)viewController;
- (UIView *)getBannerView;
@end

#pragma mark - Fullscreen
@protocol AATSuperAwesomeFullscreenDelegate <NSObject>
- (void)fullscreenAdDidReceiveAd;
- (void)fullscreenAdDidFailToReceiveAdWithError:(NSString *)errorMessage;
- (void)fullscreenAdEmpty;
- (void)fullscreenAdDidRecordClick;
- (void)fullscreenAdDidPauseForAd;
- (void)fullscreenAdDidResumeAfterAd;
- (void)fullscreenDidShow;
- (void)resetCanLoadStatus;
@end

@protocol AATSuperAwesomeFullscreenProtocol <NSObject>
@property NSString *adID;
@property UIViewController *viewController;
@property (weak) NSObject<AATSuperAwesomeFullscreenDelegate>* delegate;

- (void)unload;
- (void)pause;
- (void)resume:(UIViewController *)viewController;
- (BOOL)showInternal;
@end

#pragma mark - Rewarded

@protocol AATSuperAwesomeRewardedDelegate <NSObject>
- (void)RewardedAdDidReceiveAd;
- (void)RewardedAdDidFailToReceiveAdWithError:(NSString *)errorMessage;
- (void)RewardedAdEmpty;
- (void)RewardedAdDidRecordClick;
- (void)RewardedAdDidPauseForAd;
- (void)RewardedAdDidResumeAfterAd;
- (void)RewardedAdDidEnd;
- (void)RewardedDidShow;
- (void)resetCanLoadStatus;
@end

@protocol AATSuperAwesomeRewardedProtocol <NSObject>
@property NSString *adID;
@property UIViewController *viewController;
@property (weak) NSObject<AATSuperAwesomeRewardedDelegate>* delegate;

- (void)unload;
- (void)pause;
- (void)resume:(UIViewController *)viewController;
- (BOOL)showInternal;
@end

#endif /* AATSuperAwesomeProtocols_h */
