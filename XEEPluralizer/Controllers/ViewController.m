//
//  ViewController.m
//  XEEPluralizer
//
//  Created by Andrija Cajic on 15/11/13.
//  Copyright (c) 2013 Andrija Cajic. All rights reserved.
//

#import "ViewController.h"
#import "XEEPluralizer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    XEEPluralizer* pluralizerWolf = [[XEEPluralizer alloc] initWithWordForms:@{kXEEPluralizerFormSingular : NSLocalizedString(@"wolfSingular", nil),
                                                                               kXEEPluralizerFormPlural : NSLocalizedString(@"wolfPlural", nil),
                                                                               kXEEPluralizerFormPaucal : NSLocalizedString(@"wolfPaucal", nil)
                                                                               }];
    
    for (int i = 0; i< 10; i++) {
        int N = arc4random() % 100;
        NSLog(@"%@", [pluralizerWolf pluralizedSyntagmForQuantity:N]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
