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


//  Private methods for enabling and disabling card buttons.

- (void)enableCardButtons:(BOOL)buttonStatus andBetTextField:(BOOL)betStatus {
    for ( UIButton * button in _cardButtons ) {
        button.enabled = buttonStatus;
    }
    
    _betTextField.enabled = betStatus;
}


//  Standard viewDidLoad and didReceiveMemoryWarning methods

- (void)viewDidLoad
{
    [super viewDidLoad];

    _cardButtons = [[NSArray alloc] initWithObjects:_cardButton1, _cardButton2,
                    _cardButton3, _cardButton4, _cardButton5, nil];
    [self enableCardButtons:NO andBetTextField:YES];
    
    _pokerMachine = [[PGCardsPokerTable alloc] init];
    [self updateBetAndWinnings];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//  Private method to update winnings label and bet text field with
//  values from the poker machine.

- (void)updateBetAndWinnings {
    NSNumberFormatter * nf = [NSNumberFormatter new];
    nf.numberStyle = NSNumberFormatterDecimalStyle;
    _winningsLabel.text = [[NSString alloc] initWithFormat:@"$%@",
                           [nf stringFromNumber:[NSNumber numberWithInt:_pokerMachine.currentCash]]];
    
    _betTextField.text = [[NSString alloc] initWithFormat:@"%i", _pokerMachine.currentBet];
}


//  Private method to update button title and results label

- (void)updateButtonTitle:(NSString *)newTitle andResultsLabel:(NSString *)newLabel {
    [_drawButton setTitle:newTitle forState:UIControlStateNormal];
    _resultsLabel.text = newLabel;
}


//  Action method invoked when main button is touched. The primary function is to
//  advance the game state of the poker machine, and then to re-draw the cards and
//  update the winnings label and the bet text field. In addition, the card buttons
//  and bet text field are enabled and disabled as appropriate, and the button text
//  and message are updated.

- (IBAction)changeCards:(id)sender {
    [_pokerMachine advanceGameState];
    [self drawCards];
    [self updateBetAndWinnings];

    if ( _pokerMachine.gameState == POKER_GAMESTATE_DEALED ) {
        
        //  The initial cards have been dealt, so enable the card buttons for flipping,
        //  and disable the bet field.
        
        [self enableCardButtons:YES andBetTextField:NO];
        [self updateButtonTitle:@"Exchange cards or stand"
                andResultsLabel:@"Touch a card to exchange it, or just keep what you have."];
        
    } else if ( _pokerMachine.gameState == POKER_GAMESTATE_EVALUATED ) {
        
        //  The cards have been exchanged and we're at the end of the hand, so disable the
        //  card buttons and enable the bet text field to allow a new bet to be entered.
        
        [self enableCardButtons:NO andBetTextField:YES];
        [self updateButtonTitle:@"Deal new hand" andResultsLabel:_pokerMachine.evaluationString];
        
    } else if ( _pokerMachine.gameState == POKER_GAMESTATE_GAMEOVER ) {
        
        //  The cards have been exchanged and we're at the end of the hand, but the game is
        //  over since we've run out of cash, so disable both the card buttons and the bet
        //  text field, leaving only the option to start a new game via the main button.
        
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"Game over!" message:@"You ran out of cash!" delegate:nil cancelButtonTitle:@"Start New Game" otherButtonTitles:nil];
        [alert show];
        
        [self enableCardButtons:NO andBetTextField:NO];
        [self updateButtonTitle:@"Start new game" andResultsLabel:_pokerMachine.evaluationString];
        
    } else if ( _pokerMachine.gameState == POKER_GAMESTATE_NEWGAME ) {
        
        //  We've started a new game after losing the last one, so reset the fields to their
        //  initial values, and disable the card buttons and enable the bet field.
        
        [self enableCardButtons:NO andBetTextField:YES];
        [self updateButtonTitle:@"Deal your first hand!"
                andResultsLabel:@"Welcome to Video Poker! Deal your first hand to begin."];

    } else {
        
        //  We should never get here, so log error and abort if we do.
        
        NSLog(@"Unknown game state in changeCards:");
        assert(0);
        
    }
}


//  Action method invoked to flip the card image and re-draw it when a card button is touched.

- (IBAction)cardTouched:(id)sender {
    for ( int buttonsIndex = 0; buttonsIndex < 5; ++buttonsIndex ) {
        if ( sender == _cardButtons[buttonsIndex] ) {
            int cardPosition = buttonsIndex + 1;
            [_pokerMachine switchCardFlip:cardPosition];
            [self drawCard:cardPosition];
        }
    }
}


//  Action method to dismiss keyboard when hitting return. We don't want to call
//  resignFirstResponder here, as that would dismiss the keyboard even when the
//  entry is invalid, which we don't want to do. However, removing this method
//  prevents the keyboard from being dismissed at all, which we don't want to do.
//  Currently unclear to me why this empty method makes all the difference. Possibly
//  enabling the draw button is responsible for making this control lose first
//  responder status, but it still doesn't explain why this empty method makes a
//  difference.

- (IBAction)betFieldExit:(id)sender {
}


//  Action method to disable to main button when editing text, since we need
//  to validate that entry, and we don't want the user clicking the button
//  with an invalid entry.

- (IBAction)betFieldEditBegin:(id)sender {
    _drawButton.enabled = NO;
}


//  Action method to validate the bet entry once editing has finished.

- (IBAction)betFieldEditEnd:(id)sender {
    if ( [self validateBetEntry] ) {
        
        //  Entry is valid, so update current bet in poker machine and enable main button.
        
        _pokerMachine.currentBet = [_betTextField.text integerValue];
        _drawButton.enabled = YES;
        
    } else {
        
        //  Entry is not valid, to change bet text field back to current bet, and
        //  return the focus back to the text field, keeping the main button disabled.
        
        _betTextField.text = [[NSString alloc] initWithFormat:@"%i", _pokerMachine.currentBet];
        [_betTextField becomeFirstResponder];

    }
}


//  Private method to validate the bet entry, to make sure it's a positive whole number,
//  and that it does not exceed the amount of cash available. Returns YES if the bet is
//  valid, and NO if it is not.

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