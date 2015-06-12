//
//  LoginModel.h
//  MovieCMS
//
//  Created by Paperclipz on 6/11/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "Model.h"

@interface LoginModel : Model
@property(strong,nonatomic)NSString* uacc_id;
@property(strong,nonatomic)NSString* uacc_email;
@property(strong,nonatomic)NSString* uacc_username;

@end
