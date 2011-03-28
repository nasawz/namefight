    //
//  PersonChkin.m
//  NameFight-dp
//
//  Created by wang zhe on 11-3-13.
//  Copyright 2011 nasawz.com. All rights reserved.
//

#import "PersonChkin.h"
#import "AppDelegate.h"

#import "Person.h"

@interface PersonChkin (private)
- (NSDictionary *)createPersonProperty:(NSString *)name;
- (void)chkin:(NSString *)name;
- (Douji *)getDouji:(Person *)person;
@end

@implementation PersonChkin
@synthesize nameField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
		 self.title = @"PersonChkin";
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg.png"]]];
	
	
	UIImageView * bg_floatView = [[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_float_right.png"]] autorelease];
	[self.view addSubview:bg_floatView];
    
    
	UIButton *btn0 = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn0 setImage:[UIImage imageNamed:@"btn0.png"] forState:UIControlStateNormal];
	btn0.frame = CGRectMake(32, 60, 122, 44);
	[btn0 addTarget:self action:@selector(fromAddress:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn0];
    
    self.nameField = [[UITextField alloc] initWithFrame:CGRectMake(10, 10, 300, 44)];
    self.nameField.borderStyle = UITextBorderStyleRoundedRect;
	self.nameField.placeholder = @"";
	self.nameField.textAlignment = UITextAlignmentLeft;
    self.nameField.keyboardType = UIKeyboardTypeNamePhonePad;
    self.nameField.returnKeyType = UIReturnKeyDone;
    self.nameField.delegate = self;
	[self.view addSubview: self.nameField];
    
   
    
	UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn1 setImage:[UIImage imageNamed:@"btn0.png"] forState:UIControlStateNormal];
	btn1.frame = CGRectMake(32, 120, 122, 44);
	[btn1 addTarget:self action:@selector(completeChkin:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn1];    
    
	UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
	[btn2 setImage:[UIImage imageNamed:@"btn1.png"] forState:UIControlStateNormal];
	btn2.frame = CGRectMake(167, 120, 122, 44);
	[btn2 addTarget:self action:@selector(ContinueChkin:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:btn2];  
    
    
    UIButton * blackground = [UIButton buttonWithType:UIButtonTypeCustom];
    blackground.frame = self.view.frame;
    [blackground addTarget:self action:@selector(blackgroundClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view insertSubview:blackground atIndex:0];
    
}

- (void)blackgroundClick:(id)sender {
    [self.nameField resignFirstResponder];
}

- (NSDictionary *)createPersonProperty:(NSString *)name{
    NSArray * protyArr = [[name MD5Arr] retain];
    
    double per = (([[protyArr objectAtIndex:15] intValue] > 100)?(1):([[protyArr objectAtIndex:15] intValue])*0.01);    
    //NSLog(@"per = %f",per);
    
    //NSLog(@"dex ==== %@",[NSNumber numberWithInt:(37 + (int)[[protyArr objectAtIndex:0] intValue]*per)]);
    NSNumber * dex = [NSNumber numberWithInt:(37 + (int)[[protyArr objectAtIndex:0] intValue]*per)];
    //NSLog(@"灵巧:%@",dex);
    NSNumber * agi = [NSNumber numberWithInt:(37 + (int)[[protyArr objectAtIndex:1] intValue]*per)];
    //NSLog(@"敏捷:%@",agi);
    
    NSNumber * vit = [NSNumber numberWithInt:(37 + (int)[[protyArr objectAtIndex:2] intValue]*per)];
    //NSLog(@"体质:%@",vit);
    NSNumber * mana = [NSNumber numberWithInt:(37 + (int)[[protyArr objectAtIndex:3] intValue]*per)];
    //NSLog(@"斗气:%@",mana);    
    
    NSNumber * act = [NSNumber numberWithInt:(37 + (int)[[protyArr objectAtIndex:4] intValue]*per)];
    //NSLog(@"攻击:%@",act);
    NSNumber * luck = [NSNumber numberWithInt:(37 + (int)[[protyArr objectAtIndex:5] intValue]*per)];
    //NSLog(@"运气:%@",luck);        
    [protyArr release];
    return [NSDictionary dictionaryWithObjectsAndKeys:
            dex,@"dex",
            agi,@"agi",
            vit,@"vit",
            mana,@"mana",
            act,@"act",
            luck,@"luck",nil];
}
#pragma mark -
- (void)fromAddress:(id)sender {
    //NSLog(@"fromAddress");
    ABPeoplePickerNavigationController *ppnc = [[ABPeoplePickerNavigationController alloc] init];
	ppnc.peoplePickerDelegate = self;
	[self presentModalViewController:ppnc animated:YES];
}
- (void)completeChkin:(id)sender {
    if(self.nameField.text != @""){
        [self chkin:self.nameField.text];
    }
    self.nameField.text = @"";
}
- (void)ContinueChkin:(id)sender {
    if(self.nameField.text != @""){
        [self chkin:self.nameField.text];
    }    
    self.nameField.text = @"";
}
#pragma mark 迁入大陆
- (void)chkin:(NSString *)name {
    NSDictionary * propertys = [self createPersonProperty:name];
    NSLog(@"%@",propertys);
	//添加角色
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate * delegate = app.delegate;
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Person" inManagedObjectContext:[delegate managedObjectContext]];
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    [fetchRequest setEntity:entity];    
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:nil];
	NSArray *descriptors = [NSArray arrayWithObject:sortDescriptor];
	[fetchRequest setSortDescriptors:descriptors];    
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
    [fetchRequest setPredicate:predicate];    
    
    NSError *error = nil;
    NSArray *array = [[delegate managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    //NSLog(@"array count %@",array);
    if (array != nil){
        if ([array count] == 0) {
            Person * person = (Person *)[NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:[delegate managedObjectContext]];
            person.name = name;
            person.level = [NSNumber numberWithInt:0];
            person.dex = [propertys valueForKey:@"dex"];//灵巧
            person.vit = [propertys valueForKey:@"vit"];//体质
            person.agi = [propertys valueForKey:@"agi"];//敏捷
            person.act = [propertys valueForKey:@"act"];//攻击
            person.luck = [propertys valueForKey:@"luck"];//运气
            person.mana = [propertys valueForKey:@"mana"];//斗气
            person.win = [NSNumber numberWithInt:0];//获胜次数
            person.lost = [NSNumber numberWithInt:0];//失败次数
            person.score = [NSNumber numberWithInt:0];//得分

            Douji * dj = [self getDouji:person];
            if (dj != nil) {
                [person addDoujiObject:dj];
                NSLog(@"dj name is %@",[dj name]);
            }
            
            Douji * dj2 = [self getDouji:person];
            if (dj2 != nil) {
                [person addDoujiObject:dj2];
                NSLog(@"dj2 name is %@",[dj2 name]);
            }
            
//            error = nil;
//            if (![[delegate managedObjectContext] save:&error]) {
//                NSLog(@"Error %@",[error localizedDescription]);
//            }else{
//                NSLog(@"%@ 成功迁入斗气大陆",name);
//            } 
            
        }else{
            NSLog(@"%@ 已迁入斗气大陆",name);
        }
    }
}

- (Douji *)getDouji:(Person *)person {
    UIApplication *app = [UIApplication sharedApplication];
    AppDelegate * delegate = app.delegate;  
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Douji" inManagedObjectContext:[delegate managedObjectContext]];
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES selector:nil];
	NSArray *descriptors = [NSArray arrayWithObject:sortDescriptor];
	[fetchRequest setSortDescriptors:descriptors];
    [sortDescriptor release];
    
    NSError *error = nil;
    NSArray *array = [[delegate managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    if (array != nil){
        int total = [array count];
            if ([[person douji] count] == 0) {
                return [array objectAtIndex:rand()%total];
            }else{
                NSMutableArray *newarray = [[NSMutableArray alloc] init];
                for (Douji * hasDouji in [person douji]) {
                    for (Douji * douji in array) {
                        if (hasDouji != douji) {
                            [newarray addObject:douji];
                        }
                    }
                }
                
                Douji * newDouji = [newarray objectAtIndex:rand()%[newarray count]];
                [newarray release];
                return newDouji;
            }
    }
    return nil;
}

#pragma mark -
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    //NSLog(@"textFieldShouldReturn");
    [textField resignFirstResponder];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField {
    //NSLog(@"textFieldDidEndEditing %@",textField.text);
    //[self createPersonProperty];
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

#pragma mark PEOPLE PICKER DELEGATE METHODS
- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person
{
	self.nameField.text = [[ABContact contactWithRecord:person] compositeName];
	[self dismissModalViewControllerAnimated:YES];
	[peoplePicker release];
    //[self createPersonProperty];    
	return NO;
}

- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
	// required method that is never called in the people-only-picking
	[self dismissModalViewControllerAnimated:YES];
	[peoplePicker release];
	return NO;
}

- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
	[self dismissModalViewControllerAnimated:YES];
	[peoplePicker release];
}
@end
