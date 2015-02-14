//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/actor-ios/build/java/com/droidkit/actors/tasks/TaskActor.java
//

#include "IOSClass.h"
#include "J2ObjC_source.h"
#include "com/droidkit/actors/Actor.h"
#include "com/droidkit/actors/ActorContext.h"
#include "com/droidkit/actors/ActorRef.h"
#include "com/droidkit/actors/messages/PoisonPill.h"
#include "com/droidkit/actors/tasks/TaskActor.h"
#include "com/droidkit/actors/tasks/messages/TaskCancel.h"
#include "com/droidkit/actors/tasks/messages/TaskError.h"
#include "com/droidkit/actors/tasks/messages/TaskProgress.h"
#include "com/droidkit/actors/tasks/messages/TaskRequest.h"
#include "com/droidkit/actors/tasks/messages/TaskResult.h"
#include "com/droidkit/actors/tasks/messages/TaskStart.h"
#include "java/lang/Throwable.h"
#include "java/util/HashSet.h"

@interface ComDroidkitActorsTasksTaskActor () {
 @public
  JavaUtilHashSet *requests_;
  id result_;
  jboolean isCompleted__;
  jboolean isCompletedSuccess__;
  jlong dieTimeout_;
}
@end

J2OBJC_FIELD_SETTER(ComDroidkitActorsTasksTaskActor, requests_, JavaUtilHashSet *)
J2OBJC_FIELD_SETTER(ComDroidkitActorsTasksTaskActor, result_, id)

@interface ComDroidkitActorsTasksTaskActor_Error () {
 @public
  JavaLangThrowable *error_;
}
- (instancetype)initWithJavaLangThrowable:(JavaLangThrowable *)error;
@end

J2OBJC_FIELD_SETTER(ComDroidkitActorsTasksTaskActor_Error, error_, JavaLangThrowable *)

@interface ComDroidkitActorsTasksTaskActor_Result () {
 @public
  id res_;
}
- (instancetype)initWithId:(id)res;
@end

J2OBJC_FIELD_SETTER(ComDroidkitActorsTasksTaskActor_Result, res_, id)

@interface ComDroidkitActorsTasksTaskActor_Progress () {
 @public
  id progress_;
}
- (instancetype)initWithId:(id)progress;
@end

J2OBJC_FIELD_SETTER(ComDroidkitActorsTasksTaskActor_Progress, progress_, id)

@interface ComDroidkitActorsTasksTaskActor_Obsolete ()
- (instancetype)init;
@end

@interface ComDroidkitActorsTasksTaskActor_TaskListener () {
 @public
  jint requestId_;
  DAActorRef *sender_;
}
- (instancetype)initWithInt:(jint)requestId
             withDAActorRef:(DAActorRef *)sender;
@end

J2OBJC_FIELD_SETTER(ComDroidkitActorsTasksTaskActor_TaskListener, sender_, DAActorRef *)

@implementation ComDroidkitActorsTasksTaskActor

- (void)setTimeOutWithLong:(jlong)timeOut {
  dieTimeout_ = timeOut;
}

- (jboolean)isCompleted {
  return isCompleted__;
}

- (jboolean)isCompletedSuccess {
  return isCompletedSuccess__;
}

- (void)preStart {
  [((DAActorRef *) nil_chk([self self__])) sendWithId:[[[ComDroidkitActorsTasksMessagesTaskStart alloc] init] autorelease]];
}

