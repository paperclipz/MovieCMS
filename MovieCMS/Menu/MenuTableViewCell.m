//
//  MenuTableViewCell.m
//  MovieCMS
//
//  Created by Paperclipz on 6/1/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "MenuTableViewCell.h"
@interface MenuTableViewCell()

@property(nonatomic,strong)UIImage* selectedImage;
@property(nonatomic,strong)UIImage* UnSelectedImage;

@end
@implementation MenuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        NSArray *objects = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil];
        
        for (id currentObject in objects ){
            if ([currentObject isKindOfClass:[self class]]) {
                
                [currentObject initSelfView];
                
                return currentObject;
            }
        }
        return nil;
        
        
    }
    return self;
}

-(void)initSelfView
{
}
- (void)awakeFromNib {
    // Initialization code

}

-(void)SelectedView:(UIImage*)selectedImage UnselectedView:(UIImage*)unSelectedImage Title:(NSString*)title
{
    self.selectedImage = selectedImage;
    self.UnSelectedImage = unSelectedImage;
    self.lblTitle.text = [[LanguageManager sharedManager] languageSelectedStringForKey:title];
    NSLog(@"cell language is == %@",[[LanguageManager sharedManager] languageSelectedStringForKey:title]);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];
    self.ibImageView.image = selected?self.selectedImage:self.UnSelectedImage;
    self.lblTitle.textColor = selected?[UIColor colorWithRed:(53/255.0) green:(172/255.0) blue:(166/255.0) alpha:1]:[UIColor whiteColor];


    // Configure the view for the selected state
}

@end
