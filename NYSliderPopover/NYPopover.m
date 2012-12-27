//
//  NYPopover.m
//  NYReader
//
//  Created by Cassius Pacheco on 21/12/12.
//  Copyright (c) 2012 Nyvra Software. All rights reserved.
//

#import "NYPopover.h"

@implementation NYPopover

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //Default values, can be changed after
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.imageView.image = [UIImage imageNamed:@"NYPopoverBackground.png"];
        [self addSubview:self.imageView];
        
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont boldSystemFontOfSize:13];
        self.textLabel.textAlignment = UITextAlignmentCenter;
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        
        [self addSubview:self.textLabel];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    self.imageView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    CGFloat y = (frame.size.height - 26) / 3;
    
    if (frame.size.height < 38)
        y = 0;
    
    self.textLabel.frame = CGRectMake(0, y, frame.size.width, 26);
}

@end
