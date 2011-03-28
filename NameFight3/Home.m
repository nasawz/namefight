    //
//  Home.m
//  NameFight-dp
//
//  Created by wang zhe on 11-3-12.
//  Copyright 2011 nasawz.com. All rights reserved.
//

#import "Home.h"


@implementation Home

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"Home";
		self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Home" image:nil tag:0] autorelease];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
	
	UIImageView * bg_floatView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_float_left.png"]] autorelease];
	[self.view addSubview:bg_floatView];
	
	UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn0 setImage:[UIImage imageNamed:@"btn0.png"] forState:UIControlStateNormal];
	btn0.frame = CGRectMake(32, 185, 122, 44);
	[btn0 addTarget:self action:@selector(personChkin:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn0];
	
	
	UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn1 setImage:[UIImage imageNamed:@"btn1.png"] forState:UIControlStateNormal];
	[btn1 addTarget:self action:@selector(quickFight:) forControlEvents:UIControlEventTouchUpInside];
	btn1.frame = CGRectMake(167, 185, 122, 44);
	[self.view addSubview:btn1];
}

- (void)personChkin:(id)sender {
	TTOpenURL(@"tt://chkin");
}

- (void)quickFight:(id)sender {
	TTOpenURL(@"tt://fight");
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
