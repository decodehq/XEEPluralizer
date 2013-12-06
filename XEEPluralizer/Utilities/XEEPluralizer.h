//
//  Pluralizer.h
//  Tulumarka
//
//  Created by Andrija Cajic on 7/1/13.
//  Copyright (c) 2013 Marko Strizic. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Used for 1 item.
 */
static NSString* const kXEEPluralizerFormSingular = @"kXEEPluralizerFormSingular";

/**
 Used for multiple items.
 */
static NSString* const kXEEPluralizerFormPlural = @"kXEEPluralizerFormPlural";

/**
 Used for 2 items. Used in Slovene and some Arabic languages.
 */
static NSString* const kXEEPluralizerFormDual = @"kXEEPluralizerFormDual";

/**
 Used for 3 items. Several Austronesian or Austronesian-based languages such as Tolomako, Lihir, Manam, Bislama, and some registers of Tok Pisin have trial number in their pronouns.
 */
static NSString* const kXEEPluralizerFormTrial = @"kXEEPluralizerFormTrial";

/**
 Used for 4 items.
 */
static NSString* const kXEEPluralizerFormQuadral = @"kXEEPluralizerFormQuadral";

/**
 Used for several items. For example, in Croatian and Serbian this grammatical number is used for 2-4 items.
 */
static NSString* const kXEEPluralizerFormPaucal = @"kXEEPluralizerFormPaucal";

/**
 Used for several items. For example, in Croatian and Serbian this grammatical number is used for 2-4 items.
 */
static NSString* const kXEEPluralizerFormDistributivePlural = @"kXEEPluralizerFormDistributivePlural";


/**
 Used for forming grammatically correct enumerations. Simple work for English language, but tedious for some other (like Croatian, Slovenian, ...).
 More details: http://en.wikipedia.org/wiki/Grammatical_number
 */
@interface XEEPluralizer : NSObject

@property (nonatomic, strong) NSDictionary* wordForms;

/**
 @param wordForms e.g. Croatian word "month" <br/>@{kXEEPluralizerFormSingular : \@"mjesec",
    kXEEPluralizerFormPaucal : \@"mjeseca",
    kXEEPluralizerFormPlural : \@"mjeseci"}
 */
-(id)initWithWordForms:(NSDictionary*)wordForms;

/**
 @param N number of items
 @return e.g. for Croatian word "month" described in documentation of initWithWordForms:. <br/>
 For value of parameter N = 4, paucal grammatical number of the word would be returned - \@"mjeseca".<br/>
 For value of parameter N = 7, plural grammatical number of the word would be returned - \@"mjeseci".<br/>
 */
-(NSString*) pluralizedWordForQuantity:(int)N;

/**
 @param N number of items
 @return
 For value of parameter N = 4, paucal grammatical number of the word would be returned along with the N parameter - \@"4 mjeseca".<br/>
 For value of parameter N = 7, plural grammatical number of the word would be returned along with the N parameter - \@"7 mjeseci".<br/>
 */
-(NSString*) pluralizedSyntagmForQuantity:(int)N;

@end
