#include "Ad.h"

#import <YandexMobileAds/YandexMobileAds-Swift.h>

using namespace AdExample;

@interface AdImpl : NSObject <YMAInterstitialAdLoaderDelegate>
{
    Ad* m_ad;
    YMAInterstitialAdLoader* m_loader;
}
- (void)loadAd; 
@end

@implementation AdImpl 

- (id)initFromCpp:(Ad *)ad
{
    if (self = [super init])
    {
        m_loader = [[YMAInterstitialAdLoader alloc]init];
        m_loader.delegate = self;
        m_ad = ad;
    }
    return self;
}

- (void)loadAd
{ 
   NSLog(@"YMAInterstitialAdLoader::loadAd"); 

   YMAAdRequestConfiguration* configuration = [[YMAAdRequestConfiguration alloc]initWithAdUnitID:@"R-M-XXXXX-YY"];
   
   [m_loader loadAd:configuration];
} 

- (void)interstitialAdLoader:(YMAInterstitialAdLoader * _Nonnull)adLoader didLoad:(YMAInterstitialAd * _Nonnull)interstitialAd
{
   NSLog(@"YMAInterstitialAdLoader::didLoad"); 
}


- (void)interstitialAdLoader:(YMAInterstitialAdLoader * _Nonnull)adLoader didFailToLoadWithError:(YMAAdRequestError * _Nonnull)error
{
   NSLog(@"YMAInterstitialAdLoader::didFailToLoadWithError"); 
}

@end

Ad::Ad()
{
    m_impl = [[AdImpl alloc]initFromCpp:this];
}
