//
//  OSC_WorkoutDetector.h
//  FitApp
//
//  Created by MAC-04 on 21/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OSC_WorkoutCoach.h"
#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

@interface OSC_WorkoutDetector : NSObject

@property float accX, accY, accZ;
@property float gravityX, gravityY, gravityZ;
@property OSC_WorkoutCoach *wrkc;
@property int absC, pushupsC, pullupsC, jumpsC;


-(id)initWithPushups:(int)pushupsCounter;
-(int)absCounterWithAccX:(float)ax
                 AndAccY:(float)ay
                 AndAccZ:(float)az;
-(int)pushupsCounter;
-(int)pullupsCounterWithAccX:(float)ax
                     AndAccY:(float)ay
                     AndAccZ:(float)az;
-(int)jumpCounterWithAccX:(float)ax
                  AndAccY:(float)ay
                  AndAccZ:(float)az;


@end
