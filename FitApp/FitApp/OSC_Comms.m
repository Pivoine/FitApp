//
//  OSC_Comms.m
//  FitApp
//
//  Created by MAC-08 on 16/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_Comms.h"
#import <Parse/Parse.h>
#import "NSOperationQueue+SharedQueue.h"
#import "osc_AppDelegate.h"
#import "OSC_LoginPlist.h"

@implementation OSC_Comms
NSString * const N_ProfilePictureLoaded = @"N_ProfilePictureLoaded";
+ (void) login:(id<CommsDelegate>)delegate
{
	// Basic User information and your friends are part of the standard permissions
	// so there is no reason to ask for additional permissions
	[PFFacebookUtils logInWithPermissions:nil block:^(PFUser *user, NSError *error) {
		// Was login successful ?
		if (!user) {
			if (!error) {
                NSLog(@"The user cancelled the Facebook login.");
            } else {
                NSLog(@"An error occurred: %@", error.localizedDescription);
            }
            
			// Callback - login failed
			if ([delegate respondsToSelector:@selector(commsDidLogin:)]) {
				[delegate commsDidLogin:NO];
			}
		} else {
			if (user.isNew) {
				NSLog(@"User signed up and logged in through Facebook!");
                OSC_LoginPlist *plist=[[OSC_LoginPlist alloc] init];
                [plist writeTextSizeWithint:0];
			} else {
				NSLog(@"User logged in through Facebook!");
			}
            
			[FBRequestConnection startForMeWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                if (!error) {
                    NSDictionary<FBGraphUser> *me = (NSDictionary<FBGraphUser> *)result;
                    // Store the Facebook Id
                    [[PFUser currentUser] setObject:me.id forKey:@"fbId"];
                    [[PFUser currentUser] saveInBackground];
                    // Launch another thread to handle the download of the user's Facebook profile picture
                    [[NSOperationQueue profilePictureOperationQueue] addOperationWithBlock:^ {
                        // Build a profile picture URL from the user's Facebook user id
                        NSString *profilePictureURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", me.id];
                        NSData *profilePictureData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profilePictureURL]];
                        UIImage *profilePicture = [UIImage imageWithData:profilePictureData];
                        NSLog(@"URL Profile picture  :%@ ",profilePictureURL);
                        // Set the profile picture into the user object
                        if (profilePicture) [me setObject:profilePicture forKey:@"fbProfilePicture"];
                        
                        // Notify that the profile picture has been downloaded, using NSNotificationCenter
                        [[NSNotificationCenter defaultCenter] postNotificationName:N_ProfilePictureLoaded object:nil];
                    }];
                    // Add the User to the list of friends in the DataStore
                    [[OSC_DataStore instance].fbFriends setObject:me forKey:me.id];
                }
                
                // 1
                FBRequest *friendsRequest = [FBRequest requestForMyFriends];
                [friendsRequest startWithCompletionHandler: ^(FBRequestConnection *connection,
                                                              NSDictionary* result,
                                                              NSError *error) {
                    // 2
                    NSArray *friends = result[@"data"];
                    for (NSDictionary<FBGraphUser>* friend in friends) {
                        NSLog(@"Found a friend: %@", friend.name);
                        // Launch another thread to handle the download of the friend's Facebook profile picture
                        [[NSOperationQueue profilePictureOperationQueue] addOperationWithBlock:^ {
                            // Build a profile picture URL from the friend's Facebook user id
                            NSString *profilePictureURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture", friend.id];
                            NSData *profilePictureData = [NSData dataWithContentsOfURL:[NSURL URLWithString:profilePictureURL]];
                            UIImage *profilePicture = [UIImage imageWithData:profilePictureData];
                            
                            // Set the profile picture into the user object
                            if (profilePicture) [friend setObject:profilePicture forKey:@"fbProfilePicture"];
                            
                            // Notify that the profile picture has been downloaded, using NSNotificationCenter
                            [[NSNotificationCenter defaultCenter] postNotificationName:N_ProfilePictureLoaded object:nil];
                        }];
                        
                        // 3
                        // Add the friend to the list of friends in the DataStore
                        [[OSC_DataStore instance].fbFriends setObject:friend forKey:friend.id];
                    }
                    
                    // 4
                    // Callback - login successful
                    if ([delegate respondsToSelector:@selector(commsDidLogin:)]) {
                        [delegate commsDidLogin:YES];
                    }
                }];
            }];
		}
	}];
}
@end
