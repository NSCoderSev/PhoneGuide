//
//  Person.m
//  PhoneGuide
//
//  Created by Mario Astete Álvarez on 10/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Person.h"


@implementation Person

@synthesize name, nTelephone;

//Para liberar memoria de atributos
-(void) dealloc{
    [self.name release];
    [super dealloc];
}

@end
