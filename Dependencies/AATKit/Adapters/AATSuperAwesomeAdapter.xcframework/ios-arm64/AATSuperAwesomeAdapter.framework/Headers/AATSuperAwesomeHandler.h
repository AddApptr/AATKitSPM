//
//  AATSuperAwesomeHandler.h
//  AATSuperAwesomeAdapter
//
//  Created by Mahmoud Amer on 05.01.24.
//  Copyright © 2024 AddApptr GmbH. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AATSuperAwesomeAdapter/AATSuperAwesomeProtocols.h>

NS_ASSUME_NONNULL_BEGIN

@interface AATSuperAwesomeHandler : NSObject

+ (instancetype)sharedInstance;
- (void)initSuperAwesome:(BOOL)debugEnabled;
- (nullable NSString *)getVersion;

@end

NS_ASSUME_NONNULL_END
