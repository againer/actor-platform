//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/ActorScope.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/im/actor/model/droidkit/actors/ActorScope.java"

#include "J2ObjC_source.h"
#include "im/actor/model/droidkit/actors/Actor.h"
#include "im/actor/model/droidkit/actors/ActorRef.h"
#include "im/actor/model/droidkit/actors/ActorScope.h"
#include "im/actor/model/droidkit/actors/ActorSystem.h"
#include "im/actor/model/droidkit/actors/Props.h"
#include "im/actor/model/droidkit/actors/mailbox/ActorDispatcher.h"
#include "im/actor/model/droidkit/actors/mailbox/ActorEndpoint.h"
#include "im/actor/model/droidkit/actors/mailbox/Mailbox.h"

@interface DKActorScope () {
 @public
  NSString *path_;
  DKProps *props_;
  DKActorRef *actorRef_;
  DKMailbox *mailbox_;
  DKActorDispatcher *dispatcher_;
  DKActorSystem *actorSystem_;
  DKActor *actor_;
  DKActorRef *sender_;
  DKActorEndpoint *endpoint_;
}
@end

J2OBJC_FIELD_SETTER(DKActorScope, path_, NSString *)
J2OBJC_FIELD_SETTER(DKActorScope, props_, DKProps *)
J2OBJC_FIELD_SETTER(DKActorScope, actorRef_, DKActorRef *)
J2OBJC_FIELD_SETTER(DKActorScope, mailbox_, DKMailbox *)
J2OBJC_FIELD_SETTER(DKActorScope, dispatcher_, DKActorDispatcher *)
J2OBJC_FIELD_SETTER(DKActorScope, actorSystem_, DKActorSystem *)
J2OBJC_FIELD_SETTER(DKActorScope, actor_, DKActor *)
J2OBJC_FIELD_SETTER(DKActorScope, sender_, DKActorRef *)
J2OBJC_FIELD_SETTER(DKActorScope, endpoint_, DKActorEndpoint *)


#line 13
@implementation DKActorScope


#line 31
- (instancetype)initWithDKActorSystem:(DKActorSystem *)actorSystem
                        withDKMailbox:(DKMailbox *)mailbox
                withDKActorDispatcher:(DKActorDispatcher *)dispatcher
                         withNSString:(NSString *)path
                          withDKProps:(DKProps *)props
                  withDKActorEndpoint:(DKActorEndpoint *)endpoint {
  if (self = [super init]) {
    
#line 33
    self->actorSystem_ = actorSystem;
    
#line 34
    self->mailbox_ = mailbox;
    
#line 35
    self->actorRef_ = [[DKActorRef alloc] initWithDKActorEndpoint:endpoint withDKActorSystem:actorSystem withDKActorDispatcher:dispatcher withNSString:path];
    
#line 36
    self->dispatcher_ = dispatcher;
    
#line 37
    self->path_ = path;
    
#line 38
    self->props_ = props;
    
#line 39
    self->endpoint_ = endpoint;
  }
  return self;
}


#line 42
- (DKActorEndpoint *)getEndpoint {
  
#line 43
  return endpoint_;
}


#line 46
- (DKActorDispatcher *)getDispatcher {
  
#line 47
  return dispatcher_;
}


#line 50
- (NSString *)getPath {
  
#line 51
  return path_;
}


#line 54
- (DKProps *)getProps {
  
#line 55
  return props_;
}


#line 58
- (DKActorRef *)getActorRef {
  
#line 59
  return actorRef_;
}


#line 62
- (DKMailbox *)getMailbox {
  
#line 63
  return mailbox_;
}


#line 66
- (DKActor *)getActor {
  
#line 67
  return actor_;
}


#line 70
- (DKActorSystem *)getActorSystem {
  
#line 71
  return actorSystem_;
}


#line 74
- (DKActorRef *)getSender {
  
#line 75
  return sender_;
}


#line 78
- (void)setSenderWithDKActorRef:(DKActorRef *)sender {
  
#line 79
  self->sender_ = sender;
}


#line 82
- (void)onActorCreatedWithDKActor:(DKActor *)actor {
  
#line 83
  self->actor_ = actor;
}


#line 86
- (void)onActorDie {
  
#line 87
  self->actor_ = nil;
}

- (void)copyAllFieldsTo:(DKActorScope *)other {
  [super copyAllFieldsTo:other];
  other->path_ = path_;
  other->props_ = props_;
  other->actorRef_ = actorRef_;
  other->mailbox_ = mailbox_;
  other->dispatcher_ = dispatcher_;
  other->actorSystem_ = actorSystem_;
  other->actor_ = actor_;
  other->sender_ = sender_;
  other->endpoint_ = endpoint_;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(DKActorScope)