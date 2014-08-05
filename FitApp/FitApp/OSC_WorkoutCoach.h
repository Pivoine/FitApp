//
//  OSC_WorkoutCoach.h
//  FitApp
//
//  Created by MAC-04 on 22/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface OSC_WorkoutCoach : NSObject

@property AVSpeechSynthesizer *synth;


-(id)init;

-(void)toSpeechWithNumber:(int)text;
-(void)toSpeechWithText:(NSString*)text;
@end
