//
//  NewPersonViewCOntroller.h
//  PhoneGuide
//
//  Created by Mario Astete Álvarez on 10/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
@class RootViewController;


@interface NewPersonViewCOntroller : UIViewController<UITextFieldDelegate> {
    
    UITextField *txtName;
    UITextField *txtNTelephone;
    RootViewController *delegate;
}

-(IBAction) cancel;
-(IBAction) save;

@property (nonatomic, retain) RootViewController *delegate;
@property (nonatomic, retain) IBOutlet UITextField *txtName;
@property (nonatomic, retain) IBOutlet UITextField *txtNTelephone;

@end