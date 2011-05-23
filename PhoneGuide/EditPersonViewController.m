//
//  EditPersonViewController.m
//  PhoneGuide
//
//  Created by Mario Astete Álvarez on 11/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "EditPersonViewController.h"
#import "Person.h"


@implementation EditPersonViewController


@synthesize txtName, txtNTelephone, delegate, person;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(BOOL) textField:(UITextField *) textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    NSLog(@"Comprobamos la longitud de la cadena %i", textField.text.length);
    
    UIAlertView *alerta;
    
    if(textField.text.length < 9 || [string stringByTrimmingCharactersInSet:[NSCharacterSet controlCharacterSet]].length == 0){
        return YES;
    }else{
        alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El número de teléfono no puede sobrepasar los 9 dígitos!" 
                                           delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alerta show];
        [alerta release];
        
        return NO;
    }
    
}

- (void)dealloc
{   
    [txtName release];
    [txtNTelephone release];
    [person release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{   
    txtName.text = person.name;
    txtNTelephone.text = [NSString stringWithFormat:@"%i", person.nTelephone];
    
    txtNTelephone.delegate = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void) viewWillDisappear:(BOOL)animated{
    NSLog(@"Edit personn");
    self.person.name = txtName.text;
    self.person.nTelephone = [txtNTelephone.text intValue];
}

@end
