//
//  PGCardsPokerHandTests.m
//  VideoPoker
//
//  Created by Paul Griffiths on 12/23/13.
//  Copyright (c) 2013 Paul Griffiths. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PGCardsPokerHand.h"

@interface PGCardsPokerHandTests : XCTestCase

@end

@implementation PGCardsPokerHandTests

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


//  Checks correct evaluation of royal flush

- (void)testEvaluateRoyalFlush
{
    PGCardsPokerHand * hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AC", @"KC", @"QC", @"JC", @"TC"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_ROYALFLUSH);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_ROYALFLUSH);

    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"9C", @"KC", @"QC", @"JC", @"TC"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_ROYALFLUSH);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_ROYALFLUSH);

    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AC", @"KC", @"QC", @"JC", @"9C"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_ROYALFLUSH);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_ROYALFLUSH);

    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AC", @"KC", @"QC", @"JC", @"TH"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_ROYALFLUSH);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_ROYALFLUSH);
}


//  Checks correct evaluation of straight flush

- (void)testEvaluateStraightFlush
{
    PGCardsPokerHand * hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AH", @"KH", @"QH", @"JH", @"TH"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_STRAIGHTFLUSH);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHTFLUSH);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"9H", @"KH", @"QH", @"JH", @"TH"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_STRAIGHTFLUSH);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHTFLUSH);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"9H", @"KH", @"QS", @"JH", @"TH"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_STRAIGHTFLUSH);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHTFLUSH);
}


//  Checks correct evaluation of four-of-a-kind

- (void)testEvaluateFour
{
    PGCardsPokerHand * hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AH", @"AC", @"AS", @"AS", @"KH"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_FOUR);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_FOUR);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"8H", @"8D", @"2C", @"8S", @"8C"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_FOUR);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_FOUR);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"2H", @"2C", @"2S", @"2D", @"3H"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_FOUR);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_FOUR);
}


//  Checks correct evaluation of full house

- (void)testEvaluateFullHouse
{
    PGCardsPokerHand * hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AH", @"AC", @"AS", @"KS", @"KH"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_FULLHOUSE);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_FULLHOUSE);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"3H", @"3D", @"7C", @"7S", @"7D"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_FULLHOUSE);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_FULLHOUSE);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"QH", @"QC", @"TS", @"TD", @"TH"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_FULLHOUSE);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_FULLHOUSE);
}


//  Checks correct evaluation of a flush

- (void)testEvaluateFlush
{
    PGCardsPokerHand * hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AH", @"KH", @"TH", @"4H", @"2H"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_FLUSH);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_FLUSH);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"3D", @"5D", @"7D", @"9D", @"QD"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_FLUSH);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_FLUSH);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AS", @"QS", @"5S", @"9S", @"4C"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_FLUSH);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_FLUSH);
}


//  Checks correct evaluation of a straight

- (void)testEvaluateStraight
{
    PGCardsPokerHand * hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AH", @"2H", @"3H", @"4H", @"5D"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHT);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"3D", @"4H", @"5S", @"6C", @"7D"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHT);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"8D", @"9C", @"TS", @"JS", @"QS"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHT);

    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"3D", @"4H", @"5S", @"5C", @"7D"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHT);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"8D", @"8C", @"TS", @"JS", @"QS"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHT);

    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AD", @"2C", @"3S", @"3D", @"5S"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHT);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AD", @"KD", @"QD", @"JD", @"TD"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_STRAIGHT);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_STRAIGHT);
}


//  Checks correct evaluation of three-of-a-kind

- (void)testEvaluateThree
{
    PGCardsPokerHand * hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AH", @"AC", @"AS", @"KS", @"KH"]];
    [hand evaluate];
    XCTAssertNotEqual(hand.handInfo.pokerHandType, POKERHAND_THREE);
    XCTAssertNotEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_THREE);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AH", @"AC", @"AS", @"KS", @"QH"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_THREE);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_THREE);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"9C", @"9H", @"4S", @"3C", @"9S"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_THREE);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_THREE);
}


//  Checks correct evaluation of two pair

- (void)testEvaluateTwoPair
{
    PGCardsPokerHand * hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AH", @"AC", @"KS", @"KD", @"QH"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_TWOPAIR);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_TWOPAIR);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"3H", @"4C", @"4S", @"2S", @"3D"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_TWOPAIR);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_TWOPAIR);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"9S", @"8D", @"9H", @"8H", @"4C"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_TWOPAIR);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_TWOPAIR);
}


//  Checks correct evaluation of a pair

- (void)testEvaluatePair
{
    PGCardsPokerHand * hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AH", @"AC", @"KS", @"JD", @"QH"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_PAIR);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_JACKSORBETTER);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"4H", @"3C", @"9S", @"JH", @"JD"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_PAIR);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_JACKSORBETTER);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"9S", @"TD", @"8H", @"TS", @"7C"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_PAIR);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_NOWIN);

    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"3S", @"4D", @"4C", @"AH", @"QS"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_PAIR);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_NOWIN);
}


//  Checks correct evaluation of a high card

- (void)testEvaluateHighCard
{
    PGCardsPokerHand * hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"AH", @"9C", @"KS", @"JD", @"QH"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_HIGHCARD);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_NOWIN);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"4H", @"3C", @"9S", @"JH", @"QD"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_HIGHCARD);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_NOWIN);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"9S", @"TD", @"8H", @"KS", @"7C"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_HIGHCARD);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_NOWIN);
    
    hand = [PGCardsPokerHand new];
    [hand addCardsFromArrayOfShortNames:@[@"3S", @"4D", @"7C", @"AH", @"QS"]];
    [hand evaluate];
    XCTAssertEqual(hand.handInfo.pokerHandType, POKERHAND_HIGHCARD);
    XCTAssertEqual(hand.handInfo.videoPokerHandType, VIDEOPOKERHAND_NOWIN);
}


@end
