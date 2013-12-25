//
//  SettingsViewController.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/25/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end


@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//  viewDidLoad method just sets the initial state of the controls

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    if ( *_payoutChoice == PAYOUT_CHOICE_NORMAL ) {
        self.payoutSegCtl.selectedSegmentIndex = 0;
    } else {
        self.payoutSegCtl.selectedSegmentIndex = 1;
    }
    
    if ( *_cardBacksChoice == CARDBACKS_CHOICE_BLUE ) {
        self.cardBacksSegCtl.selectedSegmentIndex = 0;
    } else {
        self.cardBacksSegCtl.selectedSegmentIndex = 1;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//  Action methods to save state when controls change values

- (IBAction)payoutValueChanged:(id)sender {
    if ( self.payoutSegCtl.selectedSegmentIndex == 0 ) {
        *_payoutChoice = PAYOUT_CHOICE_NORMAL;
    } else {
        *_payoutChoice = PAYOUT_CHOICE_EASY;
    }
}

- (IBAction)cardBacksValueChanged:(id)sender {
    if ( self.cardBacksSegCtl.selectedSegmentIndex == 0 ) {
        *_cardBacksChoice = CARDBACKS_CHOICE_BLUE;
    } else {
        *_cardBacksChoice = CARDBACKS_CHOICE_RED;
    }
}
@end
