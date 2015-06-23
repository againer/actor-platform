package im.actor.model.api.rpc;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.model.droidkit.bser.Bser;
import im.actor.model.droidkit.bser.BserParser;
import im.actor.model.droidkit.bser.BserObject;
import im.actor.model.droidkit.bser.BserValues;
import im.actor.model.droidkit.bser.BserWriter;
import im.actor.model.droidkit.bser.DataInput;
import im.actor.model.droidkit.bser.DataOutput;
import im.actor.model.droidkit.bser.util.SparseArray;
import org.jetbrains.annotations.Nullable;
import org.jetbrains.annotations.NotNull;
import com.google.j2objc.annotations.ObjectiveCName;
import static im.actor.model.droidkit.bser.Utils.*;
import java.io.IOException;
import im.actor.model.network.parser.*;
import java.util.List;
import java.util.ArrayList;
import im.actor.model.api.*;

public class RequestJoinGroup extends Request<ResponseJoinGroup> {

    public static final int HEADER = 0xb4;
    public static RequestJoinGroup fromBytes(byte[] data) throws IOException {
        return Bser.parse(new RequestJoinGroup(), data);
    }

    private String url;

    public RequestJoinGroup(@NotNull String url) {
        this.url = url;
    }

    public RequestJoinGroup() {

    }

    @NotNull
    public String getUrl() {
        return this.url;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.url = values.getString(1);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        if (this.url == null) {
            throw new IOException();
        }
        writer.writeString(1, this.url);
    }

    @Override
    public String toString() {
        String res = "rpc JoinGroup{";
        res += "}";
        return res;
    }

    @Override
    public int getHeaderKey() {
        return HEADER;
    }
}