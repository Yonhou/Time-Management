//
//  TMGTEventItem.h
//  Time Management
//
//  Created by Hou Yongchao on 14-7-26.
//  Copyright (c) 2014年 Hou Yongchao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMGTEventItem : NSObject
@property NSString *eventName;
@property NSDate *creationDate;
@property NSInteger importance;
@property NSInteger urgentDegree;
@property NSInteger quadrant;

- (void)calculateQuadrant;
//Four quadrants of time management:
//                        Important
//                            ^
//                            |
//                            |
//                            |
//               II           |         I
//                            |
//                            |
//Urgent<---------------------+----------------------
//                            |
//                            |
//              III           |         IV
//                            |
//                            |
//                            |
@end

enum{
    quadrant_I = 1,
    quadrant_II,
    quadrant_III,
    quadrant_IV
};