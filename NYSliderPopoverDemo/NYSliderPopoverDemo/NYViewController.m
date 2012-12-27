//
//  NYViewController.m
//  NYSliderPopoverDemo
//
//  Created by Cassius Pacheco on 27/12/12.
//  Copyright (c) 2012 Nyvra Software. All rights reserved.
//

#import "NYViewController.h"
#import "NYSliderPopover.h"

@interface NYViewController ()

@property (nonatomic, strong) IBOutlet NYSliderPopover *slider;

- (IBAction)sliderValueChanged:(id)sender;

@end

@implementation NYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Custom frame popover
    //self.slider.popover.frame = CGRectMake(0, 0, 100, 50);
    
    //Custom image
    //self.slider.popover.imageView.image = [UIImage imageNamed:@""];
    
    //Custom textLabel
    //self.slider.popover.textLabel.textColor = [UIColor redColor];
    
    //Initial text
    [self updateSliderPopoverText];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    //Show popover
    //[self.slider showPopoverAnimated:YES];
}

- (IBAction)sliderValueChanged:(id)sender
{
    [self updateSliderPopoverText];
}

- (void)updateSliderPopoverText
{
    self.slider.popover.textLabel.text = [NSString stringWithFormat:@"%.2f", self.slider.value];
}

@end
