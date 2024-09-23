#include "Ad.h"

#import <YandexMobileAds/YandexMobileAds-Swift.h>

// AbstractClass.h 
@interface AbstractClass : NSObject
- (void)method1; 
- (void)method2; 
@end
// AbstractClass.m 
@implementation AbstractClass 
- (void)method1 { 
   NSLog(@"Method 1"); 
   YMAInterstitialAdLoader *loader = [[YMAInterstitialAdLoader alloc]init];
} 
- (void)method2 { 
   NSLog(@"Method 2"); 
} 
@end