//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/im/actor/model/api/rpc/RequestSignUp.java
//

#ifndef _ImActorModelApiRpcRequestSignUp_H_
#define _ImActorModelApiRpcRequestSignUp_H_

@class ComDroidkitBserBserValues;
@class ComDroidkitBserBserWriter;
@class IOSByteArray;

#include "J2ObjC_header.h"
#include "im/actor/model/network/parser/Request.h"

#define ImActorModelApiRpcRequestSignUp_HEADER 4

@interface ImActorModelApiRpcRequestSignUp : ImActorModelNetworkParserRequest {
}

+ (ImActorModelApiRpcRequestSignUp *)fromBytesWithByteArray:(IOSByteArray *)data;

- (instancetype)initWithLong:(jlong)phoneNumber
                withNSString:(NSString *)smsHash
                withNSString:(NSString *)smsCode
                withNSString:(NSString *)name
               withByteArray:(IOSByteArray *)publicKey
               withByteArray:(IOSByteArray *)deviceHash
                withNSString:(NSString *)deviceTitle
                     withInt:(jint)appId
                withNSString:(NSString *)appKey
                 withBoolean:(jboolean)isSilent;

- (instancetype)init;

- (jlong)getPhoneNumber;

- (NSString *)getSmsHash;

- (NSString *)getSmsCode;

- (NSString *)getName;

- (IOSByteArray *)getPublicKey;

- (IOSByteArray *)getDeviceHash;

- (NSString *)getDeviceTitle;

- (jint)getAppId;

- (NSString *)getAppKey;

- (jboolean)isSilent;

- (void)parseWithComDroidkitBserBserValues:(ComDroidkitBserBserValues *)values;

- (void)serializeWithComDroidkitBserBserWriter:(ComDroidkitBserBserWriter *)writer;

- (jint)getHeaderKey;

@end

J2OBJC_EMPTY_STATIC_INIT(ImActorModelApiRpcRequestSignUp)

CF_EXTERN_C_BEGIN

FOUNDATION_EXPORT ImActorModelApiRpcRequestSignUp *ImActorModelApiRpcRequestSignUp_fromBytesWithByteArray_(IOSByteArray *data);

J2OBJC_STATIC_FIELD_GETTER(ImActorModelApiRpcRequestSignUp, HEADER, jint)
CF_EXTERN_C_END

J2OBJC_TYPE_LITERAL_HEADER(ImActorModelApiRpcRequestSignUp)

#endif // _ImActorModelApiRpcRequestSignUp_H_