//
//  VideoPokerViewController.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "VideoPokerViewController.h"
#import "PGCardsPokerTable.h"

@interface VideoPokerViewController () {
    PGCardsPokerTable * _pokerMachine;
    NSArray * _cardButtons;
}

@end

@implementation VideoPokerViewController


//  Private methods for setting and changing card button images

- (void)drawCards {
    for ( int position = 1; position < 6; ++position ) {
        [self drawCard:position];
    }
}

- (void)drawCard:(int)cardPosition {
    NSString * fileString;
    
    if ( [_pokerMachine isCardFlipped:cardPosition] ) {
        fileString = @"card_back_blue";
    } else {
        int cardIndex = [_pokerMachine cardIndexAtPosition:cardPosition];
        fileString = [[NSString alloc] initWithFormat:@"card%i", cardIndex];
    }
    
    [_cardButtons[cardPosition - 1] setImage:[UIImage imageNamed:fileString] forState:UIControlStateNormal];
    
}


//  Private methods for enabling and disabling card buttons

-(void)enableCardButtons {
    for ( UIButton * button in _cardButtons ) {
        button.enabled = YES;
    }
    _betTextField.enabled = NO;
}

-(void)disableCardButtons {
    for ( UIButton * button in _cardButtons ) {
        button.enabled = NO;
    }
    _betTextField.enabled = YES;
}


//  Standard viewDidLoad and didReceiveMemoryWarning methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self disableCardButtons];
    _cardButtons = [[NSArray alloc] initWithObjects:_cardButton1, _cardButton2,
                    _cardButton3, _cardButton4, _cardButton5, nil];
    
    _pokerMachine = [[PGCardsPokerTable alloc] init];
    _winningsLabel.text = [[NSString alloc] initWithFormat:@"%i", _pokerMachine.currentCash];
    [self updateWinningsLabel];
    _betTextField.text = [[NSString alloc] initWithFormat:@"%i", _pokerMachine.currentBet];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)updateWinningsLabel {
    NSNumberFormatter * nf = [NSNumberFormatter new];
    nf.numberStyle = NSNumberFormatterDecimalStyle;
    _winningsLabel.text = [[NSString alloc] initWithFormat:@"$%@", [nf stringFromNumber:[NSNumber numberWithInt:_pokerMachine.currentCash]]];
}


//  Action method invoked when main button is touched

- (IBAction)changeCards:(id)sender {
    [_pokerMachine advanceGameState];
    
    if ( _pokerMachine.gameState == POKER_GAMESTATE_DEALED ) {
        [self enableCardButtons];
        [self drawCards];
        [_drawButton setTitle:@"Exchange cards or stand" forState:UIControlStateNormal];
        _resultsLabel.text = @"Touch a card to exchange it, or just keep what you have.";
        [self updateWinningsLabel];
    } else if ( _pokerMachine.gameState == POKER_GAMESTATE_FLIPPED ) {
        [_pokerMachine advanceGameState];        // TODO: consider whether this line is necessary
        [self disableCardButtons];
        [self drawCards];
        [_drawButton setTitle:@"Deal new hand" forState:UIControlStateNormal];
        
        NSString * results = [_pokerMachine evaluationString];
        _resultsLabel.text = results;
        [self updateWinningsLabel];
        
    } else {
        assert(0);          //  We should never get here
    }
}


//  Action method invoked to flip the card image when a card button is touched

- (IBAction)cardTouched:(id)sender {
    for ( int buttonsIndex = 0; buttonsIndex < 5; ++buttonsIndex ) {
        if ( sender == _cardButtons[buttonsIndex] ) {
            int cardPosition = buttonsIndex + 1;
            [_pokerMachine switchCardFlip:cardPosition];
            [self drawCard:cardPosition];
        }
    }
}

- (IBAction)betFieldExit:(id)sender {
    [sender resignFirstResponder];
}
@end