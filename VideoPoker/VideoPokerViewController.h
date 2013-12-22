//
//  VideoPokerViewController.h
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoPokerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *cardButton1;
@property (strong, nonatomic) IBOutlet UIButton *cardButton2;
@property (strong, nonatomic) IBOutlet UIButton *cardButton3;
@property (strong, nonatomic) IBOutlet UIButton *cardButton4;
@property (strong, nonatomic) IBOutlet UIButton *cardButton5;

- (IBAction)cardTouched:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *drawButton;

- (IBAction)changeCards:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *resultsLabel;

- (IBAction)betFieldExit:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *betTextField;
@property (strong, nonatomic) IBOutlet UILabel *winningsLabel;



@end
