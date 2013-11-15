//
//  Pluralizer.m
//  Tulumarka
//
//  Created by Andrija Cajic on 7/1/13.
//  Copyright (c) 2013 Marko Strizic. All rights reserved.
//

#import "XEEPluralizer.h"

@implementation XEEPluralizer

-(id)initWithWordForms:(NSDictionary*)wordForms
{
    if (self = [super init]) {
        _wordForms = wordForms;
    }
    return self;
}

-(NSString*)grammaticalNumber:(NSUInteger)N
{
    NSString* lang = [[NSLocale preferredLanguages] objectAtIndex:0];
    if ([@[@"hr", @"sr", @"bs"] containsObject:lang]) { // add accompanying languages, a lot of Slavic languages go here
        return [self grammaticalNumber_HR:N];
    } else if ([@[@"sl"] containsObject:lang]) {
        return [self grammaticalNumber_SL:N];
    } else if (NO) {
        // here you can implement pluralizer for a new language
    } else {
        return [self grammaticalNumber_EN:N]; // This is the case for most of the major world's languages
    }
}
    
/** Croatian, Serbian, Bosnian, Slovenian, ... */
-(NSString*)grammaticalNumber_HR:(NSUInteger)N
{
    N = abs(N) % 100;
    if (N / 10 == 1) {
        // if it is [10-20] it is always plural
        return kXEEPluralizerFormPlural;
    } else {
        if (N % 10 == 1) {
            // if it ends with 1, the following word is in singular
            return kXEEPluralizerFormSingular;
        }
        if (N % 10 == 0 || N % 10 > 4) {
            // if it ends with a digit that is higher than 4, it is plural
            return kXEEPluralizerFormPlural;
        } else {
            // otherwise, it is paucal
            return kXEEPluralizerFormPaucal;
        }
    }
}
    
/** English, German, French, Spanish, Italian, ... */
-(NSString*)grammaticalNumber_EN:(NSUInteger)N
{
    N = abs(N);
    return N == 1 ? kXEEPluralizerFormSingular : kXEEPluralizerFormPlural;
}
    
/** Slovenian, ... */
-(NSString*)grammaticalNumber_SL:(NSInteger)N
{
    N = abs(N) % 100;
    if (N == 2) {
        return kXEEPluralizerFormDual;
    }
    if (N / 10 == 1) {
        // if it is [10-20] it is always plural
        return kXEEPluralizerFormPlural;
    } else {
        if (N % 10 == 1) {
            // if it ends with 1, the following word is in singular
            return kXEEPluralizerFormSingular;
        }
        if (N % 10 == 0 || N % 10 > 4) {
            // if it ends with a digit that is higher than 4, it is plural
            return kXEEPluralizerFormPlural;
        } else {
            // otherwise, it is paucal
            return kXEEPluralizerFormPaucal;
        }
    }
}

-(NSString*) pluralizedWordForQuantity:(NSInteger)N
{
    if (![self.wordForms objectForKey:[self grammaticalNumber:N]]) {
        return [self.wordForms objectForKey:[self grammaticalNumber_EN:N]]; // in case a word is not provided for some grammatical number, fall back to English (if N != 1, it is plural)
    }
    return [self.wordForms objectForKey:[self grammaticalNumber:N]];
}

-(NSString*) pluralizedSyntagmForQuantity:(NSInteger)N
{
    return [NSString stringWithFormat:@"%d %@", N, [self pluralizedWordForQuantity:N]];
}

@end
