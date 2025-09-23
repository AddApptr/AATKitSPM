//
//  MediatedAdType.h
//  DIOSDK
//
//  Created by Roman Do on 27.05.2025.
//  Copyright © 2025 Display.io. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, DIOMediatedAdType) {
    MediatedAdTypeUnknown = 0,
    MediatedAdTypeBanner = 1,
    MediatedAdTypeVideo = 2,
    MediatedAdTypeAudio = 3,
    MediatedAdTypeNative = 4
};

@interface MediatedAdTypeHelper : NSObject

+ (DIOMediatedAdType)fromValue:(NSInteger)value;
+ (BOOL)isSupportedType:(DIOMediatedAdType)type;

@end

