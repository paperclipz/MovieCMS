//
//  MenuTableViewCell.h
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuTableViewCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *ibImageView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;

-(void)SelectedView:(UIImage*)selectedImage UnselectedView:(UIImage*)unSelectedImage Title:(NSString*)title;

@end

