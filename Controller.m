//
//  Controller.m
//  Gloom
//
//  Created by ryna4c2e on 09/09/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Controller.h"
#import <ApplicationServices/ApplicationServices.h>

NSString  *GammaDefaultsKey = @"GammaValue";
const float DefaultInterval = 5.0;

static void set_gamma(CGGammaValue gamma)
{
    CGSetDisplayTransferByFormula(kCGDirectMainDisplay,
                                  0, gamma, 1,
                                  0, gamma, 1,
                                  0, gamma, 1);
}


@implementation Controller


- (void)applicationWillFinishLaunching:(NSNotification *)notification
{
    NSStatusBar  *bar  = [NSStatusBar systemStatusBar];
    NSStatusItem *item = [bar statusItemWithLength:NSSquareStatusItemLength];
    
    [item retain];
    
    [item setTitle:       @"🌥️"];
    [item setHighlightMode:YES];
    [item setMenu:menu];
}

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{
    [NSTimer scheduledTimerWithTimeInterval:DefaultInterval
                                     target:self
                                   selector:@selector(updateGamma:)
                                   userInfo:nil
                                    repeats:YES];
}


- (void)awakeFromNib
{
    id defaults = [NSUserDefaults standardUserDefaults];
    
    [self setGamma:[defaults floatForKey:GammaDefaultsKey]];
}


- (void)updateGamma:(id)sender
{
    set_gamma(gamma);
}

- (void)setGamma:(float)g
{
    id defaults = [NSUserDefaults standardUserDefaults];
    
    gamma = g;
    
    [self updateGamma:nil];
    [defaults setFloat:gamma forKey:GammaDefaultsKey];
}

+ (void)initialize
{
    [[NSUserDefaults standardUserDefaults] registerDefaults:
     [NSDictionary
      dictionaryWithObject:[NSNumber numberWithFloat:0.5]
      forKey:GammaDefaultsKey]];
}

@synthesize gamma;

@end
