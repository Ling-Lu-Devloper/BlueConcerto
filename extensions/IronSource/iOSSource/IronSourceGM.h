
#import "IronSource/IronSource.h"

//#import <IronSource/ISConfigurations.h>
#import <AdSupport/AdSupport.h>

@interface listener_interstitial : NSObject<LevelPlayInterstitialDelegate>
@end

@interface listener_reward :NSObject<LevelPlayRewardedVideoManualDelegate>
@end

@interface IronSourceGM:NSObject <LevelPlayBannerDelegate,ISImpressionDataDelegate>
{
    double bottom;
}



@property (nonatomic, strong) ISBannerView *bannerView;
@property (nonatomic, strong) NSString *IS_AppKey;
@property (nonatomic, strong) listener_interstitial *m_listener_interstitial;
@property (nonatomic, strong) listener_reward *m_llistener_reward;
@end