- (void)onReceiveWithId:(id)message {
  if ([message isKindOfClass:[ComDroidkitActorsTasksMessagesTaskStart class]]) {
    [self startTask];
  }
  else if ([message isKindOfClass:[ComDroidkitActorsTasksTaskActor_Obsolete class]]) {
    [self onTaskObsolete];
    [((DAActorContext *) nil_chk([self context])) stopSelf];
  }
  else if ([message isKindOfClass:[ComDroidkitActorsTasksMessagesTaskRequest class]]) {
    ComDroidkitActorsTasksMessagesTaskRequest *request = (ComDroidkitActorsTasksMessagesTaskRequest *) check_class_cast(message, [ComDroidkitActorsTasksMessagesTaskRequest class]);
    if (isCompleted__) {
      if (isCompletedSuccess__) {
        [self replyWithId:result_];
      }
    }
    else {
      ComDroidkitActorsTasksTaskActor_TaskListener *listener = [[[ComDroidkitActorsTasksTaskActor_TaskListener alloc] initWithInt:[((ComDroidkitActorsTasksMessagesTaskRequest *) nil_chk(request)) getRequestId] withDAActorRef:[self sender]] autorelease];
      [((JavaUtilHashSet *) nil_chk(requests_)) addWithId:listener];
    }
  }
  else if ([message isKindOfClass:[ComDroidkitActorsTasksMessagesTaskCancel class]]) {
    ComDroidkitActorsTasksMessagesTaskCancel *cancel = (ComDroidkitActorsTasksMessagesTaskCancel *) check_class_cast(message, [ComDroidkitActorsTasksMessagesTaskCancel class]);
    if (isCompleted__) {
      return;
    }
    ComDroidkitActorsTasksTaskActor_TaskListener *listener = [[[ComDroidkitActorsTasksTaskActor_TaskListener alloc] initWithInt:[((ComDroidkitActorsTasksMessagesTaskCancel *) nil_chk(cancel)) getRequestId] withDAActorRef:[self sender]] autorelease];
    [((JavaUtilHashSet *) nil_chk(requests_)) removeWithId:listener];
    if ([requests_ size] == 0) {
      [((DAActorRef *) nil_chk([self self__])) sendOnceWithId:[[[ComDroidkitActorsTasksTaskActor_Obsolete alloc] init] autorelease] withLong:dieTimeout_];
    }
  }
  else if ([message isKindOfClass:[ComDroidkitActorsTasksTaskActor_Progress class]]) {
    ComDroidkitActorsTasksTaskActor_Progress *progress = (ComDroidkitActorsTasksTaskActor_Progress *) check_class_cast(message, [ComDroidkitActorsTasksTaskActor_Progress class]);
    if (!isCompleted__) {
      for (ComDroidkitActorsTasksTaskActor_TaskListener * __strong request in nil_chk(requests_)) {
        [((DAActorRef *) nil_chk([((ComDroidkitActorsTasksTaskActor_TaskListener *) nil_chk(request)) getSender])) sendWithId:[[[ComDroidkitActorsTasksMessagesTaskProgress alloc] initWithInt:[request getRequestId] withId:((ComDroidkitActorsTasksTaskActor_Progress *) nil_chk(progress))->progress_] autorelease]];
      }
    }
  }
  else if ([message isKindOfClass:[ComDroidkitActorsTasksTaskActor_Result class]]) {
    if (!isCompleted__) {
      ComDroidkitActorsTasksTaskActor_Result *res = (ComDroidkitActorsTasksTaskActor_Result *) check_class_cast(message, [ComDroidkitActorsTasksTaskActor_Result class]);
      isCompleted__ = YES;
      isCompletedSuccess__ = YES;
      ComDroidkitActorsTasksTaskActor_set_result_(self, (id) [((ComDroidkitActorsTasksTaskActor_Result *) nil_chk(res)) getRes]);
      for (ComDroidkitActorsTasksTaskActor_TaskListener * __strong request in nil_chk(requests_)) {
        [((DAActorRef *) nil_chk([((ComDroidkitActorsTasksTaskActor_TaskListener *) nil_chk(request)) getSender])) sendWithId:[[[ComDroidkitActorsTasksMessagesTaskResult alloc] initWithInt:[request getRequestId] withId:result_] autorelease]];
      }
      [((DAActorRef *) nil_chk([self self__])) sendWithId:ComDroidkitActorsMessagesPoisonPill_get_INSTANCE_() withLong:dieTimeout_];
    }
  }
  else if ([message isKindOfClass:[ComDroidkitActorsTasksTaskActor_Error class]]) {
    if (!isCompleted__) {
      isCompleted__ = YES;
      ComDroidkitActorsTasksTaskActor_Error *error = (ComDroidkitActorsTasksTaskActor_Error *) check_class_cast(message, [ComDroidkitActorsTasksTaskActor_Error class]);
      for (ComDroidkitActorsTasksTaskActor_TaskListener * __strong request in nil_chk(requests_)) {
        [((DAActorRef *) nil_chk([((ComDroidkitActorsTasksTaskActor_TaskListener *) nil_chk(request)) getSender])) sendWithId:[[[ComDroidkitActorsTasksMessagesTaskError alloc] initWithInt:[request getRequestId] withJavaLangThrowable:[((ComDroidkitActorsTasksTaskActor_Error *) nil_chk(error)) getError]] autorelease]];
      }
      [((DAActorContext *) nil_chk([self context])) stopSelf];
    }
  }
}

- (void)postStop {
}

- (void)startTask {
  // can't call an abstract method
  [self doesNotRecognizeSelector:_cmd];
}

- (void)onTaskObsolete {
}

- (void)completeWithId:(id)res {
  [((DAActorRef *) nil_chk([self self__])) sendWithId:[[[ComDroidkitActorsTasksTaskActor_Result alloc] initWithId:res] autorelease]];
}

- (void)errorWithJavaLangThrowable:(JavaLangThrowable *)t {
  [((DAActorRef *) nil_chk([self self__])) sendWithId:[[[ComDroidkitActorsTasksTaskActor_Error alloc] initWithJavaLangThrowable:t] autorelease]];
}

