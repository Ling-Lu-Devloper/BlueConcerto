package ${YYAndroidPackageName};

/*
 * Author:       Le Tuan Anh
 * Created:      6/14/2020 6:49 PM
 **/

import android.app.Activity;
import android.app.admin.DevicePolicyManager;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;
import android.util.Log;
import android.view.WindowManager;
import android.widget.Toast;

public class ScreenUtils{

    public void changeScreenLight(final double number){
        RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                WindowManager.LayoutParams params = RunnerActivity.CurrentActivity.getWindow().getAttributes();
                params.screenBrightness = (float) number;
                RunnerActivity.CurrentActivity.getWindow().setAttributes(params);
            }
        });
    }

    public void turnOffScreen(){
        RunnerActivity.CurrentActivity.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                try {
                    Activity context = RunnerActivity.CurrentActivity;
                    PowerManager pm = (PowerManager)context.getSystemService(Context.POWER_SERVICE);
                    if (pm.isInteractive()) {
                        DevicePolicyManager policy = (DevicePolicyManager)
                                context.getSystemService(Context.DEVICE_POLICY_SERVICE);
                        try {
                            policy.lockNow();
                        } catch (SecurityException ex) {
                            Toast.makeText(
                                    context,
                                    "must enable device administrator",
                                    Toast.LENGTH_LONG).show();
                            ComponentName admin = new ComponentName(context, AdminReceiver.class);
                            Intent intent = new Intent(
                                    DevicePolicyManager.ACTION_ADD_DEVICE_ADMIN).putExtra(
                                    DevicePolicyManager.EXTRA_DEVICE_ADMIN, admin);
                            context.startActivity(intent);
                        }
                    }
                }catch (Exception e){
                    Log.d("yoyo", e.getMessage());
                }
            }
        });
    }
}
