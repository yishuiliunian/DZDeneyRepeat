//
//  DZDeneyRepeatInjection.h
//  Pods
//
//  Created by stonedong on 8/17/16.
//
//

#import <UIKit/UIKit.h>

@interface DZDeneyRepeatInjection : UIControl
@property (nonatomic, assign) float denyRepeatTime;
@end

DZDeneyRepeatInjection* DZInjectionDeneyRepeatLogic(UIControl* object, float deneyTime);
