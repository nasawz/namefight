    //
//  Fight.m
//  NameFight-dp
//
//  Created by wang zhe on 11-3-12.
//  Copyright 2011 nasawz.com. All rights reserved.
//

#import "Fight.h"
#import "AppDelegate.h"

#import "Person.h"

@implementation Fight
@synthesize player1 = _player1;
@synthesize player2 = _player2;

NSTimer *timer;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		self.title = @"Fight";
		self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Fight" image:nil tag:0] autorelease];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
    
    /*
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate * delegate = app.delegate;
    
	NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[delegate managedObjectContext]];
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:nil];
	NSArray *descriptors = [NSArray arrayWithObject:sortDescriptor];
	[fetchRequest setSortDescriptors:descriptors];
    //[descriptors release];
    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name contains[cd] %@", @"王"];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *array = [[delegate managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    if (array == nil)
    {
        // Deal with error...
    }else{
        //NSLog(@"%d",[array count]);
        //NSLog(@"player 1 %@",((Person *)[array objectAtIndex:0]).name);
        self.player1 = (Person *)[array objectAtIndex:0];
        blood1 = [[NSNumber numberWithInt:([self.player1.vit intValue] * 5)] retain];
        NSLog(@"set player1 : %@",self.player1.name);
    }
    
    ////////////
    NSFetchRequest *fetchRequest2 = [[[NSFetchRequest alloc] init] autorelease];
    [fetchRequest2 setEntity:entity];
    
    //NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:nil];
	//NSArray *descriptors = [NSArray arrayWithObject:sortDescriptor];
	[fetchRequest2 setSortDescriptors:descriptors];
    //[descriptors release];
    
    
    NSPredicate *predicate2 = [NSPredicate predicateWithFormat:@"name contains[cd] %@", @"萧"];
    [fetchRequest2 setPredicate:predicate2];
    
    NSError *error2 = nil;
    NSArray *array2 = [[delegate managedObjectContext] executeFetchRequest:fetchRequest2 error:&error2];
    if (array2 == nil)
    {
        // Deal with error...
    }else{
        //NSLog(@"%d",[array2 count]);
        //NSLog(@"player 2 %@",((Person *)[array2 objectAtIndex:0]).name);
        self.player2 = (Person *)[array2 objectAtIndex:0];
        blood2 = [[NSNumber numberWithInt:([self.player2.vit intValue] * 5)] retain];
        NSLog(@"set player2 : %@",self.player2.name);
    }   
    
    
    timer = [NSTimer scheduledTimerWithTimeInterval: 0.50
                                             target: self
                                           selector:@selector(onTimer:)
                                           userInfo: nil repeats:YES];
    
    
    [self.player1 setValue:[NSNumber numberWithInt:100] forKey:@"win"]; 
    //[[delegate managedObjectContext] updatedObjects];
    NSError * error3;
	if (![[delegate managedObjectContext] save:&error]) {
		NSLog(@"Error %@",[error3 localizedDescription]);
	}
     */
}
- (void) onTimer:(NSTimer*)theTimer {
    
    if (rand()%10 > 5) {
        
        NSNumber * num = [NSNumber numberWithInt:(rand()%10)];
        blood2 = [[NSNumber numberWithInt:([blood2 intValue] - [num intValue])] retain];
        NSLog(@"%@打了%@一拳,%@损失了%@点血。%@点血剩余",self.player1.name,self.player2.name,self.player2.name,num,blood2);
    }else{
        NSNumber * num = [NSNumber numberWithInt:(rand()%10)];
        blood1 = [[NSNumber numberWithInt:([blood1 intValue] - [num intValue])] retain];
        NSLog(@"%@打了%@一拳,%@损失了%@点血。%@点血剩余",self.player2.name,self.player1.name,self.player1.name,num,blood1);
    }
    
    if ([blood1 intValue]<0) {
        NSLog(@"%@打败了%@",self.player2.name,self.player1.name);
        [theTimer invalidate];
    }
    
    if ([blood2 intValue]<0) {
        NSLog(@"%@打败了%@",self.player1.name,self.player2.name);
        [theTimer invalidate];
    }
    //self.player2.win = 10;
    //[self.player2 setWin:[NSNumber numberWithInt:10]];
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
