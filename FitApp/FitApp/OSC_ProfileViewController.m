//
//  OSC_ProfileViewController.m
//  FitApp
//
//  Created by MAC-08 on 18/07/2014.
//  Copyright (c) 2014 MAC-04. All rights reserved.
//

#import "OSC_ProfileViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "SelectionCell.h"
#import "UITableView+DataSourceBlocks.h"
#import "TableViewWithBlock.h"
#import "OSC_IUserManager.h"
#import "OSC_UserManager.h"

@interface OSC_ProfileViewController ()<CommsDelegate>
{
    
}


@end

@implementation OSC_ProfileViewController

int sexe=-1;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *dropdown = [NSArray arrayWithObjects:@"Homme",@"Femme", nil];
    NSArray *meAndMyFriends = [OSC_DataStore instance].fbFriends.allKeys;
    NSDictionary<FBGraphUser> *user = [[OSC_DataStore instance].fbFriends objectForKey:meAndMyFriends[meAndMyFriends.count-1]];
    
	[_profilePicture setImage:user[@"fbProfilePicture"]];
	[_nom setText:user.last_name];
    [_prenom setText:user.first_name];
    [_age setText: user.birthday];
    
    isOpened=NO;
   /* [_tb initTableViewDataSourceAndDelegate:^(UITableView *tableView,NSInteger section){
        return 2;
        
    } setCellForIndexPathBlock:^(UITableView *tableView,NSIndexPath *indexPath){
        SelectionCell *cell=[tableView dequeueReusableCellWithIdentifier:@"SelectionCell"];
        if (!cell) {
            cell=[[[NSBundle mainBundle]loadNibNamed:@"SelectionCell" owner:self options:nil]objectAtIndex:0];
            [cell setSelectionStyle:UITableViewCellSelectionStyleGray];
        }
        [cell.lb setText:dropdown[indexPath.row]];
        return cell;
    } setDidSelectRowBlock:^(UITableView *tableView,NSIndexPath *indexPath){
        SelectionCell *cell=(SelectionCell*)[tableView cellForRowAtIndexPath:indexPath];
        NSLog(@" SELECTED %li ", (long)indexPath.row );
        sexe=indexPath.row;
        if ([_imc.text intValue] >0 ) {
            _img.text =[ NSString stringWithFormat:@"%.2f",(1.2 * [_imc.text intValue]) + (0.23 * [_age.text intValue]) - (10.8 * sexe) - 5.4];
        }
        _inputTextField.text=cell.lb.text;
        [_openButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    }];
    
    [_tb.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_tb.layer setBorderWidth:1];
*/
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)taillEdit:(id)sender {
    if (_taille.text.length >0 & _poids.text.length > 0) {
        float taille =[_taille.text floatValue]/100.0;
        taille= taille*taille;
        _imc.text= [NSString stringWithFormat:@"%.2f",[_poids.text floatValue]/(float)taille];
     
        if ([_imc.text intValue]<16.5) {
            _statut.text=@"dénutrition ou famine";
        }
        else if ([_imc.text intValue]>16.5 & [_imc.text intValue]<18.5){
            _statut.text=@"maigreur";
        }
        else if ([_imc.text intValue]>18.5 & [_imc.text intValue]<25){
            _statut.text=@"corpulence normale";
        }
        else if ([_imc.text intValue]>25 & [_imc.text intValue]<30){
            _statut.text=@"surpoids";
        }
        else if ([_imc.text intValue]>30 & [_imc.text intValue]<35){
            _statut.text=@"obésité modérée";
        }
        else if ([_imc.text intValue]>35 & [_imc.text intValue]<40){
            _statut.text=@"obésité sévere";
        }
        else{
            _statut.text=@"obésité massive";
        }
        if (sexe!= -1) {
            if ([_imc.text intValue] >0 & [_age.text intValue]> 0) {
                _img.text =[ NSString stringWithFormat:@"%.2f",(1.2 * [_imc.text intValue]) + (0.23 * [_age.text intValue]) - (10.8 * sexe) - 5.4];
            }
            
        }
       
    }
}

