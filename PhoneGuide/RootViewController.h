//
//  RootViewController.h
//  PhoneGuide
//
//  Created by Mario Astete Álvarez on 10/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Person;

@interface RootViewController : UITableViewController {
    
}

-(NSMutableArray *) persons;
-(void) insertNewPerson:(Person *) person;

@end
