//
//  TMGTAddNewEventViewController.h
//  Time Management
//
//  Created by Hou Yongchao on 14-7-26.
//  Copyright (c) 2014年 Hou Yongchao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TMGTEventItem.h"
@interface TMGTAddNewEventViewController : UIViewController<UITextFieldDelegate>
@property TMGTEventItem *eventItem;
@end
