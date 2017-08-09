//
//  UIViewExtends.h
//  c6-b2c
//
//  Created by Dealjava on 4/10/17.
//  Copyright © 2017 Tech Creatures. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (UIViewExtends)

+(NSString*)identifier;
+(UINib *)nib;
-(void)setShadow;
-(void)setShadowColor:(UIColor*)color;

@property(nonatomic,assign) CGFloat acumulatedHeight;
@property(nonatomic,assign) CGFloat acumulatedWidth;
@end









//------------------------ UIViewController -------------------//

@interface UIApplication(extend)

+(UIViewController*)topMostController;

@end


//------------------------ UIButton -------------------//

@interface UIButton(button)

-(void)alignVertical:(CGFloat)spacing;

@end
