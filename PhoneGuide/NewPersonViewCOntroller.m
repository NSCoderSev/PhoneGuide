//
//  NewPersonViewCOntroller.m
//  PhoneGuide
//
//  Created by Mario Astete Álvarez on 10/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "NewPersonViewCOntroller.h"
#import "Person.h"


@implementation NewPersonViewCOntroller

@synthesize txtName, txtNTelephone, delegate;

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

-(void) textFieldDidEndEditing:(UITextField *)textField{
    
    UIAlertView *alerta;
    
    NSLog(@"Comprobamos si es letra o número");
    
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    if([numberFormatter numberFromString:textField.text]){
    
    }else{
        alerta = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El número de teléfono solo puede tener dígitos!" 
                                           delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        
        [alerta show];
        [alerta release];

    }  
}

-(IBAction) cancel{
    [self dismissModalViewControllerAnimated:YES];	
}

-(IBAction) save{
    if([txtName.text length]<3){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"El nombre debe de ser mayor a 3 caracteres!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        [alert release];
        
    }else {
        Person *newContact = [[Person alloc] init];
        newContact.name = txtName.text;
        newContact.nTelephone = [txtNTelephone.text intValue];
        [delegate insertNewPerson:(Person *) newContact];
        [self dismissModalViewControllerAnimated:YES];	
    }    
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [txtName release];
    [txtNTelephone release];
    [delegate release];
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    txtNTelephone.delegate = self;
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

@end
