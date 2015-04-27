package im.actor.android;

import android.util.Log;

import im.actor.model.LogProvider;

/**
 * Created by ex3ndr on 16.02.15.
 */
public class AndroidLog implements LogProvider {
    @Override
    public void w(String tag, String message) {
        Log.w(tag, message);
    }

    @Override
    public void e(String tag, Throwable throwable) {
        Log.e(tag, "", throwable);
    }

    @Override
    public void d(String tag, String message) {
        Log.d(tag, message);
    }

    @Override
    public void v(String tag, String message) {
        Log.v(tag, message);
    }
}