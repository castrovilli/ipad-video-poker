//
//  PGCardsPokerHand.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PGCardsPokerHand.h"
#import "PGCardsPokerHandInfo.h"

@implementation PGCardsPokerHand {
    PGCardsPokerHandInfo * _handInfo;
}


//  Initializer method

- (PGCardsPokerHand *)init {
    if ( (self = [super init])) {
        _handInfo = [[PGCardsPokerHandInfo alloc] init];
    }
    
    return self;
}


//  Public method to evaluate the poker hand

- (void) evaluate {
    [_handInfo resetInfo];
    [self getRankMatches];
    
    //  We can only get a flush or straight if all the cards are singles, so only check if they are
    
    if ( [_handInfo allSingles] ) {
        [self checkForFlush];
        [self checkForStraight];
        
        if ( _handInfo.straight && _handInfo.flush ) {
            _handInfo.straightFlush = YES;
            if ( _handInfo.highCard == 14 ) {
                _handInfo.royalFlush = YES;
            }
        }
    }
}


//  Public method to get a string representation of the most recent evaluation

- (NSString *)evaluateString {
    static const char * cardNames[] = {"NONE", "ace", "two", "three", "four", "five", "six", "seven",
        "eight", "nine", "ten", "jack", "queen", "king", "ace"};
    NSString * returnString;
    
    //  TODO: capitalize strings properly.
    //  TODO: fix plural to get "sixes" instead of "sixs".
    
    if ( _handInfo.royalFlush ) {
        returnString = @"Royal flush";
    } else if ( _handInfo.straightFlush ) {
        returnString = [[NSString alloc] initWithFormat:@"Straight flush, %s high", cardNames[_handInfo.highCard]];
    } else if ( _handInfo.four ) {
        returnString = [[NSString alloc] initWithFormat:@"Four %ss", cardNames[_handInfo.four]];
    } else if ( _handInfo.three && _handInfo.lowPair ) {
        returnString = [[NSString alloc] initWithFormat:@"Full house, %ss full of %ss", cardNames[_handInfo.three],
                        cardNames[_handInfo.lowPair]];
    } else if ( _handInfo.flush ) {
        returnString = [[NSString alloc] initWithFormat:@"Flush, %s high", cardNames[[_handInfo singleAtIndex:0]]];
    } else if ( _handInfo.straight ) {
        returnString = [[NSString alloc] initWithFormat:@"Straight, %s high", cardNames[_handInfo.highCard]];
    } else if ( _handInfo.three ) {
        returnString = [[NSString alloc] initWithFormat:@"Three %ss", cardNames[_handInfo.three]];
    } else if ( _handInfo.highPair ) {
        returnString = [[NSString alloc] initWithFormat:@"Two pair, %ss over %ss", cardNames[_handInfo.highPair],
                        cardNames[_handInfo.lowPair]];
    } else if ( _handInfo.lowPair ) {
        returnString = [[NSString alloc] initWithFormat:@"Pair of %ss", cardNames[_handInfo.lowPair]];
    } else {
        returnString = [[NSString alloc] initWithFormat:@"%s high", cardNames[[_handInfo singleAtIndex:0]]];
    }
    
    return returnString;
}


//  Private method which finds fours, threes, pairs and computes a list of single cards.
//  TODO: document numeric format for single cards list.

- (void)getRankMatches {
    int rankCounts[15] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
    
    for ( PGCardsCard * card in _cards ) {
        rankCounts[card.rank] += 1;
    }
    
    for ( int rankCountIndex = 2; rankCountIndex < 15; ++rankCountIndex ) {
        int currentCount = rankCounts[rankCountIndex];
        if ( currentCount == 0 ) {
            continue;
        } else if ( currentCount == 1 ) {
            [_handInfo addSingle:rankCountIndex];
        } else if ( currentCount == 2 ) {
            if ( _handInfo.lowPair ) {
                _handInfo.highPair = rankCountIndex;
            } else {
                _handInfo.lowPair = rankCountIndex;
            }
        } else if ( currentCount == 3 ) {
            _handInfo.three = rankCountIndex;
        } else if ( currentCount == 4 ) {
            _handInfo.four = rankCountIndex;
        } else {
            assert(0);      // We should never get fives-of-a-kind
        }
    }
}


//  Private method which checks for a flush

- (void)checkForFlush {
    int suitCounts[4] = {0, 0, 0, 0};
    
    for ( PGCardsCard * card in _cards ) {
        suitCounts[card.suit] += 1;
    }
    
    for ( int suitCountIndex = 0; suitCountIndex < 4; ++suitCountIndex ) {
        if ( suitCounts[suitCountIndex] == 5 ) {
            _handInfo.flush = YES;
        }
    }
}


//  Private method which checks for a straight

- (void)checkForStraight {
    int single0 = [_handInfo singleAtIndex:0];
    int single1 = [_handInfo singleAtIndex:1];
    int single4 = [_handInfo singleAtIndex:4];
    
    if ( (single0 - single4) == 4 ) {
        _handInfo.straight = YES;
        _handInfo.highCard = [_handInfo singleAtIndex:0];
    } else if ( (single0 - single1) == 9 ) {
        _handInfo.straight = YES;
        _handInfo.highCard = 5;
    }
}

@end
