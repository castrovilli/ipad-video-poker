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

    _cardButtons = [[NSArray alloc] initWithObjects:_cardButton1, _cardButton2,
                    _cardButton3, _cardButton4, _cardButton5, nil];
    [self disableCardButtons];
    
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
        _betTextField.text = [[NSString alloc] initWithFormat:@"%i", _pokerMachine.currentBet];
        [self updateWinningsLabel];
    } else if ( _pokerMachine.gameState == POKER_GAMESTATE_FLIPPED ) {
        [_pokerMachine advanceGameState];        // TODO: consider whether this line is necessary
        [self disableCardButtons];
        [self drawCards];
        
        NSString * results = [_pokerMachine evaluationString];
        _resultsLabel.text = results;
        [self updateWinningsLabel];
        _betTextField.text = [[NSString alloc] initWithFormat:@"%i", _pokerMachine.currentBet];
        
        if ( _pokerMachine.gameState == POKER_GAMESTATE_GAMEOVER ) {
            UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Game over!" message:@"You ran out of cash!" delegate:nil cancelButtonTitle:@"Start New Game" otherButtonTitles:nil];
            [alert show];
            [self disableCardButtons];
            [_drawButton setTitle:@"Start new game" forState:UIControlStateNormal];
        } else {
            [_drawButton setTitle:@"Deal new hand" forState:UIControlStateNormal];
            
        }
    } else if ( _pokerMachine.gameState == POKER_GAMESTATE_NEWGAME ) {
        [self disableCardButtons];
        [self drawCards];
        _betTextField.text = [[NSString alloc] initWithFormat:@"%i", _pokerMachine.currentBet];
        [self updateWinningsLabel];
        [_drawButton setTitle:@"Deal your first hand!" forState:UIControlStateNormal];
        _resultsLabel.text = @"Welcome to Video Poker! Deal your first hand to begin.";

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
}
- (IBAction)betFieldEditBegin:(id)sender {
    _drawButton.enabled = NO;
}

- (IBAction)betFieldEditEnd:(id)sender {
    if ( [self validateBetEntry] ) {
        _pokerMachine.currentBet = [_betTextField.text integerValue];
        
        _drawButton.enabled = YES;
    } else {
        _betTextField.text = [[NSString alloc] initWithFormat:@"%i", _pokerMachine.currentBet];
        [_betTextField becomeFirstResponder];
    }
    
}

- (BOOL)validateBetEntry {
    NSString * betText = _betTextField.text;
    char buffer[128];
    char * endptr;
    long long betValue = 0;
    
    if ( ![betText getCString:buffer maxLength:128 encoding:NSUTF8StringEncoding] ) {
        return NO;
    }
    
    betValue = strtoll(buffer, &endptr, 10);
    if ( *endptr || betValue < 1 ) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"That's not a valid bet!" message:@"You must enter a positive whole number!" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
        return NO;
    } else if ( betValue > _pokerMachine.currentCash ) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"That's not a valid bet!" message:@"You don't have that much cash to bet!" delegate:nil cancelButtonTitle:@"Dismiss" otherButtonTitles:nil];
        [alert show];
        return NO;
    }
    
    return YES;
}
@end