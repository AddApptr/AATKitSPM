//
//  AATSuperAwesomeFullscreenHandler.h
//  AATSuperAwesomeAdapter
//
//  Created by Mahmoud Amer on 05.01.24.
//  Copyright © 2024 AddApptr GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AATSuperAwesomeAdapter/AATSuperAwesomeProtocols.h>

NS_ASSUME_NONNULL_BEGIN

@interface AATSuperAwesomeFullscreenHandler : NSObject <AATSuperAwesomeFullscreenProtocol>
@property (weak) NSObject<AATSuperAwesomeFullscreenDelegate>* delegate;

- (void)load:(NSNumber *)placementId
viewController:(UIViewController *)controller
      userId: (NSString * _Nullable) userId
    keywords: (NSDictionary<NSString *,id> * _Nullable) keywords;
- (void)enableParentalGate:(BOOL)enabled;
- (void)enableBumperPage:(BOOL)enabled;
- (void)setBumperPageCustomAppName:(NSString *)name;
- (void)setBumperPageLogo:(UIImage *)logo;
- (void)enableCloseButton;
- (void)enableCloseButtonNoDelay;
- (void)setOrientation:(int)orientation;

@end

NS_ASSUME_NONNULL_END
