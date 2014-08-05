//
//  OSC_User.h
//  FitApp
//
//  Created by MAC-04 on 10/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OSC_User : NSObject

@property (nonatomic, assign) NSString *id;
@property (nonatomic, assign) NSString *username;
@property (nonatomic, assign) NSString *password;
@property (nonatomic, assign) NSString *email;
@property (nonatomic, assign) int *age;
@property (nonatomic, assign) double *height;
@property (nonatomic, assign) double *weight;
@property (nonatomic, assign) NSString *language;
@property (nonatomic, assign) Boolean *visibility;
@property (nonatomic, assign) NSString *location;

- (id)initWithUsername:(NSString*)ausername
                password:(NSString*)apassword
                email:(NSString*)anemail
                age:(int*)anage
                height:(double*)aheight
                weight:(double*)aweight
                language:(NSString*)alanguage
                visibility:(Boolean*)avisibility
                location:(NSString*)alocation;





@end
