//
//  VideoPokerViewController.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "VideoPokerViewController.h"
#import "PGCardsCard.h"

@interface VideoPokerViewController () {
    NSArray * _cardViews;
    NSMutableArray * _cards;
}

@end

@implementation VideoPokerViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    _cardViews = [[NSArray alloc] initWithObjects:_card_1_view, _card_2_view, _card_3_view, _card_4_view, _card_5_view, nil];
    for ( int i = 0; i < 5; ++i ) {
        [_cards addObject:[[PGCardsCard alloc] initWithIndex:i]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeCards:(id)sender {
    for ( int i = 0; i < 5; ++i ) {
        int new_index = rand() % 52 + 1;
        _cards[i] = [[PGCardsCard alloc] initWithIndex:new_index];
        ((UIImageView *)_cardViews[i]).image = [UIImage imageNamed:[[NSString alloc] initWithFormat:@"%i.gif", new_index]];
    }
}
@end
