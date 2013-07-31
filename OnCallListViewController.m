//
//  OnCallListViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/18/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "OnCallListViewController.h"

@interface OnCallListViewController ()

@end

@implementation OnCallListViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization

        UITabBarItem *listTabBarItem = self.tabBarItem;
        listTabBarItem.title=@"Team List";
        UIImage *tabImage = [UIImage imageNamed:@"Time.png"];
        listTabBarItem.image = tabImage;
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
    //self.tabBarController.navigationItem.title = @"Team List";
    
    /*
    self.memberList = [NSArray arrayWithObjects:
                     @"Person1",
                     @"Person2",
                     @"Person3",
                     @"Person4",
                     @"Person5",
                     nil];
    */
    self.teamMemberList = [NSMutableArray arrayWithCapacity:1];
    [self fetchFromJsonFile];
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"On Call List";
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationItem.title = @"Back";
    
}

- (void)fetchFromJsonFile
{
    NSData *jsonData2 = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"oncall2" ofType:@"json"]];
    NSDictionary *jsonDictionaryObject = [NSJSONSerialization JSONObjectWithData:jsonData2
                                                                         options:0
                                                                           error:nil];
    // For debugging purpose
    NSLog(@"%@",jsonDictionaryObject);
    
    NSArray *memberList = [jsonDictionaryObject objectForKey:@"OnCall"];
    
    self.teamMemberList = [NSMutableArray array];
    
    for(NSDictionary *teamMember in memberList)
    {
        OnCall *member = [[OnCall alloc] init];
        member.SolSegment = [teamMember objectForKey:@"Sol Segment"];
        member.OnCallPerson = [teamMember objectForKey:@"On Call Person"];
        member.Details = [teamMember objectForKey:@"Details"];
        member.Pager = [teamMember objectForKey:@"Pager"];
        member.CellPhone = [teamMember objectForKey:@"Cell Phone"] ;
        member.Phone = [teamMember objectForKey:@"Phone"];
        member.StartDate = [teamMember objectForKey:@"Start Date"];
        member.STime = [teamMember objectForKey:@"S Time"];
        member.EndDate = [teamMember objectForKey:@"End Date"];
        member.StartDate = [teamMember objectForKey:@"E Time"];
        
        [self.teamMemberList addObject:member];
    }
    
    //[self.tableView reloadData];
    
    [self displayIndexList];
    
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
    return self.teamMemberList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.teamMemberList objectAtIndex:section] count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //throwing error here
    if ([[self.teamMemberList objectAtIndex:section] count] > 0) {
        return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tvCell = [tableView dequeueReusableCellWithIdentifier:@"TeamMemberViewCell"];
    
    if(!tvCell)
    {
        tvCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TeamMemberViewCell"];
    }
    
    OnCall *teamMember = [[self.teamMemberList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    tvCell.textLabel.text = [NSString stringWithFormat:@"%@", teamMember.SolSegment];
    tvCell.detailTextLabel.text = teamMember.OnCallPerson;
    
    return tvCell;


}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    OnCallDetailViewController *teamMemberVC = [[OnCallDetailViewController alloc] init];
    
    OnCall *teamMember = [[self.teamMemberList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    //Pass selected teamMember item to TeamMemberViewController object
    teamMemberVC.member = teamMember;
    teamMemberVC.navigationItem.title = teamMember.OnCallPerson;
    
    [self.navigationController pushViewController:teamMemberVC animated:YES];
}

- (void)displayIndexList
{
    UILocalizedIndexedCollation *theCollation = [UILocalizedIndexedCollation currentCollation];
    if(self.teamMemberList)
    {
        NSMutableArray *teamMemberListTemp = [NSMutableArray arrayWithArray:self.teamMemberList];
        
        [self.teamMemberList removeAllObjects];
        
        // 1
        for(OnCall *teamMember in teamMemberListTemp)
        {
            NSInteger sect = [theCollation sectionForObject:teamMember collationStringSelector:@selector(SolSegment)];
            teamMember.sectionNumber = sect;
        }
        
        // 2
        NSInteger highSection = theCollation.sectionTitles.count;
        NSMutableArray *sectionArrays = [NSMutableArray arrayWithCapacity:highSection];
        for(int i=0;i<highSection;i++)
        {
            NSMutableArray *sectionArray = [NSMutableArray arrayWithCapacity:1];
            [sectionArrays addObject:sectionArray];
        }
        
        // 3
        for(OnCall *teamMember in teamMemberListTemp)
        {
            [(NSMutableArray *)[sectionArrays objectAtIndex:teamMember.sectionNumber] addObject:teamMember];
        }
        
        // 4
        for (NSMutableArray *sectionArray in sectionArrays)
        {
            NSArray *sortedSectionArray = [theCollation sortedArrayFromArray:sectionArray collationStringSelector:@selector(SolSegment)];
            [self.teamMemberList addObject:sortedSectionArray];
        }
    }
    
    [self.tableView reloadData];
}


@end
