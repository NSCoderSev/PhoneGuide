//
//  PhoneGuideAppDelegate.h
//  PhoneGuide
//
//  Created by Mario Astete Álvarez on 10/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhoneGuideAppDelegate : NSObject <UIApplicationDelegate> {
    
    NSMutableArray *persons;

}



@property (nonatomic, retain) NSMutableArray *persons;

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
