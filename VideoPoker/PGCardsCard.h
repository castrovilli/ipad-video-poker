//
//  PGCardsCard.h
//  ConsolePoker
//
//  Created by Paul Griffiths on 12/19/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString * rank_long_string(int rank);
NSString * suit_long_string(int suit);
NSString * rank_short_string(int rank);
NSString * suit_short_string(int suit);

@interface PGCardsCard : NSObject

@property (nonatomic, readonly) int index;
@property (nonatomic, readonly) int sortingIndex;
@property (nonatomic, readonly) int rank;
@property (nonatomic, readonly) int suit;

-(PGCardsCard *)initWithIndex:(int)index;
-(PGCardsCard *)initWithRank:(int)rank andSuit:(int)suit;
-(NSString *)longName;
-(NSString *)shortName;

-(BOOL)isSameRankAsCard:(PGCardsCard *)otherCard;
-(BOOL)isNotSameRankAsCard:(PGCardsCard *)otherCard;
-(BOOL)isLowerRankThanCard:(PGCardsCard *)otherCard;
-(BOOL)isHigherRankThanCard:(PGCardsCard *)otherCard;
-(BOOL)isLowerOrEqualRankThanCard:(PGCardsCard *)otherCard;
-(BOOL)isHigherOrEqualRankThanCard:(PGCardsCard *)otherCard;

@end