- (IBAction)poidsEdit:(id)sender {
    if (_taille.text.length >0 & _poids.text.length > 0) {
        float taille =[_taille.text floatValue]/100.0;
        taille= taille*taille;
        _imc.text= [NSString stringWithFormat:@"%.2f",[_poids.text floatValue]/(float)taille];
        
        if ([_imc.text intValue]<16.5) {
            _statut.text=@"dénutrition ou famine";
        }
        else if ([_imc.text intValue]>16.5 & [_imc.text intValue]<18.5){
            _statut.text=@"maigreur";
        }
        else if ([_imc.text intValue]>18.5 & [_imc.text intValue]<25){
            _statut.text=@"corpulence normale";
        }
        else if ([_imc.text intValue]>25 & [_imc.text intValue]<30){
            _statut.text=@"surpoids";
        }
        else if ([_imc.text intValue]>30 & [_imc.text intValue]<35){
            _statut.text=@"obésité modérée";
        }
        else if ([_imc.text intValue]>35 & [_imc.text intValue]<40){
            _statut.text=@"obésité sévere";
        }
        else{
            _statut.text=@"obésité massive";
        }
        if (sexe!= -1) {
            if ([_imc.text intValue] >0 & [_age.text intValue]> 0) {
                _img.text =[ NSString stringWithFormat:@"%.2f",(1.2 * [_imc.text intValue]) + (0.23 * [_age.text intValue]) - (10.8 * sexe) - 5.4];
            }

        }
        
    }
}
- (IBAction)AgeChange:(id)sender {
    if (_taille.text.length >0 & _poids.text.length > 0) {
        float taille =[_taille.text floatValue]/100.0;
        taille= taille*taille;
        _imc.text= [NSString stringWithFormat:@"%.2f",[_poids.text floatValue]/(float)taille];
        
        if ([_imc.text intValue]<16.5) {
            _statut.text=@"dénutrition ou famine";
        }
        else if ([_imc.text intValue]>16.5 & [_imc.text intValue]<18.5){
            _statut.text=@"maigreur";
        }
        else if ([_imc.text intValue]>18.5 & [_imc.text intValue]<25){
            _statut.text=@"corpulence normale";
        }
        else if ([_imc.text intValue]>25 & [_imc.text intValue]<30){
            _statut.text=@"surpoids";
        }
        else if ([_imc.text intValue]>30 & [_imc.text intValue]<35){
            _statut.text=@"obésité modérée";
        }
        else if ([_imc.text intValue]>35 & [_imc.text intValue]<40){
            _statut.text=@"obésité sévere";
        }
        else{
            _statut.text=@"obésité massive";
        }
        if (sexe!= -1) {
            if ([_imc.text intValue] >0 & [_age.text intValue]> 0) {
                _img.text =[ NSString stringWithFormat:@"%2.f",(1.2 * [_imc.text intValue]) + (0.23 * [_age.text intValue]) - (10.8 * sexe) - 5.4];
            }
            
        }
        
    }

}
- (IBAction)changeOpenStatus:(id)sender {
    
    if (isOpened) {
        
        
        
        [UIView animateWithDuration:0.3 animations:^{
            UIImage *closeImage=[UIImage imageNamed:@"dropdown.png"];
            [_openButton setImage:closeImage forState:UIControlStateNormal];
            
            CGRect frame=_tb.frame;
            
            frame.size.height=1;
            [_tb setFrame:frame];
            
        } completion:^(BOOL finished){
            
            isOpened=NO;
        }];
    }else{
        
        
        [UIView animateWithDuration:0.3 animations:^{
            UIImage *openImage=[UIImage imageNamed:@"dropup.png"];
            [_openButton setImage:openImage forState:UIControlStateNormal];
            
            CGRect frame=_tb.frame;
            
            frame.size.height=200;
            [_tb setFrame:frame];
        } completion:^(BOOL finished){
            
            isOpened=YES;
        }];
        
        
    }
    
}

- (IBAction)saveUser:(id)sender {
    
    if (_age.text.length >0 & _taille.text.length >0 & _poids.text.length >0)
    {
        NSLog(@" je suis icicici");
        OSC_IUserManager *manager = [[OSC_UserManager alloc] init];
        PFUser *user = [manager getcurrentUser];
      // user[@"age"] = [NSNumber numberWithInt: [_age.text intValue] ];
        user[@"height"] = [NSNumber numberWithInt: [_taille.text intValue] ];
        user[@"weight"] = [NSNumber numberWithInt: [_poids.text intValue] ];
        
       // user[@"age"] = @20;
        //user[@"height"] = @127;
        //user[@"weight"] = @55;
        dispatch_queue_t myQueue = dispatch_queue_create("My Queue",NULL);
                dispatch_async(myQueue, ^{

        [manager saveUser: user];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
                        });
                    });
        [self performSegueWithIdentifier:@"OSC_DashBord" sender:self];
    }
    else
    {
    // Show error alert
    [[[UIAlertView alloc] initWithTitle:@"Profile incomplet"
                                message:@"Veuillez remplir tout les champs"
                               delegate:nil
                      cancelButtonTitle:@"Ok"
                      otherButtonTitles:nil] show];
    }

}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end


