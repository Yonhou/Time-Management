//
//  TMGTEventItemListTableViewController.m
//  Time Management
//
//  Created by Hou Yongchao on 14-7-26.
//  Copyright (c) 2014年 Hou Yongchao. All rights reserved.
//

#import "TMGTEventItemListTableViewController.h"
#import "TMGTEventItem.h"
#import "TMGTAddNewEventViewController.h"
#import "TMGTEventItemDetailTableViewController.h"

@interface TMGTEventItemListTableViewController ()
@property NSMutableArray *eventItemList;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@end

@implementation TMGTEventItemListTableViewController

- (void)orderEventsList{
    /*NSSortDescriptor *dateDescriptor =
    [NSSortDescriptor sortDescriptorWithKey:@"_creationDate" ascending:NO];*/
    NSSortDescriptor *quadrantDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"_quadrant" ascending:YES];
    [self.eventItemList sortUsingDescriptors:[NSArray arrayWithObject:quadrantDescriptor]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"ShowSelectItemDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        TMGTEventItemDetailTableViewController *controller = [segue destinationViewController];
        controller.eventItem = [self.eventItemList objectAtIndex:indexPath.row];
    }
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue{
    TMGTAddNewEventViewController *source = [segue sourceViewController];
    TMGTEventItem *item = source.eventItem;
    if (item != nil) {
        [self.eventItemList addObject:source.eventItem];
        [self orderEventsList];
        [self.tableView reloadData];
    }
    
}

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
    self.eventItemList = [[NSMutableArray alloc] init];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    
    NSError *err;
    if (![[self fetchedResultsController] performFetch:&err]) {
        NSLog(@"Unresolved error %@ %@", err, [err userInfo ]);
        //abort();
    }
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
    return [self.eventItemList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"eventItemPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell...
    NSString *tempString = [NSString stringWithFormat:@"%ld", (long)[[self.eventItemList objectAtIndex:indexPath.row] quadrant]];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ %@",
                           [[self.eventItemList objectAtIndex:indexPath.row] eventName],
                           tempString,
                           [[[self.eventItemList objectAtIndex:indexPath.row] creationDate] description]
                           ];
    return cell;
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
