package ${YYAndroidPackageName};

import ${YYAndroidPackageName}.R;
import com.yoyogames.runner.RunnerJNILib;
import ${YYAndroidPackageName}.RunnerActivity;

import android.app.Activity;
import android.os.Bundle;
import android.util.Log;
import android.content.Intent;
import android.content.res.Configuration;
import android.app.Dialog;

import android.widget.RelativeLayout;
import android.view.ViewGroup.LayoutParams;
import android.view.ViewParent;
import android.view.Gravity;
import androidx.annotation.NonNull;
import android.widget.FrameLayout;

import android.view.View;
import android.view.ViewGroup;

import com.ironsource.adapters.supersonicads.SupersonicConfig;
import com.ironsource.mediationsdk.ISBannerSize;
import com.ironsource.mediationsdk.IronSource;
import com.ironsource.mediationsdk.IronSourceBannerLayout;
import com.ironsource.mediationsdk.integration.IntegrationHelper;
import com.ironsource.mediationsdk.logger.IronSourceError;
import com.ironsource.mediationsdk.model.Placement;
import com.ironsource.mediationsdk.sdk.InitializationListener;
import com.ironsource.mediationsdk.sdk.LevelPlayBannerListener;
import com.ironsource.mediationsdk.sdk.LevelPlayInterstitialListener;
// import com.ironsource.mediationsdk.sdk.OfferwallListener;
import com.ironsource.mediationsdk.sdk.LevelPlayRewardedVideoListener;
import com.ironsource.mediationsdk.sdk.LevelPlayRewardedVideoManualListener;
import com.ironsource.mediationsdk.utils.IronSourceUtils;

import com.ironsource.mediationsdk.impressionData.ImpressionData;
import com.ironsource.mediationsdk.impressionData.ImpressionDataListener;

// import com.ironsource.mediationsdk.AdInfo;
// import com.ironsource.mediationsdk.sdk.AdInfo;
// import com.ironsource.mediationsdk.IronSource.AdInfo;
// import com.ironsource.mediationsdk.utils.AdInfo;
// import com.ironsource.AdInfo;
// import com.ironsource.mediationsdk.utils.IronSourceUtils.AdInfo;
import com.ironsource.mediationsdk.adunit.adapter.utility.AdInfo;

import com.ironsource.mediationsdk.demandOnly.ISDemandOnlyBannerLayout;
import com.ironsource.mediationsdk.demandOnly.ISDemandOnlyBannerListener;
import com.ironsource.mediationsdk.demandOnly.ISDemandOnlyInterstitialListener;
import com.ironsource.mediationsdk.demandOnly.ISDemandOnlyRewardedVideoListener;

import android.os.Process;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ThreadFactory;

public class IronSourceGM extends RunnerSocial implements /*OfferwallListener,*/ ImpressionDataListener
{
	IronSourceGM me = this;

	int NUMBER_OF_CORES = Runtime.getRuntime().availableProcessors();
	int KEEP_ALIVE_TIME = 250;
	TimeUnit KEEP_ALIVE_TIME_UNIT = TimeUnit.MILLISECONDS;
	BlockingQueue<Runnable> taskQueue = new LinkedBlockingQueue<Runnable>();
	ExecutorService executorService = new ThreadPoolExecutor(NUMBER_OF_CORES, NUMBER_OF_CORES * 2, KEEP_ALIVE_TIME,
			KEEP_ALIVE_TIME_UNIT, taskQueue, new BackgroundThreadFactory());

	private static class BackgroundThreadFactory implements ThreadFactory {
		private static int sTag = 1;

		@Override
		public Thread newThread(Runnable runnable) {
			Thread thread = new Thread(runnable);
			thread.setName("IronSourceInitThread" + sTag);
			thread.setPriority(Process.THREAD_PRIORITY_BACKGROUND);

			// A exception handler is created to log the exception from threads
			thread.setUncaughtExceptionHandler(new Thread.UncaughtExceptionHandler() {
				@Override
				public void uncaughtException(Thread thread, Throwable ex) {
					Log.e("yoyo", thread.getName() + " encountered an error: " + ex.getMessage());
				}
			});
			return thread;
		}
	}

	public static Activity activity = RunnerActivity.CurrentActivity;
	private static final int EVENT_OTHER_SOCIAL = 70;

	public void onPause() {
		super.onPause();
		IronSource.onPause(activity);
	}

	public void onResume() {
		super.onResume();
		IronSource.onResume(activity);
	}

