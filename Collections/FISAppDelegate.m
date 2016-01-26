//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array{
    NSSortDescriptor *sortByNilAsc = [NSSortDescriptor sortDescriptorWithKey:nil
                    ascending:YES];
    return [array sortedArrayUsingDescriptors:@[sortByNilAsc]];
}

-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array{
    NSSortDescriptor *sortByNilDesc = [NSSortDescriptor sortDescriptorWithKey:nil
                    ascending:NO];
    return [array sortedArrayUsingDescriptors:@[sortByNilDesc]];
}

-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array{
    NSMutableArray *newArray = [array mutableCopy];
    [newArray exchangeObjectAtIndex:0 withObjectAtIndex:[array count] - 1];
    return newArray;
}

-(NSArray *)arrayByReversingArray:(NSArray *)array{
    return [[array reverseObjectEnumerator] allObjects];
}

-(NSString *)stringInBasicLeetFromString:(NSString *)string{
    NSDictionary *l33t = @{@"a": @"4",
                           @"s": @"5",
                           @"i": @"1",
                           @"l": @"1",
                           @"e": @"3",
                           @"t": @"7"};
    
    NSString *newString = [string copy];
    
    for (NSString *letter in [l33t allKeys]) {
        newString = [newString stringByReplacingOccurrencesOfString:letter withString:l33t[letter]];
    }
    
    return newString;
}

-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array{
    NSPredicate *negativePredicate = [NSPredicate predicateWithFormat:@"self < 0"];
    NSPredicate *positivePredicate = [NSPredicate predicateWithFormat:@"self >= 0"];
    return @[[array filteredArrayUsingPredicate:negativePredicate], [array filteredArrayUsingPredicate:positivePredicate]];
}

-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)dictionary{
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    for (NSString *name in [dictionary allKeys]) {
        if ([dictionary[name] isEqualToString:@"hobbit"]) {
            [result addObject:name];
        }
    }
                              
    return result;
}

-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array{
    NSPredicate *aPredicate = [NSPredicate predicateWithFormat:@"self BEGINSWITH[c] 'a'"];
    return [array filteredArrayUsingPredicate:aPredicate];
}

-(NSInteger)sumOfIntegersInArray:(NSArray *)array{
    NSInteger sum = 0;
    for (NSNumber *num in array) {
        sum += [num integerValue];
    }
    return sum;
}

-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array{
    // even attempting this makes my linguistics nerd brain cry
    NSMutableArray *result = [@[] mutableCopy];
    
    NSDictionary *irregularWords = @{@"foot": @"feet", @"ox": @"oxen"};
    NSDictionary* irregularEndings = @{@"ium": @"ia", @"ius": @"ii", @"y": @"ies"};
    NSRegularExpression* sibilantConsonantEndings = [NSRegularExpression regularExpressionWithPattern:@"s$|z$|ch$|sh$|x$" options:0 error:nil];
    
    for (NSString *word in array) {
        if ([[irregularWords allKeys] containsObject:word]) {
            [result addObject:irregularWords[word]];
        }
        else {
            BOOL pluralized = NO;
            for (NSString *ending in [irregularEndings allKeys]) {
                if ([word hasSuffix:ending]) {
                    if ([ending isEqualToString:@"y"] && [@[@"a", @"e", @"i", @"o", @"u"] containsObject:[NSString stringWithFormat:@"%c", [word characterAtIndex:[word length] - 2]]]) {
                        break;
                    }
                    NSRange suffixRange = NSMakeRange([word length] - [ending length], [ending length]);
                    [result addObject:[word stringByReplacingOccurrencesOfString:ending withString:irregularEndings[ending] options:0 range:suffixRange]];
                    pluralized = YES;
                    break;
                }
            }
            if (pluralized) {
                continue;
            }
            else if ([sibilantConsonantEndings firstMatchInString:word options:0 range:NSMakeRange(0, [word length])]) {
                [result addObject:[word stringByAppendingString:@"es"]];
            }
            else {
                [result addObject:[word stringByAppendingString:@"s"]];
            }
        }
    }
    
    return result;
}

-(NSDictionary *)countsOfWordsInString:(NSString *)string{
    NSString *lowercase = [string lowercaseString];
    NSArray *words = [lowercase componentsSeparatedByCharactersInSet:[[NSCharacterSet letterCharacterSet] invertedSet]];
    NSMutableDictionary *counts = [@{} mutableCopy];
    for (NSString *word in words) {
        if ([word length]) {
            if (counts[word]) {
                counts[word] = @([counts[word] integerValue] + 1);
            }
            else {
                counts[word] = @1;
            }
        }
    }
    return counts;
}

-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)songList{
    NSMutableDictionary *songsByArtist = [@{} mutableCopy];
    NSSortDescriptor *sortAsc = [NSSortDescriptor sortDescriptorWithKey:@"self"
                    ascending:YES
                     selector:@selector(caseInsensitiveCompare:) ];
    for (NSString *song in songList) {
        NSArray *splitSong = [song componentsSeparatedByString:@" - "];
        NSString *artist = splitSong[0];
        NSString *songName = splitSong[1];
        if (songsByArtist[artist]) {
            [songsByArtist[artist] addObject:songName];
            // prob inefficient to alphabetize every time but ¯\_(ツ)_/¯
            [songsByArtist[artist] sortUsingDescriptors:@[sortAsc]];
        }
        else {
            songsByArtist[artist] = [@[songName] mutableCopy];
        }
    }
    return songsByArtist;
}


@end
