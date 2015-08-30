//
//  FISAppDelegate.h
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)argumentArray;

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)argumentArray;

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)argumentArray;

-(NSArray *)arrayByReversingArray:(NSArray *)argumentArray;

-(NSString *)stringInBasicLeetFromString:(NSString *)argumentString;

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)argumentArray;

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)argumentDictionary;

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)argumentArray;

-(NSInteger)sumOfIntegersInArray:(NSArray *)argumentArray;

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)argumentArray;

-(NSDictionary *)countsOfWordsInString:(NSString *)argumentString;

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)argumentArray;

@end