- (void)progressWithId:(id)progress {
  [((DAActorRef *) nil_chk([self self__])) sendWithId:[[[ComDroidkitActorsTasksTaskActor_Progress alloc] initWithId:progress] autorelease]];
}

- (instancetype)init {
  if (self = [super init]) {
    ComDroidkitActorsTasksTaskActor_setAndConsume_requests_(self, [[JavaUtilHashSet alloc] init]);
    dieTimeout_ = 300;
  }
  return self;
}

- (void)dealloc {
  RELEASE_(requests_);
  RELEASE_(result_);
  [super dealloc];
}

- (void)copyAllFieldsTo:(ComDroidkitActorsTasksTaskActor *)other {
  [super copyAllFieldsTo:other];
  ComDroidkitActorsTasksTaskActor_set_requests_(other, requests_);
  ComDroidkitActorsTasksTaskActor_set_result_(other, result_);
  other->isCompleted__ = isCompleted__;
  other->isCompletedSuccess__ = isCompletedSuccess__;
  other->dieTimeout_ = dieTimeout_;
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "setTimeOutWithLong:", "setTimeOut", "V", 0x1, NULL },
    { "isCompleted", NULL, "Z", 0x1, NULL },
    { "isCompletedSuccess", NULL, "Z", 0x1, NULL },
    { "preStart", NULL, "V", 0x1, NULL },
    { "onReceiveWithId:", "onReceive", "V", 0x1, NULL },
    { "postStop", NULL, "V", 0x1, NULL },
    { "startTask", NULL, "V", 0x401, NULL },
    { "onTaskObsolete", NULL, "V", 0x1, NULL },
    { "completeWithId:", "complete", "V", 0x1, NULL },
    { "errorWithJavaLangThrowable:", "error", "V", 0x1, NULL },
    { "progressWithId:", "progress", "V", 0x1, NULL },
    { "init", NULL, NULL, 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "requests_", NULL, 0x12, "Ljava.util.HashSet;", NULL,  },
    { "result_", NULL, 0x2, "TT;", NULL,  },
    { "isCompleted__", "isCompleted", 0x2, "Z", NULL,  },
    { "isCompletedSuccess__", "isCompletedSuccess", 0x2, "Z", NULL,  },
    { "dieTimeout_", NULL, 0x2, "J", NULL,  },
  };
  static const J2ObjcClassInfo _ComDroidkitActorsTasksTaskActor = { 1, "TaskActor", "com.droidkit.actors.tasks", NULL, 0x401, 12, methods, 5, fields, 0, NULL};
  return &_ComDroidkitActorsTasksTaskActor;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComDroidkitActorsTasksTaskActor)

@implementation ComDroidkitActorsTasksTaskActor_Error

- (instancetype)initWithJavaLangThrowable:(JavaLangThrowable *)error {
  if (self = [super init]) {
    ComDroidkitActorsTasksTaskActor_Error_set_error_(self, error);
  }
  return self;
}

- (JavaLangThrowable *)getError {
  return error_;
}

- (void)dealloc {
  RELEASE_(error_);
  [super dealloc];
}

- (void)copyAllFieldsTo:(ComDroidkitActorsTasksTaskActor_Error *)other {
  [super copyAllFieldsTo:other];
  ComDroidkitActorsTasksTaskActor_Error_set_error_(other, error_);
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithJavaLangThrowable:", "Error", NULL, 0x2, NULL },
    { "getError", NULL, "Ljava.lang.Throwable;", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "error_", NULL, 0x2, "Ljava.lang.Throwable;", NULL,  },
  };
  static const J2ObjcClassInfo _ComDroidkitActorsTasksTaskActor_Error = { 1, "Error", "com.droidkit.actors.tasks", "TaskActor", 0xa, 2, methods, 1, fields, 0, NULL};
  return &_ComDroidkitActorsTasksTaskActor_Error;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComDroidkitActorsTasksTaskActor_Error)

@implementation ComDroidkitActorsTasksTaskActor_Result

- (instancetype)initWithId:(id)res {
  if (self = [super init]) {
    ComDroidkitActorsTasksTaskActor_Result_set_res_(self, res);
  }
  return self;
}

- (id)getRes {
  return res_;
}

- (void)dealloc {
  RELEASE_(res_);
  [super dealloc];
}

- (void)copyAllFieldsTo:(ComDroidkitActorsTasksTaskActor_Result *)other {
  [super copyAllFieldsTo:other];
  ComDroidkitActorsTasksTaskActor_Result_set_res_(other, res_);
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithId:", "Result", NULL, 0x2, NULL },
    { "getRes", NULL, "Ljava.lang.Object;", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "res_", NULL, 0x2, "Ljava.lang.Object;", NULL,  },
  };
  static const J2ObjcClassInfo _ComDroidkitActorsTasksTaskActor_Result = { 1, "Result", "com.droidkit.actors.tasks", "TaskActor", 0xa, 2, methods, 1, fields, 0, NULL};
  return &_ComDroidkitActorsTasksTaskActor_Result;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComDroidkitActorsTasksTaskActor_Result)

