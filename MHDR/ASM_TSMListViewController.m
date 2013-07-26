//
//  ASM_TSMListViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/26/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "ASM_TSMListViewController.h"

@interface ASM_TSMListViewController ()

@end

@implementation ASM_TSMListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"ASM/TSM";
        self.asmTsmList = [NSMutableArray arrayWithCapacity:1];

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.asmTsmList = [NSMutableArray arrayWithCapacity:1];
    
    ASM_TSM *asmTsm = [[ASM_TSM alloc] init];
    asmTsm.SolSegment = @"ASM/TSM";
    asmTsm.OnCallPerson = @"(P)-Tanya Norman";
    asmTsm.Type = @"ASM";
    asmTsm.Details = @"ASM";
    asmTsm.Pager = @"20579";
    asmTsm.CellPhone = @"2818046609";
    asmTsm.Phone = @"713-338-5690";
    [self.asmTsmList addObject:asmTsm];
    
    asmTsm = [[ASM_TSM alloc] init];
    asmTsm.SolSegment = @"ASM/TSM";
    asmTsm.OnCallPerson = @"(P)-TSM-Brad Shackleford";
    asmTsm.Type = @"TSM";
    asmTsm.Details = @"Care4";
    asmTsm.Pager = @"19310";
    asmTsm.CellPhone = @"8324191492";
    asmTsm.Phone = @"713-338-4036";
    [self.asmTsmList addObject:asmTsm];
    
    asmTsm = [[ASM_TSM alloc] init];
    asmTsm.SolSegment = @"ASM/TSM";
    asmTsm.OnCallPerson = @"(P)-TSM-Lloyd Cutter";
    asmTsm.Type = @"TSM";
    asmTsm.Details = @"Mainframe";
    asmTsm.Pager = @"";
    asmTsm.CellPhone = @"8327218784";
    asmTsm.Phone = @"713-704-5272";
    [self.asmTsmList addObject:asmTsm];
    
    asmTsm = [[ASM_TSM alloc] init];
    asmTsm.SolSegment = @"ASM/TSM";
    asmTsm.OnCallPerson = @"(P)-TSM-Christopher Kar";
    asmTsm.Type = @"TSM";
    asmTsm.Details = @"Technical";
    asmTsm.Pager = @"";
    asmTsm.CellPhone = @"5409051475";
    asmTsm.Phone = @"713-338-4084";
    [self.asmTsmList addObject:asmTsm];
    
    asmTsm = [[ASM_TSM alloc] init];
    asmTsm.SolSegment = @"ASM/TSM";
    asmTsm.OnCallPerson = @"(P)-TSM-Glenn Fowler";
    asmTsm.Type = @"TSM";
    asmTsm.Details = @"Telecom";
    asmTsm.Pager = @"";
    asmTsm.CellPhone = @"7138825059";
    asmTsm.Phone = @"713-338-5059";
    [self.asmTsmList addObject:asmTsm];

 
    /*
    
    
    self.asmTsmList = [NSArray arrayWithObjects:
                      @"Tanya Norman",
                      @"TSM - Brad Shackleford",
                      @"TSM - Lloyd Cutter",
                      @"TSM - Christopher Kar",
                      @"TSM Glenn Fowler",
                       nil];
     */
}

- (void)cancel:(id)sender
{
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:[self dismissBlock]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.asmTsmList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"ASM_TSMViewCell";
    
    UITableViewCell *detailCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!detailCell)
    {
        detailCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    ASM_TSM *asmTsm = [self.asmTsmList objectAtIndex:indexPath.row];
    
    detailCell.textLabel.text = asmTsm.OnCallPerson;
    
    return detailCell;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ASM_TSMViewController *asmTsmVC = [[ASM_TSMViewController alloc] init];
    
    //TeamMember *teamMember = [self.teamMemberList objectAtIndex:indexPath.row];
    ASM_TSM *asmTsm = [self.asmTsmList objectAtIndex:indexPath.row];
    
    //Pass selected teamMember item to TeamMemberViewController object
    asmTsmVC.asmTsm = asmTsm;
    asmTsmVC.navigationItem.title = asmTsm.OnCallPerson;
    
    [self.navigationController pushViewController:asmTsmVC animated:YES];
}

    
    
    
    
    
    
    
    
    
    
    
    
    
    


@end
