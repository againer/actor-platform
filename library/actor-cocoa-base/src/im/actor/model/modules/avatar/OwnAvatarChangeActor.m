//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/avatar/OwnAvatarChangeActor.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/modules/avatar/OwnAvatarChangeActor.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Avatar.h"
#include "im/actor/model/api/FileLocation.h"
#include "im/actor/model/api/base/SeqUpdate.h"
#include "im/actor/model/api/rpc/RequestEditAvatar.h"
#include "im/actor/model/api/rpc/RequestRemoveAvatar.h"
#include "im/actor/model/api/rpc/ResponseEditAvatar.h"
#include "im/actor/model/api/rpc/ResponseSeq.h"
#include "im/actor/model/api/updates/UpdateUserAvatarChanged.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/entity/FileReference.h"
#include "im/actor/model/modules/Files.h"
#include "im/actor/model/modules/Modules.h"
#include "im/actor/model/modules/Profile.h"
#include "im/actor/model/modules/Updates.h"
#include "im/actor/model/modules/avatar/OwnAvatarChangeActor.h"
#include "im/actor/model/modules/file/UploadManager.h"
#include "im/actor/model/modules/updates/internal/ExecuteAfter.h"
#include "im/actor/model/modules/utils/ModuleActor.h"
#include "im/actor/model/modules/utils/RandomUtils.h"
#include "im/actor/model/mvvm/ValueModel.h"
#include "im/actor/model/network/RpcException.h"
#include "im/actor/model/viewmodel/AvatarUploadState.h"
#include "im/actor/model/viewmodel/OwnAvatarVM.h"

@interface ImActorModelModulesAvatarOwnAvatarChangeActor () {
 @public
  jlong currentChangeTask_;
}
@end

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar () {
 @public
  NSString *descriptor_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar, descriptor_, NSString *)

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged () {
 @public
  jlong rid_;
}
@end

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_$1 () {
 @public
  ImActorModelModulesAvatarOwnAvatarChangeActor *this$0_;
  jlong val$rid_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarOwnAvatarChangeActor_$1, this$0_, ImActorModelModulesAvatarOwnAvatarChangeActor *)

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1 () {
 @public
  ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *this$0_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1, this$0_, ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *)

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_$2 () {
 @public
  ImActorModelModulesAvatarOwnAvatarChangeActor *this$0_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarOwnAvatarChangeActor_$2, this$0_, ImActorModelModulesAvatarOwnAvatarChangeActor *)

@interface ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1 () {
 @public
  ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *this$0_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1, this$0_, ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *)


#line 22
@implementation ImActorModelModulesAvatarOwnAvatarChangeActor


#line 26
- (instancetype)initWithImActorModelModulesModules:(ImActorModelModulesModules *)modules {
  if (self =
#line 27
  [super initWithImActorModelModulesModules:modules]) {
    currentChangeTask_ =
#line 24
    0;
  }
  return self;
}


#line 30
- (void)changeAvatarWithNSString:(NSString *)descriptor {
  
#line 31
  if (currentChangeTask_ != 0) {
    [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getFilesModule])) cancelUploadWithLong:currentChangeTask_];
    currentChangeTask_ = 0;
  }
  currentChangeTask_ = ImActorModelModulesUtilsRandomUtils_nextRid();
  
#line 37
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithId:[[AMAvatarUploadState alloc] initWithNSString:descriptor withBoolean:YES]];
  
#line 39
  [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getFilesModule])) requestUploadWithLong:currentChangeTask_ withNSString:descriptor withNSString:@"avatar.jpg" withDKActorRef:[self self__]];
}


#line 42
- (void)uploadCompletedWithLong:(jlong)rid
            withAMFileReference:(AMFileReference *)fileReference {
  
#line 43
  if (rid != currentChangeTask_) {
    return;
  }
  [self requestWithImActorModelNetworkParserRequest:[[ImActorModelApiRpcRequestEditAvatar alloc] initWithImActorModelApiFileLocation:[[ImActorModelApiFileLocation alloc] initWithLong:[((AMFileReference *) nil_chk(fileReference)) getFileId] withLong:
#line 47
  [fileReference getAccessHash]]] withAMRpcCallback:[[ImActorModelModulesAvatarOwnAvatarChangeActor_$1 alloc] initWithImActorModelModulesAvatarOwnAvatarChangeActor:self withLong:rid]];
}


