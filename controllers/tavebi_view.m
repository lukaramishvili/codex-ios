//
//  tavebi_view.m
//  codex
//
//  Created by Luka on 7/29/14.
//  Copyright (c) 2014 luka. All rights reserved.
//

#import "tavebi_view.h"
#import "tavi.h"
#import "muxli.h"
#import "muxli_view.h"

@interface tavebi_view ()

@end

@implementation tavebi_view

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    muxli_view *muxliVC = segue.destinationViewController;
    
    NSLog(@"prepareForSegue: %@", segue.identifier);
    if([segue.identifier isEqualToString:@"viewmuxli_segue"])
    {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        tavi *sectionTavi = [self.parentKodeqsi.tavebi objectAtIndex:indexPath.section];
        
        muxliVC.muxliItem = [sectionTavi.muxlebi objectAtIndex:indexPath.row];
        
    }/*else if([segue.identifier isEqualToString:@"ANOTHERSEGUEIDENT"]){
      
      transferViewController.fnameText = @"John Smith";
      transferViewController.phoneText = @"555-555-5556";
      transferViewController.bdayText = @"06/27/1972";
      }*/
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //self.parentKodeqsi.title;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
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
    return [self.parentKodeqsi.tavebi count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[[self.parentKodeqsi.tavebi objectAtIndex:section] muxlebi] count];
}


- (NSString*)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    tavi *sectionTavi = [self.parentKodeqsi.tavebi objectAtIndex:section];
    
    return sectionTavi.title;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaviPrototypeCell" forIndexPath:indexPath];
    
    tavi *sectionTavi = [self.parentKodeqsi.tavebi objectAtIndex:indexPath.section];
    muxli *muxliItem = [sectionTavi.muxlebi objectAtIndex:indexPath.row];
    cell.textLabel.text = muxliItem.title;
    
    return cell;
}

//kodeqsis tavebs vachvenebt seqciebad, da seqciashi tito chanaceri aris am tavis muxlebi
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //kodeqsi selectedKodeqsi = [self.kodeqsebi objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TaviPrototypeCell" forIndexPath:indexPath];
    
    tavi *sectionTavi = [self.parentKodeqsi.tavebi objectAtIndex:indexPath.section];
    muxli *muxliItem = [sectionTavi.muxlebi objectAtIndex:indexPath.row];
    //view tavi's for this kodeqsi
    [self performSegueWithIdentifier: @"viewmuxli_segue" sender: self];
    
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
