//
//  AATSuperAwesomeBannerHandler.h
//  AATSuperAwesomeAdapter
//
//  Created by Mahmoud Amer on 05.01.24.
//  Copyright © 2024 AddApptr GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AATSuperAwesomeAdapter/AATSuperAwesomeProtocols.h>

NS_ASSUME_NONNULL_BEGIN

@interface AATSuperAwesomeBannerHandler : NSObject <AATSuperAwesomeBannerProtocol>
@property (weak) NSObject<AATSuperAwesomeBannerDelegate>* delegate;

- (void)load:(NSNumber *)placementId viewController:(UIViewController *)controller bannerSize:(CGSize)bannerSize;

- (void)enableParentalGate:(BOOL)enabled;
- (void)enableBumperPage:(BOOL)enabled;
- (void)setBumperPageCustomAppName:(NSString *)name;
- (void)setBumperPageLogo:(UIImage *)logo;
- (void)isBackgroundTransparent:(BOOL)transparent;

@end

NS_ASSUME_NONNULL_END
