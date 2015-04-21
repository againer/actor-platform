//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/ResponseStartUpload.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/api/rpc/ResponseStartUpload.java"

#include "IOSClass.h"
#include "IOSPrimitiveArray.h"
#include "J2ObjC_source.h"
#include "im/actor/model/api/UploadConfig.h"
#include "im/actor/model/api/rpc/ResponseStartUpload.h"
#include "im/actor/model/droidkit/bser/Bser.h"
#include "im/actor/model/droidkit/bser/BserObject.h"
#include "im/actor/model/droidkit/bser/BserValues.h"
#include "im/actor/model/droidkit/bser/BserWriter.h"
#include "java/io/IOException.h"

@interface ImActorModelApiRpcResponseStartUpload () {
 @public
  ImActorModelApiUploadConfig *config_;
}
@end

J2OBJC_FIELD_SETTER(ImActorModelApiRpcResponseStartUpload, config_, ImActorModelApiUploadConfig *)


#line 20
@implementation ImActorModelApiRpcResponseStartUpload


#line 23
+ (ImActorModelApiRpcResponseStartUpload *)fromBytesWithByteArray:(IOSByteArray *)data {
  return ImActorModelApiRpcResponseStartUpload_fromBytesWithByteArray_(data);
}


#line 29
- (instancetype)initWithImActorModelApiUploadConfig:(ImActorModelApiUploadConfig *)config {
  if (self = [super init]) {
    
#line 30
    self->config_ = config;
  }
  return self;
}


#line 33
- (instancetype)init {
  return [super init];
}

- (ImActorModelApiUploadConfig *)getConfig {
  
#line 38
  return self->config_;
}


#line 42
- (void)parseWithBSBserValues:(BSBserValues *)values {
  self->config_ = [((BSBserValues *) nil_chk(values)) getObjWithInt:1 withBSBserObject:[[ImActorModelApiUploadConfig alloc] init]];
}


#line 47
- (void)serializeWithBSBserWriter:(BSBserWriter *)writer {
  
#line 48
  if (self->config_ == nil) {
    @throw [[JavaIoIOException alloc] init];
  }
  [((BSBserWriter *) nil_chk(writer)) writeObjectWithInt:1 withBSBserObject:self->config_];
}

- (NSString *)description {
  NSString *res = @"tuple StartUpload{";
  res = JreStrcat("$C", res, '}');
  return res;
}

- (jint)getHeaderKey {
  
#line 63
  return ImActorModelApiRpcResponseStartUpload_HEADER;
}

- (void)copyAllFieldsTo:(ImActorModelApiRpcResponseStartUpload *)other {
  [super copyAllFieldsTo:other];
  other->config_ = config_;
}

@end

ImActorModelApiRpcResponseStartUpload *ImActorModelApiRpcResponseStartUpload_fromBytesWithByteArray_(IOSByteArray *data) {
  ImActorModelApiRpcResponseStartUpload_init();
  
#line 24
  return ((ImActorModelApiRpcResponseStartUpload *) BSBser_parseWithBSBserObject_withByteArray_([[ImActorModelApiRpcResponseStartUpload alloc] init], data));
}

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ImActorModelApiRpcResponseStartUpload)