package im.actor.messenger.app.images;

import com.droidkit.images.common.ImageLoadException;
import com.droidkit.images.loading.ImageLoader;
import com.droidkit.images.loading.actors.base.BasicTaskActor;
import com.droidkit.images.ops.ImageLoading;

import im.actor.model.android.AndroidFileReference;
import im.actor.model.entity.FileLocation;
import im.actor.model.files.FileReference;
import im.actor.model.modules.file.DownloadCallback;

import static im.actor.messenger.app.Core.messenger;

/**
 * Created by ex3ndr on 17.09.14.
 */
public class AvatarActor extends BasicTaskActor<AvatarTask> {

    private DownloadCallback fileCallback = new ActorFileCallback();
    private FileLocation location;

    public AvatarActor(AvatarTask task, ImageLoader loader) {
        super(task, loader);
        location = getTask().getAvatar().getSmallImage().getFileLocation();
    }

    @Override
    public void startTask() {
        messenger().bindRawFile(location, true, fileCallback);
    }

    private void onDownloaded(FileReference reference) {
        if (isCompleted()) {
            return;
        }
        AndroidFileReference fileDescriptor = (AndroidFileReference) reference;
        try {
            completeTask(ImageLoading.loadBitmap(fileDescriptor.getDescriptor()));
        } catch (ImageLoadException e) {
            e.printStackTrace();
            error(e);
        }
    }

    @Override
    public void onTaskObsolete() {
        messenger().unbindRawFile(location.getFileId(), false, fileCallback);
    }

    @Override
    public void onReceive(Object message) {
        if (message instanceof OnDownloaded) {
            onDownloaded(((OnDownloaded) message).getReference());
        } else {
            super.onReceive(message);
        }
    }

    private class ActorFileCallback implements DownloadCallback {

        @Override
        public void onNotDownloaded() {

        }

        @Override
        public void onDownloading(float progress) {

        }

        @Override
        public void onDownloaded(FileReference reference) {
            self().send(new OnDownloaded(reference));
        }
    }

    private class OnDownloaded {
        private FileReference reference;

        private OnDownloaded(FileReference reference) {
            this.reference = reference;
        }

        public FileReference getReference() {
            return reference;
        }
    }
}