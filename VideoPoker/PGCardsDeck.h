//
//  PGCardsDeck.h
//  VideoPoker
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PGCardsCard.h"

@interface PGCardsDeck : NSObject

@property (nonatomic, readonly) NSUInteger size;
@property (nonatomic, readonly) NSUInteger discardPileSize;

-(void)shuffle;
-(PGCardsCard *)drawTopCard;
-(NSMutableArray *)drawTopCards:(int)numCards;
-(void)addCardToDiscards:(PGCardsCard *)card;
-(void)addCardsToDiscards:(NSMutableArray *)cards;
-(void)replaceDiscards;

@end
