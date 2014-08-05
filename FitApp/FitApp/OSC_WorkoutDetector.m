//
//  OSC_WorkoutDetector.m
//  FitApp
//
//  Created by MAC-04 on 21/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_WorkoutDetector.h"

#define RADIANS_TO_DEGREES(radians) ((radians) * (180.0 / M_PI))

@implementation OSC_WorkoutDetector

@synthesize absC, pushupsC , pullupsC , jumpsC;
@synthesize accX, accY, accZ, gravityX, gravityY, gravityZ;
@synthesize wrkc;


float angle;
float norme;
bool start = false;
int timeElapsed = 0 ;


bool mutex=false;
bool min=false;
bool max=false;



-(id)initWithPushups:(int)pushupsCounter{
    
    absC = 0 ;
    pushupsC = 0 ;
    pullupsC = 0 ;
    jumpsC = 0 ;
    
    gravityX = 0 ;
    gravityY = 0 ;
    gravityZ = 0 ;
    
    wrkc = [[OSC_WorkoutCoach alloc] init];
    return self;
}

-(int)absCounterWithAccX:(float)ax
                 AndAccY:(float)ay
                 AndAccZ:(float)az{
    
    
    NSLog(@"IN ABS METHOD");
    [self setGravityValuesWithAccX:ax AndAccY:ay AndAccZ:az];
    
    angle =acos(ax);
    angle = RADIANS_TO_DEGREES(angle);
    
    NSLog([NSString stringWithFormat:@"%f",angle]);
    NSLog([NSString stringWithFormat:@"%f",az]);
    
    if(start == true){
        
        timeElapsed ++;
        NSLog([NSString stringWithFormat:@"%i",timeElapsed]);
    }
    
    
    if((angle > 89) && (angle < 93) && (start == false) && (az < (-10))){
        NSLog(@"START ABS");
        start = true;
    }
    else if ((angle > 174) && (start == true) && (az > 9 )){
        
        if((timeElapsed > 7)){
            absC++;
            wrkc = [[OSC_WorkoutCoach alloc] init];
            [wrkc toSpeechWithNumber:absC];
        }
        start = false;
        timeElapsed = 0;
    }
    
    
    
    return abs;
}
-(int)pushupsCounter{
    pushupsC++;
    wrkc = [[OSC_WorkoutCoach alloc] init];
    [wrkc toSpeechWithNumber:pushupsC];
    return pushupsC;
}


-(int)pullupsCounterWithAccX:(float)ax
                     AndAccY:(float)ay
                     AndAccZ:(float)az{
    
    norme = sqrt((ax*ax)+(ay*ay)+(az*az));
    CFTimeInterval startTime = CACurrentMediaTime();
    CFTimeInterval elapsedTime = CACurrentMediaTime() - startTime;
    
    while (elapsedTime < 0.02 ) {
        elapsedTime = CACurrentMediaTime() - startTime;
    }
    
    
    if ( norme<=0.4) {
        min=true;
    }
    
    
    
    if (min==true ) {
        if( norme>=1) {
            NSLog(@"Norme > 12 !!");
            max=true;
        }
    }
    
    if(min && max){
        
        pullupsC++;
        wrkc = [[OSC_WorkoutCoach alloc] init];
        [wrkc toSpeechWithNumber:pullupsC];
        min=max=false;
        
    }
    
    
    
    return pullupsC;
}


-(int)jumpCounterWithAccX:(float)ax
                  AndAccY:(float)ay
                  AndAccZ:(float)az{
    
    
    
    norme = sqrt((ax*ax)+(ay*ay)+(az*az));
    
    
    if ( norme <= 0.7) {
        min=true;
    }
    
    if (min==true ) {
        if( norme >= 2) {
            max=true;
        }
    }
    
    
    if(min && max ){
        jumpsC++;
        wrkc = [[OSC_WorkoutCoach alloc] init];
        [wrkc toSpeechWithNumber:jumpsC];
        min=max=false;
        
    }
    
    
    
    return jumpsC;
}


-(void)setGravityValuesWithAccX:(int)ax
                        AndAccY:(int)ay
                        AndAccZ:(int)az{
    
    self.gravityX = (float) (0.1 * ax + 0.9 * gravityX);
    self.gravityY = (float) (0.1 * ay + 0.9 * gravityY);
    self.gravityZ = (float) (0.1 * az + 0.9 * gravityZ);
}



@end
