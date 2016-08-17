//
//  DZDeneyRepeatInjection.m
//  Pods
//
//  Created by stonedong on 8/17/16.
//
//

#import "DZDeneyRepeatInjection.h"
#import <objc/runtime.h>
#import <MRLogicInjection/MRLogicInjection.h>

DZDeneyRepeatInjection* DZInjectionDeneyRepeatLogic(UIControl* object, float deneyTime)
{
    DZDeneyRepeatInjection* deney = MRExtendInstanceLogic(object, @[DZDeneyRepeatInjection.class]);
    if ([deney respondsToSelector:@selector(setDenyRepeatTime:)]) {
        [deney setDenyRepeatTime:deneyTime];
    }
    return deney;
}

static void* kDZDeneyRepeatTimeKey = &kDZDeneyRepeatTimeKey;
@implementation DZDeneyRepeatInjection

- (void) setDenyRepeatTime:(float)denyRepeatTime
{
    objc_setAssociatedObject(self, kDZDeneyRepeatTimeKey, @(denyRepeatTime), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (float) denyRepeatTime
{
    NSNumber* num = objc_getAssociatedObject(self, kDZDeneyRepeatTimeKey);
    if (!num) {
        return 0.0f;
    }
    return [num floatValue];
}
- (void) sendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    [super sendAction:action to:target forEvent:event];
    if (self.denyRepeatTime > 0.00001) {
        self.userInteractionEnabled = NO;
        __weak typeof(self) weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.denyRepeatTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.userInteractionEnabled = YES;
        });
    }
}
@end
