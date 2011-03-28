//
//  UINavigationBar+Additions.h
//  Three20UI
//
//  Created by wang zhe on 11-3-8.
//  Copyright 2011 nasawz.com. All rights reserved.
//

@implementation UINavigationBar (CustomImage)
- (void)drawRect:(CGRect)rect {
	UIImage *image = [UIImage imageNamed: @"NavigationBar.png"];
	[image drawInRect:CGRectMake(0, 0, self.frame.size.width, 44)];
	
	self.tintColor = RGBCOLOR(54,54,54);
}
@end