	private String IS_appKey = "";
	public void ironsource_init() 
	{
		Log.i("yoyo","ironsource_init");
		IS_appKey = RunnerJNILib.extOptGetString("IronSource", "AppKey_Android");
		// Log.i("yoyo",IS_appKey);
		
			// IronSource.init(activity, IS_appKey,new InitializationListener()
			// { 
				// @Override public void onInitializationComplete() 
				// {
					// int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
					// RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_init");
					// RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				// } 
			// });
	}

	public void ironsource_set_user(String userId)
	{
		IronSource.setUserId(userId);
	}

	public void ironsource_banner_init() {
		IronSource.init(activity, IS_appKey, IronSource.AD_UNIT.BANNER);
	}

	public void ironsource_interstitial_init() 
	{
		IronSource.setLevelPlayInterstitialListener(new LevelPlayInterstitialListener() {
		   @Override
		   public void onAdReady(AdInfo adInfo)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_interstitial_ready");
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

		   @Override
		   public void onAdLoadFailed(IronSourceError error)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_interstitial_load_failed");
				RunnerJNILib.DsMapAddString(dsMapIndex, "error", error.toString());
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

		   @Override
		   public void onAdOpened(AdInfo adInfo)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_interstitial_opened");
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

		   @Override
		   public void onAdClosed(AdInfo adInfo)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_interstitial_closed");
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

			@Override
			public void onAdShowSucceeded(AdInfo adInfo)
			{
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex,"type","ironsource_interstitial_show_succeeded");
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
			}
			 
		   @Override
		   public void onAdShowFailed(IronSourceError error, AdInfo adInfo)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_interstitial_show_failed");
				RunnerJNILib.DsMapAddString(dsMapIndex, "error", error.toString());
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

		   @Override
		   public void onAdClicked(AdInfo adInfo)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_interstitial_clicked");
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }
		});
		
		IronSource.init(activity, IS_appKey, IronSource.AD_UNIT.INTERSTITIAL);
	}

	public void ironsource_rewarded_video_init() 
{
		IronSource.setLevelPlayRewardedVideoManualListener(new LevelPlayRewardedVideoManualListener() {

		   @Override
		   public void onAdReady(AdInfo adInfo) 
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_rewarded_video_ready");
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

		   @Override
		   public void onAdLoadFailed(IronSourceError error)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_rewarded_video_load_failed");
				RunnerJNILib.DsMapAddString(dsMapIndex, "error", error.toString());
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

		   @Override
		   public void onAdOpened(AdInfo adInfo)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_rewarded_video_opened");
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

		   @Override
		   public void onAdClosed(AdInfo adInfo)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_rewarded_video_closed");
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

		   @Override
		   public void onAdRewarded(Placement placement, AdInfo adInfo)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_rewarded_video_rewarded");
				RunnerJNILib.DsMapAddString(dsMapIndex, "reward_name", placement.getRewardName());
				RunnerJNILib.DsMapAddDouble(dsMapIndex, "reward_amount", (double)placement.getRewardAmount());
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

		   @Override
		   public void onAdShowFailed(IronSourceError error, AdInfo adInfo)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_rewarded_video_show_failed");
				RunnerJNILib.DsMapAddString(dsMapIndex, "error", error.toString());
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }

		   @Override
		   public void onAdClicked(Placement placement, AdInfo adInfo)
		   {
				int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
				RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_rewarded_video_clicked");
				RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
		   }
		   
		});

		IronSource.init(activity, IS_appKey, IronSource.AD_UNIT.REWARDED_VIDEO);
	}
	

	// public void ironsource_offerwall_init() {
	// 	IronSource.setOfferwallListener(me);
	// 	IronSource.init(activity, IS_appKey, IronSource.AD_UNIT.OFFERWALL);
	// }

	public void ironsource_validate_integration() {
		IntegrationHelper.validateIntegration(RunnerActivity.CurrentActivity);
	}

	/////////////////////////////////////////////////////////////////////////////////////////////////////

	private IronSourceBannerLayout adView = null;
	RelativeLayout layout;

	public void ironsource_banner_create(final String placement_name, final double size, final double bottom) {
		RunnerActivity.ViewHandler.post(new Runnable() {
			public void run() {
				if (adView != null) {
					IronSource.destroyBanner(adView);
					layout.removeView(adView);
					// adView.destroy();
					adView = null;

					final ViewGroup rootView = activity.findViewById(android.R.id.content);
					rootView.removeView(layout);
					// layout.destroy();
					layout = null;
				}

				layout = new RelativeLayout(activity);

				RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT);
				params.addRule(RelativeLayout.CENTER_HORIZONTAL);
				if (bottom > 0.5)
					params.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);
				else
					params.addRule(RelativeLayout.ALIGN_PARENT_TOP);

				adView = IronSource.createBanner(RunnerActivity.CurrentActivity, banner_size(size));

				layout.addView((View) adView, params);

				final ViewGroup rootView = activity.findViewById(android.R.id.content);
				rootView.addView((View) layout);

				adView.setLevelPlayBannerListener(new LevelPlayBannerListener() {

				   @Override
				   public void onAdLoaded(AdInfo adInfo)
				   {
					   	int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
						RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_banner_loaded");
						RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				   }

				   @Override
				   public void onAdLoadFailed(IronSourceError error)
				   {
						int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
						RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_banner_load_failed");
						RunnerJNILib.DsMapAddString(dsMapIndex, "error", error.toString());
						RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				   }

				   @Override
				   public void onAdClicked(AdInfo adInfo)
				   {
						int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
						RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_banner_clicked");
						RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				   }

				   @Override
				   public void onAdScreenPresented(AdInfo adInfo)
				   {
						int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
						RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_banner_presented");
						RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				   }

				   @Override
				   public void onAdScreenDismissed(AdInfo adInfo)
				   {
						int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
						RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_banner_dismissed");
						RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				   }

				   @Override
				   public void onAdLeftApplication(AdInfo adInfo)
				   {
						int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
						RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_banner_left_application");
						RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
				   }
				   
				});
				
				adView.requestLayout();
				adView.setVisibility(View.VISIBLE);

				IronSource.loadBanner(adView, placement_name);
			}
		});
	}

	public ISBannerSize banner_size(double size) {
		// https://developers.ironsrc.com/ironsource-mobile/android/banner-integration-android/#step-1
		switch ((int) size) {
			case 0:
				return ISBannerSize.BANNER;
			case 1:
				return ISBannerSize.LARGE;
			case 2:
				return ISBannerSize.RECTANGLE;
			case 3:
				return ISBannerSize.SMART;
			default:
				return ISBannerSize.SMART;
		}
	}

	public void ironsource_banner_move(final double bottom) {
		if (adView != null) {
			RunnerActivity.ViewHandler.post(new Runnable() {
				public void run() {
					RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(LayoutParams.WRAP_CONTENT,
							LayoutParams.WRAP_CONTENT);
					params.addRule(RelativeLayout.CENTER_HORIZONTAL);
					if (bottom > 0.5)
						params.addRule(RelativeLayout.ALIGN_PARENT_BOTTOM);
					else
						params.addRule(RelativeLayout.ALIGN_PARENT_TOP);

					adView.setLayoutParams(params);
				}
			});
		}
	}

	public void ironsource_banner_show() {
		RunnerActivity.ViewHandler.post(new Runnable() {
			public void run() {
				if (adView != null)
					adView.setVisibility(View.VISIBLE);
			}
		});
	}

	public void ironsource_banner_hide() {
		RunnerActivity.ViewHandler.post(new Runnable() {
			public void run() {
				if (adView != null)
					adView.setVisibility(View.GONE);
			}
		});
	}

	public void ironsource_banner_remove() {
		RunnerActivity.ViewHandler.post(new Runnable() {
			public void run() {
				if (adView != null) {
					IronSource.destroyBanner(adView);

					layout.removeView(adView);
					// adView.destroy();
					adView = null;

					final ViewGroup rootView = activity.findViewById(android.R.id.content);
					rootView.removeView(layout);
					// layout.destroy();
					layout = null;
				}
			}
		});
	}

	public double ironsource_banner_get_width() {
		if (adView == null)
			return 0;

		return adView.getMeasuredWidth();
	}

	public double ironsource_banner_get_height() {
		if (adView == null)
			return 0;

		return adView.getMeasuredHeight();
	}

	//////////////////////////// IronSource Interstitial

