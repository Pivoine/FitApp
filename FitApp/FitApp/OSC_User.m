//
//  OSC_User.m
//  FitApp
//
//  Created by MAC-04 on 10/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_User.h"

@implementation OSC_User

@synthesize id, username, password, email, age, height, weight, language, visibility, location;

- (id)initWithUsername:(NSString*)ausername
              password:(NSString*)apassword
                 email:(NSString*)anemail
                   age:(int*)anage
                height:(double*)aheight
                weight:(double*)aweight
              language:(NSString*)alanguage
            visibility:(Boolean*)avisibility
              location:(NSString*)alocation
{
    
    self.username = ausername;
    self.password = apassword;
    self.email = anemail;
    self.age = anage;
    self.height = aheight;
    self.weight = aweight;
    self.language = alanguage;
    self.visibility = avisibility;
    self.location = alocation;
    
    return self;
}




@end
