package im.actor.model.modules.avatar;

import java.util.HashMap;

import im.actor.model.api.FileLocation;
import im.actor.model.api.GroupOutPeer;
import im.actor.model.api.base.SeqUpdate;
import im.actor.model.api.rpc.RequestEditGroupAvatar;
import im.actor.model.api.rpc.ResponseEditGroupAvatar;
import im.actor.model.api.updates.UpdateGroupAvatarChanged;
import im.actor.model.entity.FileReference;
import im.actor.model.modules.Modules;
import im.actor.model.modules.file.UploadManager;
import im.actor.model.modules.updates.internal.ExecuteAfter;
import im.actor.model.modules.utils.ModuleActor;
import im.actor.model.modules.utils.RandomUtils;
import im.actor.model.network.RpcCallback;
import im.actor.model.network.RpcException;
import im.actor.model.viewmodel.AvatarUploadState;

/**
 * Created by ex3ndr on 04.03.15.
 */
public class GroupAvatarChangeActor extends ModuleActor {

    private HashMap<Integer, Long> currentTasks = new HashMap<Integer, Long>();
    private HashMap<Long, Integer> tasksMap = new HashMap<Long, Integer>();

    public GroupAvatarChangeActor(Modules modules) {
        super(modules);
    }

    public void changeAvatar(int gid, String descriptor) {
        if (currentTasks.containsKey(gid)) {
            modules().getFilesModule().cancelUpload(currentTasks.get(gid));
            currentTasks.remove(gid);
        }
        long rid = RandomUtils.nextRid();
        currentTasks.put(gid, rid);
        tasksMap.put(rid, gid);

        modules().getGroupsModule().getAvatarVM(gid).getUploadState().change(new AvatarUploadState(descriptor, true));
        modules().getFilesModule().requestUpload(rid, descriptor, "avatar.jpg", self());
    }

    public void uploadCompleted(final long rid, FileReference fileReference) {
        if (!tasksMap.containsKey(rid)) {
            return;
        }

        final int gid = tasksMap.get(rid);
        long accessHash = getGroup(gid).getAccessHash();

        if (currentTasks.get(gid) != rid) {
            return;
        }

        request(new RequestEditGroupAvatar(new GroupOutPeer(gid, accessHash), rid, new FileLocation(fileReference.getFileId(),
                fileReference.getAccessHash())), new RpcCallback<ResponseEditGroupAvatar>() {

            @Override
            public void onResult(ResponseEditGroupAvatar response) {
                // Put update to sequence
                updates().onUpdateReceived(new SeqUpdate(response.getSeq(),
                        response.getState(), UpdateGroupAvatarChanged.HEADER,
                        new UpdateGroupAvatarChanged(gid, rid, myUid(),
                                response.getAvatar(), response.getDate()).toByteArray()));

                // After update applied turn of uploading state
                updates().onUpdateReceived(new ExecuteAfter(response.getSeq(), new Runnable() {
                    @Override
                    public void run() {
                        self().send(new AvatarChanged(gid, rid));
                    }
                }));
            }

            @Override
            public void onError(RpcException e) {
                modules().getGroupsModule().getAvatarVM(gid).getUploadState().change(new AvatarUploadState(null, false));
            }
        });
    }

    public void avatarChanged(int gid, long rid) {
        if (!currentTasks.containsKey(gid)) {
            return;
        }
        if (currentTasks.get(gid) != rid) {
            return;
        }
        currentTasks.remove(gid);
        modules().getGroupsModule().getAvatarVM(gid).getUploadState().change(new AvatarUploadState(null, false));
    }

    @Override
    public void onReceive(Object message) {
        if (message instanceof ChangeAvatar) {
            ChangeAvatar changeAvatar = (ChangeAvatar) message;
            changeAvatar(changeAvatar.getGid(), changeAvatar.getDescriptor());
        } else if (message instanceof UploadManager.UploadCompleted) {
            UploadManager.UploadCompleted uploadCompleted = (UploadManager.UploadCompleted) message;
            uploadCompleted(uploadCompleted.getRid(), uploadCompleted.getFileReference());
        } else if (message instanceof AvatarChanged) {
            AvatarChanged avatarChanged = (AvatarChanged) message;
            avatarChanged(avatarChanged.getGid(), avatarChanged.getRid());
        } else {
            drop(message);
        }
    }

    public static class AvatarChanged {
        private int gid;
        private long rid;

        public AvatarChanged(int gid, long rid) {
            this.gid = gid;
            this.rid = rid;
        }

        public int getGid() {
            return gid;
        }

        public long getRid() {
            return rid;
        }
    }

    public static class ChangeAvatar {
        private int gid;
        private String descriptor;

        public ChangeAvatar(int gid, String descriptor) {
            this.gid = gid;
            this.descriptor = descriptor;
        }

        public int getGid() {
            return gid;
        }

        public String getDescriptor() {
            return descriptor;
        }
    }
}
