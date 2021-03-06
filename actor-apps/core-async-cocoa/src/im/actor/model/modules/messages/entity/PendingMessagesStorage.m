//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/modules/messages/entity/PendingMessagesStorage.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/modules/messages/entity/PendingMessage.h"
#include "im/actor/model/modules/messages/entity/PendingMessagesStorage.h"
#include "java/io/IOException.h"
#include "java/util/ArrayList.h"
#include "java/util/List.h"

@interface ImActorModelModulesMessagesEntityPendingMessagesStorage () {
 @public
  JavaUtilArrayList *pendingMessages_;
}

@end

J2OBJC_FIELD_SETTER(ImActorModelModulesMessagesEntityPendingMessagesStorage, pendingMessages_, JavaUtilArrayList *)

@implementation ImActorModelModulesMessagesEntityPendingMessagesStorage

+ (ImActorModelModulesMessagesEntityPendingMessagesStorage *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelModulesMessagesEntityPendingMessagesStorage_fromBytesWithByteArray_(data);
}

- (JavaUtilArrayList *)getPendingMessages {
  return pendingMessages_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  for (IOSByteArray * __strong data in nil_chk([((BSBserValues *) nil_chk(values)) getRepeatedBytesWithInt:1])) {
    @try {
      [((JavaUtilArrayList *) nil_chk(pendingMessages_)) addWithId:ImActorModelModulesMessagesEntityPendingMessage_fromBytesWithByteArray_(data)];
    }
    @catch (JavaIoIOException *e) {
      [((JavaIoIOException *) nil_chk(e)) printStackTrace];
    }
  }
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeRepeatedObjWithInt:1 withJavaUtilList:pendingMessages_];
}

- (instancetype)init {
  ImActorModelModulesMessagesEntityPendingMessagesStorage_init(self);
  return self;
}

@end

ImActorModelModulesMessagesEntityPendingMessagesStorage *ImActorModelModulesMessagesEntityPendingMessagesStorage_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelModulesMessagesEntityPendingMessagesStorage_initialize();
  return ((ImActorModelModulesMessagesEntityPendingMessagesStorage *) BSBser_parseWithBSBserObject_withByteArray_(new_ImActorModelModulesMessagesEntityPendingMessagesStorage_init(), data));
}

void ImActorModelModulesMessagesEntityPendingMessagesStorage_init(ImActorModelModulesMessagesEntityPendingMessagesStorage *self) {
  (void) BSBserObject_init(self);
  self->pendingMessages_ = new_JavaUtilArrayList_init();
}

ImActorModelModulesMessagesEntityPendingMessagesStorage *new_ImActorModelModulesMessagesEntityPendingMessagesStorage_init() {
  ImActorModelModulesMessagesEntityPendingMessagesStorage *self = [ImActorModelModulesMessagesEntityPendingMessagesStorage alloc];
  ImActorModelModulesMessagesEntityPendingMessagesStorage_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelModulesMessagesEntityPendingMessagesStorage)
