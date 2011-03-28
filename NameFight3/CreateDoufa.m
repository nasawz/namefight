//
//  CreateDoufa.m
//  NameFight3
//
//  Created by wang zhe on 11-3-19.
//  Copyright 2011年 nasawz.com. All rights reserved.
//

#import "CreateDoufa.h"
#import "AppDelegate.h"

#import "Doufa.h"


@implementation CreateDoufa

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"Create Doufa";
		self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Doufa" image:nil tag:0] autorelease];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/**/
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    
    nameField = [[UITextField alloc] initWithFrame:CGRectMake(8, 8, 200, 24)];
    nameField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:nameField];
    
    
    topField = [[UITextField alloc] initWithFrame:CGRectMake(8, 38, 200, 24)];
    topField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:topField];
    
    
    subField = [[UITextField alloc] initWithFrame:CGRectMake(8, 68, 200, 24)];
    subField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:subField];
    
    UIButton * btn =[UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(8, 98, 80, 24);
    [btn addTarget:self action:@selector(createdf:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
     
}

- (void)createdf:(id)sender {
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate * delegate = app.delegate;
    
	//天-3 地-2 玄-1 黄-0
	//高-2 中-1 低-0
    Doufa * doufa = (Doufa *)[NSEntityDescription insertNewObjectForEntityForName:@"Doufa" inManagedObjectContext:[delegate managedObjectContext]];  
    doufa.name = nameField.text;
	doufa.toplevel=[NSNumber numberWithInt:[topField.text intValue]];
	doufa.sublevel=[NSNumber numberWithInt:[subField.text intValue]];
    
    NSError *error = nil;
    if (![[delegate managedObjectContext] save:&error]) {
        NSLog(@"Error %@",[error localizedDescription]);
    }else{
        NSLog(@"成功创建斗法：%@",doufa.name);
    }  
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
