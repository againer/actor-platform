//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-platform/actor-apps/core/src/main/java/im/actor/model/api/updates/UpdateChatDelete.java
//


#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/Peer.h"
#include "im/actor/model/api/updates/UpdateChatDelete.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "im/actor/model/network/parser/Update.h"
#include "java/io/IOException.h"

@interface APUpdateChatDelete () {
 @public
  APPeer *peer_;
}

@end

J2OBJC_FIELD_SETTER(APUpdateChatDelete, peer_, APPeer *)

@implementation APUpdateChatDelete

+ (APUpdateChatDelete *)fromBytesWithByteArray:(IOSByteArray *)data {
  return APUpdateChatDelete_fromBytesWithByteArray_(data);
}

- (instancetype)initWithAPPeer:(APPeer *)peer {
  APUpdateChatDelete_initWithAPPeer_(self, peer);
  return self;
}

- (instancetype)init {
  APUpdateChatDelete_init(self);
  return self;
}

- (APPeer *)getPeer {
  return self->peer_;
}

- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->peer_ = [((BSBserValues *) nil_chk(values)) getObjWithInt:1 withBSBserObject:new_APPeer_init()];
}

- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  if (self->peer_ == nil) {
    @throw new_JavaIoIOException_init();
  }
  [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:1 withBSBserObject:self->peer_];
}

- (NSString *)description {
  NSString *res = @"update ChatDelete{";
  res = JreStrcat("$$", res, JreStrcat("$@", @"peer=", self->peer_));
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  return APUpdateChatDelete_HEADER;
}

@end

APUpdateChatDelete *APUpdateChatDelete_fromBytesWithByteArray_(IOSByteArray *data) {
  APUpdateChatDelete_initialize();
  return ((APUpdateChatDelete *) BSBser_parseWithBSBserObject_withByteArray_(new_APUpdateChatDelete_init(), data));
}

void APUpdateChatDelete_initWithAPPeer_(APUpdateChatDelete *self, APPeer *peer) {
  (void) APUpdate_init(self);
  self->peer_ = peer;
}

APUpdateChatDelete *new_APUpdateChatDelete_initWithAPPeer_(APPeer *peer) {
  APUpdateChatDelete *self = [APUpdateChatDelete alloc];
  APUpdateChatDelete_initWithAPPeer_(self, peer);
  return self;
}

void APUpdateChatDelete_init(APUpdateChatDelete *self) {
  (void) APUpdate_init(self);
}

APUpdateChatDelete *new_APUpdateChatDelete_init() {
  APUpdateChatDelete *self = [APUpdateChatDelete alloc];
  APUpdateChatDelete_init(self);
  return self;
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(APUpdateChatDelete)
