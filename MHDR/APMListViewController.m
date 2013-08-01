//
//  APMListViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/26/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "APMListViewController.h"

@interface APMListViewController ()

@end

@implementation APMListViewController

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

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.applicationList = [NSMutableArray arrayWithCapacity:1];
    [self fetchFromJsonFile];
    
    
}

- (void)viewWillAppear:(BOOL)animated
{
    self.navigationItem.title = @"APM - List";
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.navigationItem.title = @"Back";
    
}


- (void)fetchFromJsonFile
{
    NSData *jsonData2 = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"apm2" ofType:@"json"]];
    NSDictionary *jsonDictionaryObject = [NSJSONSerialization JSONObjectWithData:jsonData2
                                                                         options:0
                                                                           error:nil];
    // For debugging purpose
    //NSLog(@"%@",jsonDictionaryObject);
    
    NSArray *appList = [jsonDictionaryObject objectForKey:@"APM"];
    
    self.applicationList = [NSMutableArray array];
    
    for(NSDictionary *application in appList)
    {
        APMApplication *app = [[APMApplication alloc] init];
        app.Application = [application objectForKey:@"Application"];
        app.SegmentOwner = [application objectForKey:@"SegmentOwner"];
        app.SolutionSegment = [application objectForKey:@"SolutionSegment"];
        
        [self.applicationList addObject:app];
    }
    
    //[self.tableView reloadData];
    
    [self displayIndexList];
    
}

- (void)displayIndexList
{
    UILocalizedIndexedCollation *theCollation = [UILocalizedIndexedCollation currentCollation];
    if(self.applicationList)
    {
        NSMutableArray *applicationListTemp = [NSMutableArray arrayWithArray:self.applicationList];
        
        [self.applicationList removeAllObjects];
        
        // 1
        for(APMApplication *application in applicationListTemp)
        {
            NSInteger sect = [theCollation sectionForObject:application collationStringSelector:@selector(Application)];
            application.sectionNumber = sect;
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
        for(APMApplication *application in applicationListTemp)
        {
            [(NSMutableArray *)[sectionArrays objectAtIndex:application.sectionNumber] addObject:application];
        }
        
        // 4
        for (NSMutableArray *sectionArray in sectionArrays)
        {
            NSArray *sortedSectionArray = [theCollation sortedArrayFromArray:sectionArray collationStringSelector:@selector(Application)];
            [self.applicationList addObject:sortedSectionArray];
        }
    }
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.teamMemberList.count; THIS IS WHERE THE ERROR IS AND ALSO CHECK setCity or City will be used
    return [[self.applicationList objectAtIndex:section] count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return [[UILocalizedIndexedCollation currentCollation] sectionIndexTitles];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    //throwing error here
    if ([[self.applicationList objectAtIndex:section] count] > 0) {
        return [[[UILocalizedIndexedCollation currentCollation] sectionTitles] objectAtIndex:section];
    }
    return nil;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return [[UILocalizedIndexedCollation currentCollation] sectionForSectionIndexTitleAtIndex:index];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //return 1;
    /*
     NSPredicate *predicate = [NSPredicate predicateWithFormat:@"City like %@",@"Berlin"];
     NSInteger count = 0;
     if(teamMemberList.count > 0)
     {
     NSArray *memberlist = [self.teamMemberList filteredArrayUsingPredicate:predicate];
     count = memberlist.count;
     }
     return count;
     */
    return [self.applicationList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tvCell = [tableView dequeueReusableCellWithIdentifier:@"ApplicationViewCell"];
    
    if(!tvCell)
    {
        tvCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"ApplicationViewCell"];
    }
    
    //TeamMember *teamMember = [self.teamMemberList objectAtIndex:indexPath.row];
    APMApplication *application = [[self.applicationList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    tvCell.textLabel.text = application.Application;
    tvCell.detailTextLabel.text = application.SegmentOwner;
    //need to find way to display application SolutionSegment
    
    
    return tvCell;
    
}



#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    APMApplicationViewController *applicationVC = [[APMApplicationViewController alloc] init];
    
    APMApplication *application = [[self.applicationList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    applicationVC.application = application;
    applicationVC.navigationItem.title = application.Application;
    
    [self.navigationController pushViewController:applicationVC animated:YES];
    */
    
}
    

@end