#line 76
- (void)avatarChangedWithLong:(jlong)rid {
  
#line 77
  if (rid != currentChangeTask_) {
    return;
  }
  currentChangeTask_ = 0;
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithId:[[AMAvatarUploadState alloc] initWithNSString:nil withBoolean:NO]];
}


#line 84
- (void)uploadErrorWithLong:(jlong)rid {
  
#line 85
  if (rid != currentChangeTask_) {
    return;
  }
  currentChangeTask_ = 0;
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithId:[[AMAvatarUploadState alloc] initWithNSString:nil withBoolean:NO]];
}


#line 92
- (void)removeAvatar {
  
#line 93
  if (currentChangeTask_ != 0) {
    [((ImActorModelModulesFiles *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getFilesModule])) cancelUploadWithLong:currentChangeTask_];
    currentChangeTask_ = 0;
  }
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([self modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithId:[[AMAvatarUploadState alloc] initWithNSString:nil withBoolean:YES]];
  [self requestWithImActorModelNetworkParserRequest:[[ImActorModelApiRpcRequestRemoveAvatar alloc] init] withAMRpcCallback:[[ImActorModelModulesAvatarOwnAvatarChangeActor_$2 alloc] initWithImActorModelModulesAvatarOwnAvatarChangeActor:self]];
}


#line 124
- (void)onReceiveWithId:(id)message {
  
#line 125
  if ([message isKindOfClass:[ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar class]]) {
    ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar *changeAvatar = (ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar *) check_class_cast(message, [ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar class]);
    [self changeAvatarWithNSString:[((ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar *) nil_chk(changeAvatar)) getDescriptor]];
  }
  else
#line 128
  if ([message isKindOfClass:[ImActorModelModulesFileUploadManager_UploadCompleted class]]) {
    ImActorModelModulesFileUploadManager_UploadCompleted *uploadCompleted = (ImActorModelModulesFileUploadManager_UploadCompleted *) check_class_cast(message, [ImActorModelModulesFileUploadManager_UploadCompleted class]);
    [self uploadCompletedWithLong:[((ImActorModelModulesFileUploadManager_UploadCompleted *) nil_chk(uploadCompleted)) getRid] withAMFileReference:[uploadCompleted getFileReference]];
  }
  else
#line 131
  if ([message isKindOfClass:[ImActorModelModulesFileUploadManager_UploadError class]]) {
    ImActorModelModulesFileUploadManager_UploadError *uploadError = (ImActorModelModulesFileUploadManager_UploadError *) check_class_cast(message, [ImActorModelModulesFileUploadManager_UploadError class]);
    [self uploadErrorWithLong:[((ImActorModelModulesFileUploadManager_UploadError *) nil_chk(uploadError)) getRid]];
  }
  else
#line 134
  if ([message isKindOfClass:[ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar class]]) {
    [self removeAvatar];
  }
  else
#line 136
  if ([message isKindOfClass:[ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged class]]) {
    [self avatarChangedWithLong:[((ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged *) nil_chk(((ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged *) check_class_cast(message, [ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged class])))) getRid]];
  }
  else {
    
#line 139
    [self dropWithId:message];
  }
}

- (void)copyAllFieldsTo:(ImActorModelModulesAvatarOwnAvatarChangeActor *)other {
  [super copyAllFieldsTo:other];
  other->currentChangeTask_ = currentChangeTask_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor)


#line 143
@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar


#line 146
- (instancetype)initWithNSString:(NSString *)descriptor {
  if (self = [super init]) {
    
#line 147
    self->descriptor_ = descriptor;
  }
  return self;
}


#line 150
- (NSString *)getDescriptor {
  
#line 151
  return descriptor_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar *)other {
  [super copyAllFieldsTo:other];
  other->descriptor_ = descriptor_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_ChangeAvatar)


#line 155
@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar

- (instancetype)init {
  return [super init];
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_RemoveAvatar)


#line 159
@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged


#line 162
- (instancetype)initWithLong:(jlong)rid {
  if (self = [super init]) {
    
#line 163
    self->rid_ = rid;
  }
  return self;
}


#line 166
- (jlong)getRid {
  
#line 167
  return rid_;
}

