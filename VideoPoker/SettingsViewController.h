//
//  SettingsViewController.h
//  VideoPoker
//
//  Created by Paul Griffiths on 12/25/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OptionsTypes.h"

@interface SettingsViewController : UIViewController

@property (nonatomic) enum PayoutChoiceOptions * payoutChoice;
@property (nonatomic) enum CardBacksChoiceOptions * cardBacksChoice;

@property (strong, nonatomic) IBOutlet UISegmentedControl *payoutSegCtl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *cardBacksSegCtl;

- (IBAction)payoutValueChanged:(id)sender;
- (IBAction)cardBacksValueChanged:(id)sender;


@end
