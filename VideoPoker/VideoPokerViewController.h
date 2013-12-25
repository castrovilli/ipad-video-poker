//
//  VideoPokerViewController.h
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoPokerViewController : UIViewController


//  Properties and action for card buttons

@property (strong, nonatomic) IBOutlet UIButton *cardButton1;
@property (strong, nonatomic) IBOutlet UIButton *cardButton2;
@property (strong, nonatomic) IBOutlet UIButton *cardButton3;
@property (strong, nonatomic) IBOutlet UIButton *cardButton4;
@property (strong, nonatomic) IBOutlet UIButton *cardButton5;

- (IBAction)cardTouched:(id)sender;


//  Property and action for main button

@property (strong, nonatomic) IBOutlet UIButton *drawButton;

- (IBAction)changeCards:(id)sender;


//  Properties for results and winnings labels

@property (strong, nonatomic) IBOutlet UILabel *resultsLabel;
@property (strong, nonatomic) IBOutlet UILabel *winningsLabel;


//  Property and actions for bet text field

@property (strong, nonatomic) IBOutlet UITextField *betTextField;

- (IBAction)betFieldExit:(id)sender;
- (IBAction)betFieldEditBegin:(id)sender;
- (IBAction)betFieldEditEnd:(id)sender;


//  Properties for payout table labels
@property (strong, nonatomic) IBOutlet UILabel *jacksPayoutLabel;
@property (strong, nonatomic) IBOutlet UILabel *pairPayoutLabel;
@property (strong, nonatomic) IBOutlet UILabel *threePayoutLabel;
@property (strong, nonatomic) IBOutlet UILabel *straightPayoutLabel;
@property (strong, nonatomic) IBOutlet UILabel *flushPayoutLabel;
@property (strong, nonatomic) IBOutlet UILabel *fullHousePayoutLabel;
@property (strong, nonatomic) IBOutlet UILabel *fourPayoutLabel;
@property (strong, nonatomic) IBOutlet UILabel *straightFlushPayoutLabel;
@property (strong, nonatomic) IBOutlet UILabel *royalFlushPayoutLabel;



@end
