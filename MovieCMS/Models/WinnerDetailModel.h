//
//  WinnerDetailModel.h
//  MovieCMS
//
//  Created by Paperclipz on 6/6/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "JSONModel.h"

@interface WinnerDetailModel : JSONModel

@property(strong,nonatomic)NSString* name;
@property(strong,nonatomic)NSString* nric;
@property(strong,nonatomic)NSString* prize;
@property(strong,nonatomic)NSString* location;
@property(strong,nonatomic)NSString* time;

@end
