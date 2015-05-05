//
//  Draw2D.m
//  MyArt
//
//  Created by Esteban Mac on 26/01/15.
//  Copyright (c) 2015 OM. All rights reserved.
//

#import "Draw2D.h"

@implementation Draw2D

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextFillRect(context, self.bounds);

}

-(void)drawRectangle{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context,
                                     [UIColor blueColor].CGColor);
    CGRect rectangle =  CGRectMake(60,170,200,80);
    CGContextAddRect(context, rectangle);
    CGContextStrokePath(context);
    CGContextSetFillColorWithColor(context,
                                   [UIColor blueColor].CGColor);
    CGContextFillRect(context, rectangle);
}

-(void)drawCircle{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context,
                                     [UIColor blueColor].CGColor);
    CGRect rectangle = CGRectMake(60,170,200,80);
    CGContextAddEllipseInRect(context, rectangle);
    CGContextStrokePath(context);
}


-(void)drawSingleLine{
    // Drawing code
    //we first need to obtain the graphics context for the view
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //Once the context has been obtained, the width of the line we plan to draw needs to be specified:
    CGContextSetLineWidth(context, 2.0);
    
    //Color reference
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.0, 0.0, 1.0, 1.0};
    CGColorRef color = CGColorCreate(colorspace, components);
    
    //Using the color reference and the context we can now specify
    //that the color is to be used when drawing the line:
    CGContextSetStrokeColorWithColor(context, color);
    
    //The next step is to move to the start point of the line that is going to be drawn:
    CGContextMoveToPoint(context, 30, 30);
    
    //We now need to specify the end point of the line, in this case 300, 400:
    CGContextAddLineToPoint(context, 300, 400);
    
    //Having defined the line width, color and path, we are ready
    //to draw the line and release the colorspace and color reference objects:
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
}


@end