- (void)copyAllFieldsTo:(ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged *)other {
  [super copyAllFieldsTo:other];
  other->rid_ = rid_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_$1


#line 49
- (void)onResultWithImActorModelNetworkParserResponse:(ImActorModelApiRpcResponseEditAvatar *)response {
  
#line 52
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:[[ImActorModelApiBaseSeqUpdate alloc] initWithInt:[((ImActorModelApiRpcResponseEditAvatar *) nil_chk(response)) getSeq] withByteArray:
#line 53
  [response getState] withInt:ImActorModelApiUpdatesUpdateUserAvatarChanged_HEADER withByteArray:
#line 54
  [((ImActorModelApiUpdatesUpdateUserAvatarChanged *) [[ImActorModelApiUpdatesUpdateUserAvatarChanged alloc] initWithInt:[this$0_ myUid] withImActorModelApiAvatar:[response getAvatar]]) toByteArray]]];
  
#line 57
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:[[ImActorModelModulesUpdatesInternalExecuteAfter alloc] initWithInt:[response getSeq] withJavaLangRunnable:[[ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1 alloc] initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1:self]]];
}


#line 66
- (void)onErrorWithAMRpcException:(AMRpcException *)e {
  
#line 67
  if (val$rid_ != this$0_->currentChangeTask_) {
    return;
  }
  this$0_->currentChangeTask_ = 0;
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([this$0_ modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithId:[[AMAvatarUploadState alloc] initWithNSString:nil withBoolean:NO]];
}

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor:(ImActorModelModulesAvatarOwnAvatarChangeActor *)outer$
                                                             withLong:(jlong)capture$0 {
  this$0_ = outer$;
  val$rid_ = capture$0;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
  other->val$rid_ = val$rid_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_$1)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1


#line 59
- (void)run {
  
#line 60
  [((DKActorRef *) nil_chk([this$0_->this$0_ self__])) sendWithId:[[ImActorModelModulesAvatarOwnAvatarChangeActor_AvatarChanged alloc] initWithLong:this$0_->val$rid_]];
}

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor_$1:(ImActorModelModulesAvatarOwnAvatarChangeActor_$1 *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_$1_$1)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_$2


#line 100
- (void)onResultWithImActorModelNetworkParserResponse:(ImActorModelApiRpcResponseSeq *)response {
  
#line 101
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:[[ImActorModelApiBaseSeqUpdate alloc] initWithInt:[((ImActorModelApiRpcResponseSeq *) nil_chk(response)) getSeq] withByteArray:
#line 102
  [response getState] withInt:ImActorModelApiUpdatesUpdateUserAvatarChanged_HEADER withByteArray:
#line 103
  [((ImActorModelApiUpdatesUpdateUserAvatarChanged *) [[ImActorModelApiUpdatesUpdateUserAvatarChanged alloc] initWithInt:[this$0_ myUid] withImActorModelApiAvatar:nil]) toByteArray]]];
  
#line 106
  [((ImActorModelModulesUpdates *) nil_chk([this$0_ updates])) onUpdateReceivedWithId:[[ImActorModelModulesUpdatesInternalExecuteAfter alloc] initWithInt:[response getSeq] withJavaLangRunnable:[[ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1 alloc] initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2:self]]];
}


#line 115
- (void)onErrorWithAMRpcException:(AMRpcException *)e {
  
#line 116
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([this$0_ modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithId:[[AMAvatarUploadState alloc] initWithNSString:nil withBoolean:NO]];
}

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor:(ImActorModelModulesAvatarOwnAvatarChangeActor *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_$2)

@implementation ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1


#line 108
- (void)run {
  
#line 109
  [((AMValueModel *) nil_chk([((AMOwnAvatarVM *) nil_chk([((ImActorModelModulesProfile *) nil_chk([((ImActorModelModulesModules *) nil_chk([this$0_->this$0_ modules])) getProfile])) getOwnAvatarVM])) getUploadState])) changeWithId:[[AMAvatarUploadState alloc] initWithNSString:nil withBoolean:NO]];
}

- (instancetype)initWithImActorModelModulesAvatarOwnAvatarChangeActor_$2:(ImActorModelModulesAvatarOwnAvatarChangeActor_$2 *)outer$ {
  this$0_ = outer$;
  return [super init];
}

- (void)copyAllFieldsTo:(ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1 *)other {
  [super copyAllFieldsTo:other];
  other->this$0_ = this$0_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesAvatarOwnAvatarChangeActor_$2_$1)