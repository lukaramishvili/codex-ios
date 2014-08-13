//
//  kodeqsebi_view.m
//  codex
//
//  Created by Luka on 7/29/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import "kodeqsebi_view.h"
#import "kodeqsi.h"
#import "Helpers.h"

@interface kodeqsebi_view ()


@property NSMutableArray *kodeqsebi;


@end

@implementation kodeqsebi_view

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //load the data
    self.kodeqsebi = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}



- (void)loadInitialData {
    /*
    kodeqsi *kodeqsi1 = [[kodeqsi alloc] init];
    kodeqsi1.title = [Helpers getHttpResponse:@"http://api.lcggroup.ge/codex?tid=4" :nil :nil];
    [self.kodeqsebi addObject:kodeqsi1];
    
    kodeqsi *kodeqsi2 = [[kodeqsi alloc] init];
    kodeqsi2.title = @"სამოქალაქო სამართალი";
    [self.kodeqsebi addObject:kodeqsi2];
    
    kodeqsi *kodeqsi3 = [[kodeqsi alloc] init];
    kodeqsi3.title = @"ადმინისტრაციული სამართალი";
    [self.kodeqsebi addObject:kodeqsi3];
     */
    self.kodeqsebi = [kodeqsi all];
}






- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.kodeqsebi count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KodeqsiPrototypeCell" forIndexPath:indexPath];
    
    kodeqsi *kodeqsiItem = [self.kodeqsebi objectAtIndex:indexPath.row];
    cell.textLabel.text = kodeqsiItem.title;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //kodeqsi selectedKodeqsi = [self.kodeqsebi objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"KodeqsiPrototypeCell" forIndexPath:indexPath];
    
    kodeqsi *kodeqsiItem = [self.kodeqsebi objectAtIndex:indexPath.row];
    //view tavi's for this kodeqsi
    [self performSegueWithIdentifier: @"showtavebi" sender: self];
    
    //deselect the row after clicking (selecting)
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    //reload/redraw the cells (commented, causes first clicked item to disappear)
    //[tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
