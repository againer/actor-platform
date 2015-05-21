//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/ServiceExContactRegistered.java
//


#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/ServiceEx.h"
#include "im/actor/model/api/ServiceExContactRegistered.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/droidkit/bser/util/SparseArray.h"
#include "java/io/IOException.h"

@interface ImActorModelApiServiceExContactRegistered () {
 @public
  jint uid_;
}

@end

@implementation ImActorModelApiServiceExContactRegistered

- (instancetype)initWithInt:(jint)uid {
  ImActorModelApiServiceExContactRegistered_initWithInt_(self, uid);
  return self;
}

- (instancetype)init {
  ImActorModelApiServiceExContactRegistered_init(self);
  return self;
}

- (jint)getHeader {
  return 8;
}

- (jint)getUid {
  return self->uid_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->uid_ = [((BSBserValues *) nil_chk(values)) getIntWithInt:1];
  if ([values hasRemaining]) {
    [self setUnmappedObjectsWithImActorModelDroidkitBserUtilSparseArray:[values buildRemaining]];
  }
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  [((BSBserWriter *) nil_chk(writer)) writeIntWithInt:1 withInt:self->uid_];
  if ([self getUnmappedObjects] != nil) {
    ImActorModelDroidkitBserUtilSparseArray *unmapped = [self getUnmappedObjects];
    for (jint i = 0; i < [((ImActorModelDroidkitBserUtilSparseArray *) nil_chk(unmapped)) size]; i++) {
      jint key = [unmapped keyAtWithInt:i];
      [writer writeUnmappedWithInt:key withId:[unmapped getWithInt:key]];
    }
  }
}

- (NSString *)description {
  NSString *res = @"struct ServiceExContactRegistered{";
  res = JreStrcat("$$", res, JreStrcat("$I", @"uid=", self->uid_));
  res = JreStrcat("$C", res, '}');
  return res;
}

@end

void ImActorModelApiServiceExContactRegistered_initWithInt_(ImActorModelApiServiceExContactRegistered *self, jint uid) {
  (void) ImActorModelApiServiceEx_init(self);
  self->uid_ = uid;
}

ImActorModelApiServiceExContactRegistered *new_ImActorModelApiServiceExContactRegistered_initWithInt_(jint uid) {
  ImActorModelApiServiceExContactRegistered *self = [ImActorModelApiServiceExContactRegistered alloc];
  ImActorModelApiServiceExContactRegistered_initWithInt_(self, uid);
  return self;
}

void ImActorModelApiServiceExContactRegistered_init(ImActorModelApiServiceExContactRegistered *self) {
  (void) ImActorModelApiServiceEx_init(self);
}

ImActorModelApiServiceExContactRegistered *new_ImActorModelApiServiceExContactRegistered_init() {
  ImActorModelApiServiceExContactRegistered *self = [ImActorModelApiServiceExContactRegistered alloc];
  ImActorModelApiServiceExContactRegistered_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiServiceExContactRegistered)