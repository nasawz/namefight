//
//  CreateDouji.m
//  NameFight-dp
//
//  Created by nasa on 11-3-17.
//  Copyright 2011年 nasawz.com. All rights reserved.
//

#import "CreateDouji.h"
#import "AppDelegate.h"

#import "Douji.h"

@implementation CreateDouji

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"Douji";
		self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Douji" image:nil tag:0] autorelease];
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
    
    
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate * delegate = app.delegate;
    
    Douji * douji = (Douji *)[NSEntityDescription insertNewObjectForEntityForName:@"Douji" inManagedObjectContext:[delegate managedObjectContext]];
//   
	//天-3 地-2 玄-1 黄-0
    //高-2 中-1 低-0
    

//    douji.name = @"八级蹦";
//    douji.usefor = @"1";
//    douji.caption = @"玄阶高级斗技，近身攻击斗技，以攻击力强横著称，炼至大成，攻击暗含八重劲气，八重叠加，威力堪比地阶低级斗技！";
//    douji.toplevel = [NSNumber numberWithInt:1];	
//    douji.sublevel = [NSNumber numberWithInt:2];
//    douji.formatstr = @"%@右拳紧握，身形略微弯曲，犹如一头蓄势待发的怒狮一般，沉寂瞬间，身体犹如离弦的箭，猛冲而出。“八极崩！“心头响起一声沉闷的低喝，在%@那有些惊恐的目光中，狠狠的对碰在了一起。";
//    douji.property = @"act";
    
//    douji.name = @"吸掌";
//    douji.usefor = @"1";
//    douji.caption = @"玄阶低级斗技，炼至大成，可吸千斤巨石，若是遇敌，狂猛吸力，能将人体血液，强行扯出！";
//    douji.toplevel = [NSNumber numberWithInt:1];	
//    douji.sublevel = [NSNumber numberWithInt:0];
//    douji.formatstr = @"%@微眯着眼睛嘴角缓缓的拉起一抹清冷的弧度。摊开的右手，骤然一握，一股凶猛的吸力，自掌心中激射而出：“玄阶斗技：吸掌！”%@双脚下意识的抓紧地面，然而还未等到推力的到来，一股吸力，却是将之扯得猛的朝前一抛。";
//    douji.property = @"agi";    
    
    douji.name = @"铁山拳";
    douji.usefor = @"1";
    douji.caption = @"黄阶高级斗技，威力不俗，需要斗之气七段以上，方才有资格修习";
    douji.toplevel = [NSNumber numberWithInt:0];	
    douji.sublevel = [NSNumber numberWithInt:2];
    douji.formatstr = @"一声暴喝，%@拳头猛的紧握，一股尖锐的破风劲气，在半空中低沉的响起，旋即对着%@肩膀落去";
    douji.property = @"act";        
    
    NSError *error = nil;
    if (![[delegate managedObjectContext] save:&error]) {
        NSLog(@"Error %@",[error localizedDescription]);
    }else{
        NSLog(@"成功创建斗技：%@",douji.name);
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
