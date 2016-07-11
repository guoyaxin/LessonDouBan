//
//  OwnerModel.m
//  LessonDouBan
//
//  Created by CLT on 16/6/27.
//  Copyright © 2016年 yaxin.guo. All rights reserved.
//

#import "OwnerModel.h"

@implementation OwnerModel

- (NSString *)description
{
    return [NSString stringWithFormat:@"ID = %@", self.ID];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _ID = value;
    }
}

@end
