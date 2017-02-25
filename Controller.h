//
//  Controller.h
//  Gloom
//
//  Created by ryna4c2e on 09/09/24.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Controller : NSObject {
	IBOutlet NSMenu *menu; // the menu placed on the top of main screen.
  
  float gamma;
}


@property(nonatomic) float gamma;

@end