@implementation ComDroidkitActorsTasksTaskActor_Progress

- (instancetype)initWithId:(id)progress {
  if (self = [super init]) {
    ComDroidkitActorsTasksTaskActor_Progress_set_progress_(self, progress);
  }
  return self;
}

- (id)getProgress {
  return progress_;
}

- (void)dealloc {
  RELEASE_(progress_);
  [super dealloc];
}

- (void)copyAllFieldsTo:(ComDroidkitActorsTasksTaskActor_Progress *)other {
  [super copyAllFieldsTo:other];
  ComDroidkitActorsTasksTaskActor_Progress_set_progress_(other, progress_);
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithId:", "Progress", NULL, 0x2, NULL },
    { "getProgress", NULL, "Ljava.lang.Object;", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "progress_", NULL, 0x2, "Ljava.lang.Object;", NULL,  },
  };
  static const J2ObjcClassInfo _ComDroidkitActorsTasksTaskActor_Progress = { 1, "Progress", "com.droidkit.actors.tasks", "TaskActor", 0xa, 2, methods, 1, fields, 0, NULL};
  return &_ComDroidkitActorsTasksTaskActor_Progress;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComDroidkitActorsTasksTaskActor_Progress)

@implementation ComDroidkitActorsTasksTaskActor_Obsolete

- (instancetype)init {
  return [super init];
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "init", NULL, NULL, 0x2, NULL },
  };
  static const J2ObjcClassInfo _ComDroidkitActorsTasksTaskActor_Obsolete = { 1, "Obsolete", "com.droidkit.actors.tasks", "TaskActor", 0xa, 1, methods, 0, NULL, 0, NULL};
  return &_ComDroidkitActorsTasksTaskActor_Obsolete;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComDroidkitActorsTasksTaskActor_Obsolete)

@implementation ComDroidkitActorsTasksTaskActor_TaskListener

- (instancetype)initWithInt:(jint)requestId
             withDAActorRef:(DAActorRef *)sender {
  if (self = [super init]) {
    self->requestId_ = requestId;
    ComDroidkitActorsTasksTaskActor_TaskListener_set_sender_(self, sender);
  }
  return self;
}

- (jint)getRequestId {
  return requestId_;
}

- (DAActorRef *)getSender {
  return sender_;
}

- (jboolean)isEqual:(id)o {
  if (self == o) return YES;
  if (o == nil || [self getClass] != [o getClass]) return NO;
  ComDroidkitActorsTasksTaskActor_TaskListener *that = (ComDroidkitActorsTasksTaskActor_TaskListener *) check_class_cast(o, [ComDroidkitActorsTasksTaskActor_TaskListener class]);
  if (requestId_ != ((ComDroidkitActorsTasksTaskActor_TaskListener *) nil_chk(that))->requestId_) return NO;
  if (![((DAActorRef *) nil_chk(sender_)) isEqual:that->sender_]) return NO;
  return YES;
}

- (NSUInteger)hash {
  jint result = requestId_;
  result = 31 * result + ((jint) [((DAActorRef *) nil_chk(sender_)) hash]);
  return result;
}

- (void)dealloc {
  RELEASE_(sender_);
  [super dealloc];
}

- (void)copyAllFieldsTo:(ComDroidkitActorsTasksTaskActor_TaskListener *)other {
  [super copyAllFieldsTo:other];
  other->requestId_ = requestId_;
  ComDroidkitActorsTasksTaskActor_TaskListener_set_sender_(other, sender_);
}

+ (const J2ObjcClassInfo *)__metadata {
  static const J2ObjcMethodInfo methods[] = {
    { "initWithInt:withDAActorRef:", "TaskListener", NULL, 0x2, NULL },
    { "getRequestId", NULL, "I", 0x1, NULL },
    { "getSender", NULL, "Lcom.droidkit.actors.ActorRef;", 0x1, NULL },
    { "isEqual:", "equals", "Z", 0x1, NULL },
    { "hash", "hashCode", "I", 0x1, NULL },
  };
  static const J2ObjcFieldInfo fields[] = {
    { "requestId_", NULL, 0x2, "I", NULL,  },
    { "sender_", NULL, 0x2, "Lcom.droidkit.actors.ActorRef;", NULL,  },
  };
  static const J2ObjcClassInfo _ComDroidkitActorsTasksTaskActor_TaskListener = { 1, "TaskListener", "com.droidkit.actors.tasks", "TaskActor", 0xa, 5, methods, 2, fields, 0, NULL};
  return &_ComDroidkitActorsTasksTaskActor_TaskListener;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(ComDroidkitActorsTasksTaskActor_TaskListener)