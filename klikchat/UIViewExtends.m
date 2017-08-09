//
//  UIViewExtends.m
//  c6-b2c
//
//  Created by Dealjava on 4/10/17.
//  Copyright © 2017 Tech Creatures. All rights reserved.
//

#import "UIViewExtends.h"

@implementation UIView (UIViewExtends)

@dynamic acumulatedHeight,acumulatedWidth;

+(NSString*)identifier{
    return NSStringFromClass(self);
}

+(UINib *)nib{
    return [UINib nibWithNibName:[self identifier] bundle:nil];
}

-(void)setShadow{
    [self setShadowColor:[UIColor blackColor]];
}

-(void)setShadowColor:(UIColor *)color{
    self.layer.shadowColor = color.CGColor;
    self.layer.shadowOpacity = 0.2;
    self.layer.shadowRadius = 5;
    self.layer.shadowOffset = CGSizeMake(0.5, 1);
    self.layer.masksToBounds = NO;
}

-(CGFloat)acumulatedWidth{
    return self.bounds.size.width + self.frame.origin.x;
}

-(CGFloat)acumulatedHeight{
    return self.bounds.size.height + self.frame.origin.y;
}

@end










//------------------------ UIViewController -------------------//

@implementation UIApplication(extend)

+ (UIViewController*) topMostController
{
    UIViewController *topController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    while (topController.presentedViewController) {
        topController = topController.presentedViewController;
    }
    
    return topController;
}

@end




//------------------------ UIButton -------------------//
@implementation UIButton(button)
-(void)alignVertical:(CGFloat)spacing {
    if(self.imageView.image == nil ){ return; }
    if (self.titleLabel.text == nil) {return;}
    
    self.titleEdgeInsets = UIEdgeInsetsMake(0, -self.imageView.image.size.width, -(self.imageView.image.size.height + spacing), 0);
    CGSize titlesize = [self.titleLabel.text sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
    
    self.imageEdgeInsets = UIEdgeInsetsMake(-(titlesize.height + spacing), 0, 0, -titlesize.width);
    CGFloat edgeOffset = fabs(titlesize.height - self.imageView.image.size.height) / 2.0;
    self.contentEdgeInsets = UIEdgeInsetsMake(edgeOffset, 0,edgeOffset, 0);
    
}

@end
