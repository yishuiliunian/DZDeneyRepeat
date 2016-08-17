//
//  DZViewController.m
//  DZDeneyRepeat
//
//  Created by stonedong on 08/17/2016.
//  Copyright (c) 2016 stonedong. All rights reserved.
//

#import "DZViewController.h"
#import <DZDeneyRepeat/DZDeneyRepeat.h>
@interface DZViewController ()
@property (nonatomic, weak) IBOutlet UIButton* button;
@end

@implementation DZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    DZInjectionDeneyRepeatLogic(self.button, 2);
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickTest:(id)sender{
    NSLog(@"clicked");
}
@end
