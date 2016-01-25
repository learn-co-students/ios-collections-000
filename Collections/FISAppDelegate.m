//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/**
 
 * Define your methods here.
 
 */


-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array{
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedAsc = [array sortedArrayUsingDescriptors:@[sortByNilAsc]];
    return sortedAsc;
};

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSSortDescriptor *sortByNilDesc = [sortByNilAsc reversedSortDescriptor];
    NSArray *sortedDesc = [array sortedArrayUsingDescriptors:@[sortByNilDesc]];
    return sortedDesc;
};

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array{
    NSUInteger numObjects = [array count];
    NSMutableArray *mutableArray = [array mutableCopy];
    [mutableArray exchangeObjectAtIndex:0 withObjectAtIndex:(numObjects-1)];
    return mutableArray;
};

-(NSArray *)arrayByReversingArray:(NSArray *)array{
    NSMutableArray *mutableArray = [NSMutableArray array];
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    for (id element in enumerator){
        [mutableArray addObject:element];
    }
    return mutableArray;
};

-(NSString *)stringInBasicLeetFromString:(NSString *)string{
    NSDictionary *map = @{ @"a" : @"4",
                           @"s" : @"5",
                           @"i" : @"1",
                           @"l" : @"1",
                           @"e" : @"3",
                           @"t" : @"7" };
    for (NSString *key in map) {
        string = [string stringByReplacingOccurrencesOfString:key withString:map[key]];
    }
    return string;
};

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array{
    NSMutableArray *combinedArray = [NSMutableArray array];
    NSMutableArray *zeroOrGreater = [NSMutableArray array];
    NSMutableArray *lessThanZero = [NSMutableArray array];
    for (NSString *object in array) {
        NSInteger myInt = [object intValue];
        if (myInt < 0) {
            [lessThanZero addObject:object];
        } else if (myInt > 0) {
            [zeroOrGreater addObject:object];
        }
    }
    [combinedArray addObject: lessThanZero];
    [combinedArray addObject: zeroOrGreater];
    
    return combinedArray;
};

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary{
    NSMutableArray *mutableArray = [NSMutableArray array];
    for (NSString *key in dictionary) {
        if ([dictionary[key] isEqualToString:@"hobbit"]){
            [mutableArray addObject:key];
        }
    }
    return mutableArray;
};

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array{
    NSPredicate *stringBeginningWithA = [NSPredicate predicateWithFormat:@"self beginswith[c]'a'"];
    NSArray *filteredArray = [array filteredArrayUsingPredicate:stringBeginningWithA];
    return filteredArray;
};

-(NSInteger)sumOfIntegersInArray:(NSArray *)array{
    NSInteger sum = 0;
    for (NSString *object in array){
        NSInteger convertedNumber = [object intValue];
        sum += convertedNumber;
    }
    return sum;
};

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array{
    NSDictionary *pluralMap = @{ @"hand" : @"hands",
                                 @"foot" : @"feet",
                                 @"knee" : @"knees",
                                 @"table" : @"tables",
                                 @"box" : @"boxes",
                                 @"ox" : @"oxen",
                                 @"axle" : @"axles",
                                 @"radius" : @"radii",
                                 @"trivium" : @"trivia" };
    
    NSMutableArray *pluralArray = [NSMutableArray array];
    
    for (NSString *string in array){
        for (NSString *key in pluralMap){
            if ([string isEqualToString:key]){
                [pluralArray addObject: pluralMap[key]];
            };
        };
    }
    return pluralArray;
    
};

-(NSDictionary *)countsOfWordsInString:(NSString *)string{
    NSString *seperators = @" .,-;";
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:seperators];
    NSArray *newArray = [string componentsSeparatedByCharactersInSet:set];
    NSMutableArray *arrayWithoutSpaces = [NSMutableArray array];
    for (NSString *string in newArray) {
        if (![string isEqualToString:@""]){
            [arrayWithoutSpaces addObject:[string lowercaseString]];
        };
    }
    
    NSArray *distinctArray = [arrayWithoutSpaces valueForKeyPath:@"@distinctUnionOfObjects.self"];
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    for (NSString *distinctWord in distinctArray){
        NSInteger count = 0;
        for (NSString *word in arrayWithoutSpaces){
            if ([word isEqualToString:distinctWord]) {
                count += 1;
            }
            NSNumber *countNumber = @(count);
            dictionary[distinctWord]=countNumber;
        };
    };
    return dictionary;
};


-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array{
    NSLog(@"%@", array);
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    NSMutableArray *artistsAndSongs = [NSMutableArray array];
    NSMutableArray *artists = [NSMutableArray array];
    for (NSString *string in array) {
        NSArray *temp = [string componentsSeparatedByString:@" - "];
        [artistsAndSongs addObject:temp];
        [artists addObject:temp[0]];
    }
    
    NSMutableArray *distinctArtists = [artists valueForKeyPath:@"@distinctUnionOfObjects.self"];
    
    NSLog(@"%@", artistsAndSongs);
    NSLog(@"%@", distinctArtists);
    NSSortDescriptor *sortByNameAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                                                                    ascending:YES
                                                                     selector:@selector(caseInsensitiveCompare:) ];
    for (NSString *artist in distinctArtists){
        NSMutableArray *songs = [NSMutableArray array];
        for (NSArray *array in artistsAndSongs){
            if ([array[0] isEqualToString:artist]){
                [songs addObject:array[1]];
            }
        };
        dictionary[artist] = [songs sortedArrayUsingDescriptors:@[sortByNameAsc]];
    };
    
    NSLog(@"%@", dictionary);
    
    return dictionary;
};


@end