public void ironsource_interstitial_load() {
		IronSource.loadInterstitial();
	}

	public double ironsource_interstitial_is_capped(String placement_name) {
		if (IronSource.isInterstitialPlacementCapped(placement_name))
			return 1.0;
		return 0.0;
	}

	public void ironsource_interstitial_show(String placement_name) {
		if (IronSource.isInterstitialReady())
			IronSource.showInterstitial(placement_name);
	}

	public double ironsource_interstitial_is_ready() {
		if (IronSource.isInterstitialReady())
			return 1.0;
		return 0.0;
	}

	///////////////////////////////// RewardedVideo


	public void ironsource_rewarded_video_load() {
			IronSource.loadRewardedVideo();
	}

	public void ironsource_rewarded_video_show(String placement_name) {
		if (IronSource.isRewardedVideoAvailable())
			IronSource.showRewardedVideo(placement_name);
	}

	public double ironsource_rewarded_video_is_ready() {
		if (IronSource.isRewardedVideoAvailable())
			return 1.0;
		return 0.0;
	}

	public double ironsource_rewarded_video_is_capped(String placement_name) {
		if (IronSource.isRewardedVideoPlacementCapped(placement_name))
			return 1.0;
		return 0.0;
	}

	///////////////////////////// Offerwall

	// public void ironsource_offerwall_get_credits() {
	// 	IronSource.getOfferwallCredits();
	// }

	// public void ironsource_offerwall_show(String placement_name) {
	// 	IronSource.showOfferwall(placement_name);
	// }

	// public void ironsource_offerwall_set_client_side_callbacks(double bool_) {
	// 	SupersonicConfig.getConfigObj().setClientSideCallbacks(bool_ >= 0.5);
	// }

	// @Override
	// public void onOfferwallAvailable(boolean isAvailable) {
	// 	int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
	// 	RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_offerwall_availability_changed");
	// 	if (isAvailable)
	// 		RunnerJNILib.DsMapAddDouble(dsMapIndex, "available", 1.0);
	// 	else
	// 		RunnerJNILib.DsMapAddDouble(dsMapIndex, "available", 0.0);
	// 	RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
	// }

	// @Override
	// public void onOfferwallOpened() {
	// 	int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
	// 	RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_offerwall_opened");
	// 	RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
	// }

	// @Override
	// public void onOfferwallShowFailed(IronSourceError error) {
	// 	int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
	// 	RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_offerwall_show_failed");
	// 	RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
	// }

	// @Override
	// public boolean onOfferwallAdCredited(int credits, int credits_total, boolean credits_total_flag) {
	// 	int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
	// 	RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_offerwall_credited");
	// 	RunnerJNILib.DsMapAddDouble(dsMapIndex, "credits", (double) credits);
	// 	RunnerJNILib.DsMapAddDouble(dsMapIndex, "credits_total", (double) credits_total);
	// 	if (credits_total_flag)
	// 		RunnerJNILib.DsMapAddDouble(dsMapIndex, "credits_total_flag", 1.0);
	// 	else
	// 		RunnerJNILib.DsMapAddDouble(dsMapIndex, "credits_total_flag", 0.0);
	// 	RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
	// 	return true;
	// }

	// @Override
	// public void onGetOfferwallCreditsFailed(IronSourceError error) {
	// 	int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
	// 	RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_offerwall_credits_failed");
	// 	RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
	// }

	// @Override
	// public void onOfferwallClosed() {
	// 	int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
	// 	RunnerJNILib.DsMapAddString(dsMapIndex, "type", "ironsource_offerwall_closed");
	// 	RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
	// }
	
	
	public void ironsource_add_impression_data_listener()
	{
		IronSource.addImpressionDataListener(this);
	}
	
	@Override
    public void onImpressionSuccess(ImpressionData impressionData) 
	{
			int dsMapIndex = RunnerJNILib.jCreateDsMap(null, null, null);
			RunnerJNILib.DsMapAddString(dsMapIndex,"type","ironsource_add_impression_data_listener");
			RunnerJNILib.DsMapAddString(dsMapIndex,"platform", "ironSource");
			RunnerJNILib.DsMapAddString(dsMapIndex,"currency", "USD");
			RunnerJNILib.DsMapAddDouble(dsMapIndex,"revenue", impressionData.getRevenue());
			RunnerJNILib.DsMapAddString(dsMapIndex,"instance_id", impressionData.getInstanceId());
			RunnerJNILib.DsMapAddString(dsMapIndex,"instance_name", impressionData.getInstanceName());
			RunnerJNILib.DsMapAddString(dsMapIndex,"auction_id", impressionData.getAuctionId());
			RunnerJNILib.DsMapAddString(dsMapIndex,"ad_network", impressionData.getAdNetwork());
			RunnerJNILib.DsMapAddString(dsMapIndex,"placement", impressionData.getPlacement());
			RunnerJNILib.DsMapAddString(dsMapIndex,"ad_unit", impressionData.getAdUnit());
			RunnerJNILib.CreateAsynEventWithDSMap(dsMapIndex, EVENT_OTHER_SOCIAL);
    }
	
	
	
	public void ironsource_set_consent(double enable)
	{
		IronSource.setConsent(enable>0.5);
	}
	
	public void ironsource_set_metadata(String key,String value)
	{
		IronSource.setMetaData(key,value);
	}

}
