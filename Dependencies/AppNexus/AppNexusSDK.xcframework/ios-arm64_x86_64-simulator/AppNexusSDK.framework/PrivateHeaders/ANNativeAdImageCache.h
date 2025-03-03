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

#import <Foundation/Foundation.h>
#import "ANAdConstants.h"

#if !APPNEXUS_NATIVE_MACOS_SDK
#import <UIKit/UIKit.h>
#else
#import <AppKit/AppKit.h>
#endif
#import "XandrImage.h"

@interface ANNativeAdImageCache : NSObject

+ (NSCache *)sharedImageCache;
+ (XandrImage *)imageForKey:(NSURL *)key;
+ (void)setImage:(XandrImage *)image forKey:(NSURL *)key;
+ (void)removeAllImages;

@end
