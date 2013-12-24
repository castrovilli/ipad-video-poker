//
//  PGCardsPokerHandInfo.h
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>


//  Enumeration for regular poker hand types

enum PGCardsPokerHandType {
    POKERHAND_HIGHCARD,
    POKERHAND_PAIR,
    POKERHAND_TWOPAIR,
    POKERHAND_THREE,
    POKERHAND_STRAIGHT,
    POKERHAND_FLUSH,
    POKERHAND_FULLHOUSE,
    POKERHAND_FOUR,
    POKERHAND_STRAIGHTFLUSH,
    POKERHAND_ROYALFLUSH,
    POKERHAND_NOTEVALUATED
};


//  Enumeration for video poker hand types

enum PGCardsVideoPokerHandType {
    VIDEOPOKERHAND_NOWIN,
    VIDEOPOKERHAND_JACKSORBETTER,
    VIDEOPOKERHAND_TWOPAIR,
    VIDEOPOKERHAND_THREE,
    VIDEOPOKERHAND_STRAIGHT,
    VIDEOPOKERHAND_FLUSH,
    VIDEOPOKERHAND_FULLHOUSE,
    VIDEOPOKERHAND_FOUR,
    VIDEOPOKERHAND_STRAIGHTFLUSH,
    VIDEOPOKERHAND_ROYALFLUSH,
    VIDEOPOKERHAND_NOTEVALUATED
};


//  Class interface

@interface PGCardsPokerHandInfo : NSObject


//  Properties

@property (nonatomic) u_int32_t singles;
@property (nonatomic) int lowPair;
@property (nonatomic) int highPair;
@property (nonatomic) int three;
@property (nonatomic) int four;
@property (nonatomic) BOOL straight;
@property (nonatomic) BOOL flush;
@property (nonatomic) BOOL straightFlush;
@property (nonatomic) BOOL royalFlush;
@property (nonatomic) int highCard;
@property (nonatomic) enum PGCardsPokerHandType pokerHandType;
@property (nonatomic) enum PGCardsVideoPokerHandType videoPokerHandType;
@property (nonatomic) u_int32_t score;


//  Public methods

- (void)resetInfo;
- (void)addSingle:(int)newSingle;
- (BOOL)allSingles;
- (int)singleAtIndex:(int)index;
- (void)addScoreElement:(int)newElement;
- (void)setScoreType:(enum PGCardsPokerHandType)handType;
- (void)setScoreToSingles;


@end
