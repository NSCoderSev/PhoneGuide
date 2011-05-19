//
//  Person.h
//  PhoneGuide
//
//  Created by Mario Astete Álvarez on 10/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Person : NSObject {
    
    NSString *name;
    int nTelephone;
}

@property (nonatomic, retain) NSString *name;
@property int nTelephone;

@end
