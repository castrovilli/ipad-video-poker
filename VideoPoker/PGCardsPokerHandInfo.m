//
//  PGCardsPokerHandInfo.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import "PGCardsPokerHandInfo.h"

@implementation PGCardsPokerHandInfo

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
    }
    
    return self;
}

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
}

- (void)addSingle:(int)newSingle {
    _singles = _singles >> 4;
    _singles += newSingle << 16;
}

- (BOOL)allSingles {
    if ( _singles & 0xF ) {
        return YES;
    } else {
        return NO;
    }
}

- (int)singleAtIndex:(int)index {
    return (((_singles << (index * 4)) & 0xF0000) >> 16);
}

@end
