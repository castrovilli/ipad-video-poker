//
//  VideoPokerViewController.h
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VideoPokerViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *card_1_view;
@property (strong, nonatomic) IBOutlet UIImageView *card_2_view;
@property (strong, nonatomic) IBOutlet UIImageView *card_3_view;
@property (strong, nonatomic) IBOutlet UIImageView *card_4_view;
@property (strong, nonatomic) IBOutlet UIImageView *card_5_view;
- (IBAction)changeCards:(id)sender;

@end
