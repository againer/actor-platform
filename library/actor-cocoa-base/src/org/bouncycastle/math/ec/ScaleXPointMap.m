//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: /Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/math/ec/ScaleXPointMap.java
//

#line 1 "/Users/ex3ndr/Develop/actor-model/library/actor-cocoa-base/build/java/org/bouncycastle/math/ec/ScaleXPointMap.java"

#include "J2ObjC_source.h"
#include "org/bouncycastle/math/ec/ECFieldElement.h"
#include "org/bouncycastle/math/ec/ECPoint.h"
#include "org/bouncycastle/math/ec/ScaleXPointMap.h"


#line 3
@implementation OrgBouncycastleMathEcScaleXPointMap


#line 7
- (instancetype)initWithOrgBouncycastleMathEcECFieldElement:(OrgBouncycastleMathEcECFieldElement *)scale_ {
  if (self = [super init]) {
    
#line 9
    self->scale__ = scale_;
  }
  return self;
}


#line 12
- (OrgBouncycastleMathEcECPoint *)mapWithOrgBouncycastleMathEcECPoint:(OrgBouncycastleMathEcECPoint *)p {
  
#line 14
  return [((OrgBouncycastleMathEcECPoint *) nil_chk(p)) scaleXWithOrgBouncycastleMathEcECFieldElement:scale__];
}

- (void)copyAllFieldsTo:(OrgBouncycastleMathEcScaleXPointMap *)other {
  [super copyAllFieldsTo:other];
  other->scale__ = scale__;
}

@end

J2OBJC_CLASS_TYPE_LITERAL_SOURCE(OrgBouncycastleMathEcScaleXPointMap)