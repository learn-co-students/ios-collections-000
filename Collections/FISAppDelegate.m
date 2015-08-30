//
//  FISAppDelegate.m
//  Collections
//
//  Created by Chris Gonzales on 5/30/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}


-(NSArray *)arrayBySortingArrayAscending:(NSArray *)argumentArray{
    NSSortDescriptor *sortAscending = [NSSortDescriptor sortDescriptorWithKey:nil ascending: YES];
    NSArray *sortedArray = [argumentArray sortedArrayUsingDescriptors:@[sortAscending]];
    return sortedArray;
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)argumentArray{
    NSSortDescriptor *sortDescending = [NSSortDescriptor sortDescriptorWithKey:nil ascending: NO];
    NSArray *sortedArray = [argumentArray sortedArrayUsingDescriptors:@[sortDescending]];
    return sortedArray;
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)argumentArray{
    
    NSMutableArray *swappedItemArray = [argumentArray mutableCopy];
    [swappedItemArray exchangeObjectAtIndex:0 withObjectAtIndex:[argumentArray count]-1];
    return swappedItemArray;
}

-(NSArray *)arrayByReversingArray:(NSArray *)argumentArray{
    NSArray *reversedArray = [[argumentArray reverseObjectEnumerator]allObjects];
    return reversedArray;
}

-(NSString *)stringInBasicLeetFromString:(NSString *)argumentString{
    NSMutableString *leetString = [argumentString mutableCopy];
    [leetString replaceOccurrencesOfString:@"a" withString:@"4" options:0 range:NSMakeRange(0, [leetString length])];
    [leetString replaceOccurrencesOfString:@"a" withString:@"4" options:0 range:NSMakeRange(0, [leetString length])];
    [leetString replaceOccurrencesOfString:@"s" withString:@"5" options:0 range:NSMakeRange(0, [leetString length])];
    [leetString replaceOccurrencesOfString:@"l" withString:@"1" options:0 range:NSMakeRange(0, [leetString length])];
    [leetString replaceOccurrencesOfString:@"i" withString:@"1" options:0 range:NSMakeRange(0, [leetString length])];
    [leetString replaceOccurrencesOfString:@"e" withString:@"3" options:0 range:NSMakeRange(0, [leetString length])];
    [leetString replaceOccurrencesOfString:@"t" withString:@"7" options:0 range:NSMakeRange(0, [leetString length])];
    return leetString;
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)argumentArray{
    NSMutableArray *positives = [[NSMutableArray alloc]init];
    NSMutableArray *negatives = [[NSMutableArray alloc]init];
    for (NSNumber *i in argumentArray) {
        if ([i integerValue] > 0) {
            [positives addObject:i];
        } else if ([i integerValue] < 0) {
            [negatives addObject:i];
        }
    }
    return @[negatives, positives];
}

//Can this be done using an NSPredicate
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)argumentDictionary{

    NSMutableArray *hobbits = [[NSMutableArray alloc]init];
    for (NSString *name in argumentDictionary) {
        if ([argumentDictionary[name] isEqualToString:@"hobbit"]) {
            [hobbits addObject:name];
        }
    }
    return hobbits;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)argumentArray{
    NSPredicate *filterOnlyStartingInA = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    NSArray *filteredByA = [argumentArray filteredArrayUsingPredicate:filterOnlyStartingInA];
    return filteredByA;
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)argumentArray{
    NSInteger sum = 0;
    for (NSNumber *i in argumentArray) {
        sum += [i integerValue];
    }
    return sum;
}
//
//plurals = @[ @"hands" ,
//             @"feet"  ,
//             @"knees" ,
//             @"tables",
//             @"boxes" ,
//             @"oxen"  ,
//             @"axles" ,
//             @"radii" ,
//             @"trivia"];

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)argumentArray{
    NSMutableArray *newArray = [[NSMutableArray alloc]init];
    for (NSString *word in argumentArray) {
        NSMutableString *pluralizedWord = [[NSMutableString alloc]init];
        if ([word hasSuffix:@"e"] || [word hasSuffix:@"d"]) {
            pluralizedWord = [[NSString stringWithFormat:@"%@s", word]mutableCopy];
        } else if ([word hasSuffix:@"us"]){
             pluralizedWord = [[word stringByReplacingOccurrencesOfString:@"us" withString:@"i"]mutableCopy];
        } else if ([word hasSuffix:@"oot"]) {
            pluralizedWord = [[word stringByReplacingOccurrencesOfString:@"oo" withString:@"ee"]mutableCopy];
        } else if ([word hasSuffix:@"box"]) {
            pluralizedWord = [[NSString stringWithFormat:@"%@es", word]mutableCopy];
        } else if ([word hasSuffix:@"ox"]) {
            pluralizedWord = [[NSString stringWithFormat:@"%@en", word]mutableCopy];
        } else if ([word hasSuffix:@"um"]) {
            pluralizedWord = [[word stringByReplacingOccurrencesOfString:@"um" withString:@"a"]mutableCopy];
        } else {
            pluralizedWord = [[NSString stringWithFormat:@"%@s", word]mutableCopy];
        }
        [newArray addObject:pluralizedWord];
    }
    return newArray;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)argumentString{
    NSArray *words = [argumentString componentsSeparatedByString:@" "];
    NSMutableDictionary *wordCounts = [[NSMutableDictionary alloc]init];
    for (NSString *word in words) {
        NSString *newWord = [[[[word stringByReplacingOccurrencesOfString:@"." withString:@""] stringByReplacingOccurrencesOfString:@"," withString:@""] stringByReplacingOccurrencesOfString:@"-" withString:@""]lowercaseString];
        if (wordCounts[newWord]) {
            NSInteger currentCountPlusOne = [wordCounts[newWord]integerValue]+1;
            wordCounts[newWord] = [NSNumber numberWithInt:currentCountPlusOne];
        } else {
            [wordCounts setObject:[NSNumber numberWithInt:1] forKey:newWord];
        }
    }
    
    return wordCounts;
}

//songList = @[ @"Coldplay - Strawberry Swing"        ,
//              @"Johnny Flynn - In April"            ,
//              @"Coldplay - Clocks"                  ,
//              @"Sigur Rós - Andvari"                ,
//              @"Ryan Adams - When The Stars Go Blue",
//              @"Coldplay - Viva la Vida"            ,
//              @"Johnny Flynn - Cold Bread"          ,
//              @"Sigur Rós - Glósóli"                ,
//              @"Ryan Adams - La Cienega Just Smiled"
//              ];

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)argumentArray{
    NSMutableDictionary *artistSongs = [[NSMutableDictionary alloc]init];
    NSSortDescriptor *sortAlphabetically = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    for (NSString *artistAndSong in argumentArray) {
        NSArray *separatedArtistAndSong = [artistAndSong componentsSeparatedByString:@" - "];
        NSString *artist = separatedArtistAndSong[0];
        NSString *song = separatedArtistAndSong[1];
        if (artistSongs[artist]) {
            [artistSongs[artist] addObject:song];
            [artistSongs[artist] sortUsingDescriptors:@[sortAlphabetically]];
        } else {
            artistSongs[artist] = [@[song]mutableCopy];
        }
    }
    return artistSongs;
}


@end
