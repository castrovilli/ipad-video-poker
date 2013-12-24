//
//  PGCardsPokerHandInfo.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PGCardsPokerHandInfo.h"

@implementation PGCardsPokerHandInfo


//  Initialization method

- (PGCardsPokerHandInfo *)init {
    if ( (self = [super init])) {
        _singles = 0;
        _lowPair = 0;
        _highPair = 0;
        _three = 0;
        _four = 0;
        _highCard = -1;
        _straight = NO;
        _flush = NO;
        _straightFlush = NO;
        _royalFlush = NO;
        _pokerHandType = POKERHAND_NOTEVALUATED;
        _videoPokerHandType = VIDEOPOKERHAND_NOTEVALUATED;
    }
    
    return self;
}


//  Method to reset all the properties

- (void)resetInfo {
    _singles = 0;
    _lowPair = 0;
    _highPair = 0;
    _three = 0;
    _four = 0;
    _highCard = -1;
    _straight = NO;
    _flush = NO;
    _straightFlush = NO;
    _royalFlush = NO;
    _pokerHandType = POKERHAND_NOTEVALUATED;
    _videoPokerHandType = VIDEOPOKERHAND_NOTEVALUATED;
}


//  Method to add a single card, it is assumed they will be added in increasing order of rank.
//  Singles are stored in a single (no pun intended) u_int32_t, each single taking one nibble.
//  The highest ranking single is always stored in the fifth nibble from the right, so a hand
//  comprising 6, 5, 4, 3, 2 would be represented 0x00065432, and a hand comprising queen and
//  jack 8 would be represented 0x000CB000. Ranks are represented by 0x2 (two) through 0xE (ace)
//  and so always fit in a single 4-bit nibble.

- (void)addSingle:(int)newSingle {
    _singles = _singles >> 4;
    _singles += newSingle << 16;
}


//  Returns YES if all five cards are singles. If they are not, the rightmost nibble in the
//  u_int32_t will be zero, so we can just check whether or not it is.

- (BOOL)allSingles {
    if ( _singles & 0xF ) {
        return YES;
    } else {
        return NO;
    }
}


//  Returns the rank of the single card at the specified index, with 0 being the highest ranking single.
//  There is probably a simpler way of doing this, e.g. (_singles >> (4 - (index * 4))) & 0xF).

- (int)singleAtIndex:(int)index {
    return (((_singles << (index * 4)) & 0xF0000) >> 16);
}


@end
