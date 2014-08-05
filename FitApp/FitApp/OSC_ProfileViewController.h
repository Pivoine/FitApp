//
//  OSC_ProfileViewController.h
//  FitApp
//
//  Created by MAC-08 on 18/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UITableView+DataSourceBlocks.h"
#import <Parse/Parse.h>
@class TableViewWithBlock;
@interface OSC_ProfileViewController : UIViewController{
    BOOL isOpened;
}



@property (weak, nonatomic) IBOutlet UIImageView *profilePicture;
@property (weak, nonatomic) IBOutlet UILabel *nom;
@property (weak, nonatomic) IBOutlet UILabel *prenom;
@property (weak, nonatomic) IBOutlet UITextField *taille;
@property (weak, nonatomic) IBOutlet UITextField *poids;
@property (weak, nonatomic) IBOutlet UILabel *imc;
@property (weak, nonatomic) IBOutlet UILabel *img;
@property (retain, nonatomic) IBOutlet UIButton *openButton;
@property (retain, nonatomic) IBOutlet UITextField *inputTextField;
@property (retain, nonatomic) IBOutlet TableViewWithBlock *tb;
@property (weak, nonatomic) IBOutlet UILabel *statut;
- (IBAction)changeOpenStatus:(id)sender;
@property (weak, nonatomic) IBOutlet UITextField *age;

@end

