//
//  ViewController.m
//  ExtDisplayDemo
//
//  Created by Chuck Shnider on 2013-05-11.
//  Copyright (c) 2013 Chuck Shnider. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UISwitch *useAutoLayoutSwitch;

@property (strong,nonatomic) UIWindow *secondaryDisplayWindow;

@end

@implementation ViewController

NSString *const kAutoLayoutXib = @"SecondaryAutoLayout";
NSString *const kSpringsStrutsXib = @"SecondarySpringStruts";

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.useAutoLayoutSwitch.on = self.useAutoLayoutOnSecodaryDisplay;
    
    [self checkForSecondaryDisplay];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)useAutoLayoutValueChanged:(id)sender {
    self.useAutoLayoutOnSecodaryDisplay = self.useAutoLayoutSwitch.on;
    [self removeSecondaryDisplayWindow];
    [self checkForSecondaryDisplay];
}

-(void)checkForSecondaryDisplay {
    NSArray *screens = [UIScreen screens];
    if (screens.count > 1) {
        [self secondaryDisplayDidConnect:screens[1]];
    }}


- (void)secondaryDisplayDidConnect:(UIScreen*) secondScreen
{

     if (!self.secondaryDisplayWindow) {
         // Get the screen's bounds so that you can create a window of the correct size.
         CGRect screenBounds = secondScreen.bounds;
         
         self.secondaryDisplayWindow = [[UIWindow alloc] initWithFrame:screenBounds];
         self.secondaryDisplayWindow.screen = secondScreen;
         
         NSString *xibName = self.useAutoLayoutOnSecodaryDisplay ? kAutoLayoutXib : kSpringsStrutsXib;
     
         UIViewController *auxDisplayController = [[UIViewController alloc] initWithNibName:xibName bundle:[NSBundle mainBundle]];

         self.secondaryDisplayWindow.rootViewController = auxDisplayController;
         self.secondaryDisplayWindow.hidden = NO;
     }

}

-(void)secondaryDisplayDidDisconnect {
    [self removeSecondaryDisplayWindow];
}

-(void) removeSecondaryDisplayWindow {
    if (self.secondaryDisplayWindow) {
        // hide and then delete the window.
        self.secondaryDisplayWindow.hidden = YES;
        self.secondaryDisplayWindow = nil;
    }
}


@end
