//
//  MenuSelectionCVCell.m
//  MovieCMS
//
//  Created by Paperclipz on 6/2/15.
//  Copyright (c) 2015 AppDesignStudio. All rights reserved.
//

#import "MenuSelectionCVCell.h"
@interface MenuSelectionCVCell()
@property (strong, nonatomic) IBOutlet UIImageView *ibBackgroundImageView;
@property (strong, nonatomic) IBOutlet UILabel *lblTitle;
@property (strong, nonatomic) IBOutlet UIImageView *ibImg;
@property (strong, nonatomic) NSString* imageName;

@end
@implementation MenuSelectionCVCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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

-(void)setIndex:(int)index Selected:(BOOL)selected
{
    if (index == 0) {
        self.imageName = @"002_6plus_list_";
        self.lblTitle.text = @"CONTEST";
    }
    else{
        self.imageName = @"002_6plus_winner_";
        self.lblTitle.text = @"WINNER";

    }
    [self setAsSelected:selected];
}

-(void)setAsSelected:(BOOL)selected
{
    
    self.ibBackgroundImageView.frame = CGRectMake(self.ibBackgroundImageView.frame.origin.x,self.ibBackgroundImageView.frame.origin.y, self.ibBackgroundImageView.frame.size.width, self.ibBackgroundImageView.frame.size.height);
    self.ibBackgroundImageView.backgroundColor = selected?[Utils getProjectColor]:[UIColor whiteColor];
    self.backgroundColor = selected?[UIColor whiteColor]:[Utils getProjectColor];
    NSString* strImagename = [NSString stringWithFormat:@"%@%@",self.imageName,selected?@"selected.png":@"nonselected.png"];
    self.ibImg.image = [UIImage imageNamed:strImagename];
    self.lblTitle.textColor = selected?[UIColor whiteColor]:[Utils getProjectColor];
}
@end
