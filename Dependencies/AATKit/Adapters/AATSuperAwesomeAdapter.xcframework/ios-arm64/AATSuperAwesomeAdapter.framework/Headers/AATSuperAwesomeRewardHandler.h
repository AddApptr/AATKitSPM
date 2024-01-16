//
//  AATSuperAwesomeRewardHandler.h
//  AATSuperAwesomeAdapter
//
//  Created by Mahmoud Amer on 05.01.24.
//  Copyright © 2024 AddApptr GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AATSuperAwesomeAdapter/AATSuperAwesomeProtocols.h>

NS_ASSUME_NONNULL_BEGIN

@interface AATSuperAwesomeRewardHandler : NSObject <AATSuperAwesomeRewardedProtocol>
@property (weak) NSObject<AATSuperAwesomeRewardedDelegate>* delegate;

- (void)load:(NSNumber *)placementId viewController:(UIViewController *)controller;
- (void)enableParentalGate:(BOOL)enabled;
- (void)enableBumperPage:(BOOL)enabled;
- (void)setBumperPageCustomAppName:(NSString *)name;
- (void)setBumperPageLogo:(UIImage *)logo;
- (void)enableCloseButton;
- (void)enableCloseButtonNoDelay;
- (void)setOrientation:(int)orientation;
- (void)setSmallClick:(BOOL)enabled;
- (void)closeButtonAtEnd:(BOOL)enabled;
- (void)closeButtonWarningEnabled:(BOOL)enabled;
- (void)mute:(BOOL)enabled;

@end

NS_ASSUME_NONNULL_END
