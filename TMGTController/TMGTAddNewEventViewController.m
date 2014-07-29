//
//  TMGTAddNewEventViewController.m
//  Time Management
//
//  Created by Hou Yongchao on 14-7-26.
//  Copyright (c) 2014年 Hou Yongchao. All rights reserved.
//

#import "TMGTAddNewEventViewController.h"

@interface TMGTAddNewEventViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldEventName;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmtControImportance;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmtControUrgentDegree;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sureButton;

@end

@implementation TMGTAddNewEventViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (sender != self.sureButton) {
        return;
    }else{
        self.eventItem = [[TMGTEventItem alloc] init];
        self.eventItem.eventName = self.textFieldEventName.text;
        self.eventItem.importance = self.segmtControImportance.selectedSegmentIndex;
        self.eventItem.urgentDegree =self.segmtControUrgentDegree.selectedSegmentIndex;
        self.eventItem.creationDate = [NSDate date];
        [self.eventItem calculateQuadrant];
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.sureButton.enabled = false;
    // Test code start
    if ([self class] == [TMGTAddNewEventViewController class]) {
        NSLog(@"Yes, You're right");
    }
    // Test code end
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//If textField of event name is empty, disable "Sure" button, otherwise enable it.
- (BOOL)textFieldShouldClear:(UITextField *)textField{
    if (textField == self.textFieldEventName) {
        self.sureButton.enabled = false;
    }
    return YES;
}
//If textField of event name is empty, disable "Sure" button, otherwise enable it.
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([textField.text length] == 0) {
        self.sureButton.enabled = true;
    }
    if ([textField.text length] == 1) {
        if(![string length]){
            self.sureButton.enabled = false;
        }
    }
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == self.textFieldEventName) {
        [self.textFieldEventName resignFirstResponder];
    }
    
    return YES;
}

@end
