#include "Ad.h"

#import <YandexMobileAds/YandexMobileAds-Swift.h>

@class AdImpl;

namespace AdExample
{
    class CppAd : public Ad
    {
    public:

        CppAd();

        void load() override;

    private:

        AdImpl* m_impl;
    };

    std::shared_ptr<Ad> createAd()
    {
        return std::make_shared<CppAd>();
    }
}

using namespace AdExample;

@interface AdImpl : NSObject <YMAInterstitialAdLoaderDelegate>
{
    CppAd* m_ad;
    YMAInterstitialAdLoader* m_loader;
}
- (void)loadAd; 
@end

@implementation AdImpl 

- (id)initFromCpp:(CppAd *)ad
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

   YMAAdRequestConfiguration* configuration = [[YMAAdRequestConfiguration alloc]initWithAdUnitID:@"demo-interstitial-yandex"];
   
   [m_loader loadAdWithRequestConfiguration:configuration];
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

CppAd::CppAd()
{
    [YMAMobileAds enableLogging];

    m_impl = [[AdImpl alloc]initFromCpp:this];
}

void CppAd::load()
{
    [m_impl loadAd];
}
