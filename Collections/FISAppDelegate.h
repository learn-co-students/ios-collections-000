//  FISAppDelegate.h

#import <UIKit/UIKit.h>

@interface FISAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

/**
 
 * Declare your methods here.
 
 */

-(NSArray *)arrayBySortingArrayAscending:(NSArray *)array;
-(NSArray *)arrayBySortingArrayDescending:(NSArray *)array;
-(NSArray *)arrayBySwappingFirstObjectWithLastObjectInArray:(NSArray *)array;
-(NSArray *)arrayByReversingArray:(NSArray *)array;
-(NSString *)stringInBasicLeetFromString:(NSString *)array;
-(NSArray *)splitArrayIntoNegativesAndPositives:(NSArray *)array;
-(NSArray *)namesOfHobbitsInDictionary:(NSDictionary *)array;
-(NSArray *)stringsBeginningWithAInArray:(NSArray *)array;
-(NSInteger)sumOfIntegersInArray:(NSArray *)array;
-(NSArray *)arrayByPluralizingStringsInArray:(NSArray *)array;
-(NSDictionary *)countsOfWordsInString:(NSString *)array;
-(NSDictionary *)songsGroupedByArtistFromArray:(NSArray *)array;


@end
