//
//  DataManager.h
//  MovieCMS
//
//  Created by Paperclipz on 6/12/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginModel.h"

@interface DataManager : JSONModel
@property(nonatomic,strong)LoginModel* loginModel;

+ (id)sharedInstance;

@end
