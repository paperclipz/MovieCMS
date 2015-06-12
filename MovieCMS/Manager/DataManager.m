//
//  DataManager.m
//  MovieCMS
//
//  Created by Paperclipz on 6/12/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "DataManager.h"

@implementation DataManager

+ (id)sharedInstance {
    static DataManager *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}

@end
