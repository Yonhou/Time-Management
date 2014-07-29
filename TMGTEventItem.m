//
//  TMGTEventItem.m
//  Time Management
//  也许这个软件可以叫做 “时间都去哪了”
//  Created by Hou Yongchao on 14-7-26.
//  Copyright (c) 2014年 Hou Yongchao. All rights reserved.
//

#import "TMGTEventItem.h"

@implementation TMGTEventItem
/*
@dynamic eventName;
@dynamic importance;
@dynamic urgentDegree;
@dynamic quadrant;
@dynamic creationDate;
*/
- (void)calculateQuadrant{
    //self.quadrant
    if (self.importance == 0) {
        if (self.urgentDegree == 0) {
            self.quadrant = quadrant_IV;
        }
        else if(self.urgentDegree == 1){
            self.quadrant = quadrant_III;
        }
    }else if(self.importance == 1){
        if (self.urgentDegree == 0) {
            self.quadrant = quadrant_I;
        }
        else if(self.urgentDegree == 1){
            self.quadrant = quadrant_II;
        }
    }
}
@end
