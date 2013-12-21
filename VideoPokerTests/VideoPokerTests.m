//
//  VideoPokerTests.m
//  VideoPokerTests
//
//  Created by Paul Griffiths on 12/21/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGCardsCard.h"

@interface PGCardsCardTests : XCTestCase

@end

@implementation PGCardsCardTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


//  Tests default init method

- (void)testInit
{
    PGCardsCard * card = [[PGCardsCard alloc] init];
    XCTAssertNotNil(card);
    XCTAssertEqual([card index], 0);
}


//  Tests initialization with index between 0 and 51 inclusive returns a valid card

- (void)testInitWithIndexInRange
{
    for ( int i = 0; i < 52; ++i ) {
        PGCardsCard * card = [[PGCardsCard alloc] initWithIndex:i];
        XCTAssertNotNil(card);
    }
}


//  Tests initialization with index outside of 0-51 range returns nil

- (void)testInitWithIndexOutOfRange
{
    int badIndices[] = {-1, -27, 52, 109};
    
    for ( int i = 0; i < (sizeof(badIndices) / sizeof(badIndices[0])); ++i ) {
        PGCardsCard * card = [[PGCardsCard alloc] initWithIndex:badIndices[i]];
        XCTAssertNil(card);
    }
}


//  Tests initialization with rank and suit generates the correct index

- (void)testInitWithRankAndSuit
{
    int index = 0;
    for ( int suit = 0; suit < 4; ++suit ) {
        for ( int rank = 1; rank < 14; ++rank ) {
           PGCardsCard * card = [[PGCardsCard alloc] initWithRank:rank andSuit:suit];
            XCTAssertNotNil(card);
            XCTAssertEqual([card index], index++);
        }
    }
    
    //  Handle cases where rank for Ace is supplied at 14, rather than 1
    
    index = 0;
    for ( int suit = 0; suit < 4; ++suit ) {
        PGCardsCard * card = [[PGCardsCard alloc] initWithRank:14 andSuit:suit];
        XCTAssertNotNil(card);
        XCTAssertEqual([card index], 13 * index++);
    }
}


//  Tests correct short name of card is returned

- (void)testCardShortName
{
    NSArray * shortNames = [[NSArray alloc] initWithObjects:@"AC", @"2C", @"3C", @"4C", @"5C", @"6C", @"7C",
                            @"8C", @"9C", @"TC", @"JC", @"QC", @"KC", @"AH", @"2H", @"3H", @"4H", @"5H",
                            @"6H", @"7H", @"8H", @"9H", @"TH", @"JH", @"QH", @"KH", @"AS", @"2S", @"3S",
                            @"4S", @"5S", @"6S", @"7S", @"8S", @"9S", @"TS", @"JS", @"QS", @"KS", @"AD",
                            @"2D", @"3D", @"4D", @"5D", @"6D", @"7D", @"8D", @"9D", @"TD", @"JD", @"QD",
                            @"KD", nil];
    
    for ( int i = 0; i < 52; ++i ) {
        PGCardsCard * card = [[PGCardsCard alloc] initWithIndex:i];
        XCTAssert([[card shortName] isEqualToString:shortNames[i]]);
        NSLog(@"Short name: %@", shortNames[i]);
    }
}


//  Tests correct long name of card is returned

- (void)testCardLongName
{
    PGCardsCard * card = [[PGCardsCard alloc] initWithIndex:0];
    XCTAssert([[card longName] isEqualToString:@"ace of clubs"]);

    card = [[PGCardsCard alloc] initWithIndex:1];
    XCTAssert([[card longName] isEqualToString:@"two of clubs"]);
    
    card = [[PGCardsCard alloc] initWithIndex:10];
    XCTAssert([[card longName] isEqualToString:@"jack of clubs"]);
    
    card = [[PGCardsCard alloc] initWithIndex:12];
    XCTAssert([[card longName] isEqualToString:@"king of clubs"]);
    
    card = [[PGCardsCard alloc] initWithIndex:13];
    XCTAssert([[card longName] isEqualToString:@"ace of hearts"]);
    
    card = [[PGCardsCard alloc] initWithIndex:20];
    XCTAssert([[card longName] isEqualToString:@"eight of hearts"]);
    
    card = [[PGCardsCard alloc] initWithIndex:25];
    XCTAssert([[card longName] isEqualToString:@"king of hearts"]);
    
    card = [[PGCardsCard alloc] initWithIndex:26];
    XCTAssert([[card longName] isEqualToString:@"ace of spades"]);
    
    card = [[PGCardsCard alloc] initWithIndex:28];
    XCTAssert([[card longName] isEqualToString:@"three of spades"]);
    
    card = [[PGCardsCard alloc] initWithIndex:38];
    XCTAssert([[card longName] isEqualToString:@"king of spades"]);
    
    card = [[PGCardsCard alloc] initWithIndex:39];
    XCTAssert([[card longName] isEqualToString:@"ace of diamonds"]);
    
    card = [[PGCardsCard alloc] initWithIndex:45];
    XCTAssert([[card longName] isEqualToString:@"seven of diamonds"]);
    
    card = [[PGCardsCard alloc] initWithIndex:48];
    XCTAssert([[card longName] isEqualToString:@"ten of diamonds"]);
    
    card = [[PGCardsCard alloc] initWithIndex:50];
    XCTAssert([[card longName] isEqualToString:@"queen of diamonds"]);
    
    card = [[PGCardsCard alloc] initWithIndex:51];
    XCTAssert([[card longName] isEqualToString:@"king of diamonds"]);
}

@end
