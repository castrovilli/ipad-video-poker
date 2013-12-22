//
//  PGCardsPokerHandInfo.h
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PGCardsPokerHandInfo : NSObject

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

- (void)resetInfo;
- (void)addSingle:(int)newSingle;
- (BOOL)allSingles;
- (int)singleAtIndex:(int)index;

@end
