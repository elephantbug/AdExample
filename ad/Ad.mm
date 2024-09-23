#include "Ad.h"

#import <YandexMobileAds/YandexMobileAds-Swift.h>

using namespace AdExample;

// AbstractClass.h 
@interface AdImpl <YMAInterstitialAdLoaderDelegate>
- (void)method1; 
- (void)method2; 
@end
// AbstractClass.m 
@implementation AdImpl 
- (void)method1 { 
   NSLog(@"Method 1"); 
   YMAInterstitialAdLoader *loader = [[YMAInterstitialAdLoader alloc]init];
   loader.delegate = self;
} 
- (void)method2 { 
   NSLog(@"Method 2"); 
} 

- (void)interstitialAdLoader:(YMAInterstitialAdLoader * _Nonnull)adLoader didLoad:(YMAInterstitialAd * _Nonnull)interstitialAd {
}


- (void)interstitialAdLoader:(YMAInterstitialAdLoader * _Nonnull)adLoader didFailToLoadWithError:(YMAAdRequestError * _Nonnull)error {

}
@end

Ad::Ad()
{
    m_impl = [[AdImpl alloc]init];
}
