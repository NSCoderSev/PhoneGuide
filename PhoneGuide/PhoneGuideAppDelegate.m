//
//  PhoneGuideAppDelegate.m
//  PhoneGuide
//
//  Created by Mario Astete Álvarez on 10/04/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PhoneGuideAppDelegate.h"
#import "Person.h"

@implementation PhoneGuideAppDelegate

@synthesize persons;

@synthesize window=_window;

@synthesize navigationController=_navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //Initialize var
        
    NSString *path;
    path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"person.plist"];
    if([[NSFileManager defaultManager] fileExistsAtPath:path]){
        
        self.persons = [[NSMutableArray alloc] init];
        
        NSArray *aux = [[NSArray alloc] initWithContentsOfFile:path];
        for (int i=0; i<[aux count]; i++) {
            NSDictionary *dic = (NSDictionary *) [aux objectAtIndex:i];
            Person *p = [[Person alloc] init];
            p.name = [dic objectForKey:@"name"];
            p.nTelephone = [(NSNumber *) [dic objectForKey:@"nTelephone"] intValue];
            [self.persons addObject:p];
            [p release];
        }
        [aux release];
    }else{
        self.persons = [[NSMutableArray alloc] init];

    }
    
    
    // Override point for customization after application launch.
    // Add the navigation controller's view to the window and display.
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    //Save data in .plist
    NSMutableArray *aux = [[NSMutableArray alloc] init];
    for (int i=0; i<[self.persons count]; i++) {
        Person *p = [self.persons objectAtIndex:i];
        NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:p.name, @"name", [NSNumber numberWithInt:p.nTelephone] , @"nTelephone", nil];
        [aux addObject:dictionary];
        [aux release];
    }
    NSLog(@"Escribimos el fichero en la ruta de documents del iphone");
    NSString *path;
    path = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingPathComponent:@"person.plist"];
    [aux writeToFile:path atomically:YES];
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [self.persons release];
    [super dealloc];
}

@end
