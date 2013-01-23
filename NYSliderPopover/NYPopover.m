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
        
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.textLabel.textColor = [UIColor whiteColor];
        self.textLabel.font = [UIFont boldSystemFontOfSize:13];
        self.textLabel.textAlignment = UITextAlignmentCenter;
        self.textLabel.adjustsFontSizeToFitWidth = YES;
        self.opaque = NO;
        
        [self addSubview:self.textLabel];
    }
    
    return self;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGFloat y = (frame.size.height - 26) / 3;
    
    if (frame.size.height < 38)
        y = 0;
    
    self.textLabel.frame = CGRectMake(0, y, frame.size.width, 26);
}

- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();

    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 0.267 green: 0.303 blue: 0.335 alpha: 1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 0.04 green: 0.04 blue: 0.04 alpha: 1];
    UIColor* shadowColor2 = [UIColor colorWithRed: 0.524 green: 0.553 blue: 0.581 alpha: 0.3];

    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientColor.CGColor,
                               (id)gradientColor2.CGColor, nil];
    CGFloat gradientLocations[] = {0, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);

    //// Shadow Declarations
    UIColor* innerShadow = shadowColor2;
    CGSize innerShadowOffset = CGSizeMake(0, 1.5);
    CGFloat innerShadowBlurRadius = 0.5;

    //// Frames
    CGRect frame = self.bounds;

    //// Subframes
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 11) * 0.51724 + 0.5), CGRectGetMinY(frame) + CGRectGetHeight(frame) - 9, 11, 9);


    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 0.5, CGRectGetMinY(frame) + 4.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 0.5, CGRectGetMaxY(frame) - 11.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 4.5, CGRectGetMaxY(frame) - 7.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 0.5, CGRectGetMaxY(frame) - 9.29) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 2.29, CGRectGetMaxY(frame) - 7.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 10.64, CGRectGetMinY(frame2) + 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 5.5, CGRectGetMinY(frame2) + 8)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 0.36, CGRectGetMinY(frame2) + 1.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 4.5, CGRectGetMaxY(frame) - 7.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.5, CGRectGetMaxY(frame) - 11.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 2.29, CGRectGetMaxY(frame) - 7.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.5, CGRectGetMaxY(frame) - 9.29)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.5, CGRectGetMinY(frame) + 4.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 4.5, CGRectGetMinY(frame) + 0.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.5, CGRectGetMinY(frame) + 2.29) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 2.29, CGRectGetMinY(frame) + 0.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 4.5, CGRectGetMinY(frame) + 0.5)];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 0.5, CGRectGetMinY(frame) + 4.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 2.29, CGRectGetMinY(frame) + 0.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 0.5, CGRectGetMinY(frame) + 2.29)];
    [bezierPath closePath];
    CGContextSaveGState(context);
    [bezierPath addClip];
    CGRect bezierBounds = bezierPath.bounds;
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMinY(bezierBounds)),
                                CGPointMake(CGRectGetMidX(bezierBounds), CGRectGetMaxY(bezierBounds)),
                                0);
    CGContextRestoreGState(context);

    ////// Bezier Inner Shadow
    CGRect bezierBorderRect = CGRectInset([bezierPath bounds], -innerShadowBlurRadius, -innerShadowBlurRadius);
    bezierBorderRect = CGRectOffset(bezierBorderRect, -innerShadowOffset.width, -innerShadowOffset.height);
    bezierBorderRect = CGRectInset(CGRectUnion(bezierBorderRect, [bezierPath bounds]), -1, -1);

    UIBezierPath* bezierNegativePath = [UIBezierPath bezierPathWithRect: bezierBorderRect];
    [bezierNegativePath appendPath: bezierPath];
    bezierNegativePath.usesEvenOddFillRule = YES;

    CGContextSaveGState(context);
    {
        CGFloat xOffset = innerShadowOffset.width + round(bezierBorderRect.size.width);
        CGFloat yOffset = innerShadowOffset.height;
        CGContextSetShadowWithColor(context,
                                    CGSizeMake(xOffset + copysign(0.1, xOffset), yOffset + copysign(0.1, yOffset)),
                                    innerShadowBlurRadius,
                                    innerShadow.CGColor);
        
        [bezierPath addClip];
        CGAffineTransform transform = CGAffineTransformMakeTranslation(-round(bezierBorderRect.size.width), 0);
        [bezierNegativePath applyTransform: transform];
        [[UIColor grayColor] setFill];
        [bezierNegativePath fill];
    }
    CGContextRestoreGState(context);
    
    [[UIColor blackColor] setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
