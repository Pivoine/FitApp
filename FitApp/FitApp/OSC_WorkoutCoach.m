//
//  OSC_WorkoutCoach.m
//  FitApp
//
//  Created by MAC-04 on 22/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_WorkoutCoach.h"
#import <math.h>

@implementation OSC_WorkoutCoach

@synthesize synth;

double COACHING_PERIOD = 10;

-(id)init{

    synth = [[AVSpeechSynthesizer alloc] init];
    
    return self;

}

-(void)toSpeechWithNumber:(int)number{
    
    if(fmod(number,10) == 0){
        
        [self toSpeechWithText:[NSString stringWithFormat:@"%d ... %@", number, @"Bravo, allez continue"]];
        
     
       
}
    else{
    
    
    [self toSpeechWithText:[NSString stringWithFormat:@"%d", number]];
    
    }
}


-(void)toSpeechWithText:(NSString*)text{
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:text];
    utterance.rate = 0.2;
    utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"fr-FR"];
    [self.synth speakUtterance:utterance];

}






@end
