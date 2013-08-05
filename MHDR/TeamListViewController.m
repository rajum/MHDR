//
//  TeamListViewController.m
//  MHDR
//
//  Created by Raju Maharjan on 7/12/13.
//  Copyright (c) 2013 Memorial Hermann. All rights reserved.
//

#import "TeamListViewController.h"
#import "DetailViewController.h"

@interface TeamListViewController() <NSURLConnectionDataDelegate>

@end

@implementation TeamListViewController

@synthesize teamMemberList;

-(id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if(self)
    {
        //[self fetchFeed];
        //[self fetchFromJsonFile];

        
        self.navigationItem.title = @"Member List";
        
        /*
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(cancel:)];
        [[self navigationItem] setLeftBarButtonItem:cancelItem];
        */
        
    }
    return self;
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    [self.tableView addSubview:self.indicator];
    [self.indicator startAnimating];
    self.indicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.indicator sizeToFit];
    self.indicator.center = CGPointMake(150, 180);
  

    self.teamMemberList = [NSMutableArray arrayWithCapacity:1];
    //[self fetchFromJsonFile];
    //[self fetchFeedInternal];
    [self fetchFeedExternal];
    
    
    //[self.indicator startAnimating];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)fetchFromJsonFile
{
    NSData *jsonData2 = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"members2" ofType:@"json"]];
    NSDictionary *jsonDictionaryObject = [NSJSONSerialization JSONObjectWithData:jsonData2
                                                                         options:0
                                                                           error:nil];
    // For debugging purpose
    //NSLog(@"%@",jsonDictionaryObject);
    
    NSArray *memberList = [jsonDictionaryObject objectForKey:@"Members"];
    
    self.teamMemberList = [NSMutableArray array];
    
    for(NSDictionary *teamMember in memberList)
    {
        TeamMember *member = [[TeamMember alloc] init];
        member.LastName = [teamMember objectForKey:@"LastName"];
        member.FirstName = [teamMember objectForKey:@"FirstName"];
        member.CellPhone = [teamMember objectForKey:@"CellPhone"];
        member.Pager = [teamMember objectForKey:@"Pager"];
        member.OfficePhone = [teamMember objectForKey:@"OfficePhone"];
        member.HomePhone = [teamMember objectForKey:@"HomePhone"];
        
        member.FullName = [NSString stringWithFormat:@"%@ %@",member.FirstName,member.LastName];
        
        [self.teamMemberList addObject:member];
    }
    
    //[self.tableView reloadData];
    
    [self displayIndexList];

}

-(void)fetchFeedInternal
{
    self.jsonData = [[NSMutableData alloc]init];
    
    //NSString *requestString = @"http://www.inorthwind.com/Service1.svc/getAllCustomers";
    
    //INTERNAL
    NSString *requestString = @"http://mhwebtest:8080/MHDR_WebAPI/api/MHDR/GetISDTeamList";
    
    
    
    NSURL *url = [NSURL URLWithString:requestString];
    
    
    
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    
    
    
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:urlRequest
                                                                     delegate:self
                                                             startImmediately:YES];
    
    self.connection = urlConnection;
}

-(void)fetchFeedExternal
{
    self.jsonData = [[NSMutableData alloc]init];
    
    
    
    //EXTERNAL
    NSString *requestString = @"https://www.mhdr.org/api/api/MHDR/GetISDTeamList";
    
        


    /*
    NSString *loginString = [NSString stringWithFormat:@"%@:%@", @"boobka", @"booger69"];
    NSData *data = [loginString dataUsingEncoding: NSUnicodeStringEncoding];
    NSString *ret = [NSStringAdditions base64StringFromData:data length:[data length]];
    NSLog(@"%@", ret);
    */
    //NSString *loginString = [NSString stringWithFormat:@"%@:%@", [self userName], [self password]];
    //NSString *encodedLoginData = [Base64 encode:[loginString dataUsingEncoding:NSUTF8StringEncoding]];
    //NSString *base64LoginData = [NSString stringWithFormat:@"Basic %@",ret];
    NSString *base64LoginData = @"Basic Ym9vYmthOmJvb2dlcjY5";
    
    NSURL *url=[NSURL URLWithString:requestString];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:10.0];
    
    [request setHTTPMethod:@"GET"];
    
    [request setValue:base64LoginData forHTTPHeaderField:@"Authorization"];
    
    NSURLConnection *urlConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    self.connection = urlConnection;

}

- (void)cancel:(id)sender
{
    
    [[self presentingViewController] dismissViewControllerAnimated:YES completion:[self dismissBlock]];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //return self.teamMemberList.count; THIS IS WHERE THE ERROR IS AND ALSO CHECK setCity or City will be used
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
    return [self.teamMemberList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tvCell = [tableView dequeueReusableCellWithIdentifier:@"TeamMemberViewCell"];
    
    if(!tvCell)
    {
        tvCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"TeamMemberViewCell"];
    }
    
    //TeamMember *teamMember = [self.teamMemberList objectAtIndex:indexPath.row];
    TeamMember *teamMember = [[self.teamMemberList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    /*
    NSString *name = [[NSString alloc]init];
    NSArray *names = [NSArray arrayWithObjects:@"test", @"test2",nil];
    name = [names componentsJoinedByString:@" "];
    NSString *test2 = [NSString stringWithFormat:@"%@%@%@", @"test", @" ", @" test3"];
    */ 
    tvCell.textLabel.text = [NSString stringWithFormat:@"%@ %@", teamMember.LastName, teamMember.FirstName];
    //teamMember.LastName + @" " + teamMember.FirstName;
    tvCell.detailTextLabel.text = teamMember.OfficePhone;
    
    return tvCell;
    
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    TeamMemberViewController *teamMemberVC = [[TeamMemberViewController alloc] init];
    
    TeamMember *teamMember = [[self.teamMemberList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    teamMemberVC.member = teamMember;
    teamMemberVC.navigationItem.title = teamMember.FullName;
    
    [self.navigationController pushViewController:teamMemberVC animated:YES];
    */
    /*
    TeamMemberDetailViewController *teamMemberDetailVC = [[TeamMemberDetailViewController alloc] initWithStyle:UITableViewStylePlain];
    
    TeamMember *teamMember = [[self.teamMemberList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    teamMemberDetailVC.member = teamMember;
    teamMemberDetailVC.navigationItem.title = teamMember.FullName;
    
    [self.navigationController pushViewController:teamMemberDetailVC animated:YES];
    */
    
    //working
    
    UIStoryboard *detailStoryboard = [UIStoryboard storyboardWithName:@"TeamMemberDetailStoryboard" bundle:nil];
    DetailViewController *detailStoryboardViewController = [detailStoryboard instantiateInitialViewController];
    
    TeamMember *teamMember = [[self.teamMemberList objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    detailStoryboardViewController.member = teamMember;
    [self.navigationController pushViewController:detailStoryboardViewController animated:YES];


}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.jsonData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // This is just to check that we are getting the JSON Data
    NSString *jsonCheck = [[NSString alloc] initWithData:self.jsonData
                                                encoding:NSUTF8StringEncoding];
    
    NSLog(@"%@", jsonCheck);
    
    NSDictionary *jsonDictionaryObject = [NSJSONSerialization JSONObjectWithData:self.jsonData
                                                               options:0
                                                                 error:nil];
    // For debugging purpose
    // NSLog(@"%@",jsonDictionaryObject);
    
    NSArray *memberList = [jsonDictionaryObject objectForKey:@"Members"];
    //NSArray *memberList = [jsonDictionaryObject objectForKey:@"GetAllCustomersResult"];
    
    self.teamMemberList = [NSMutableArray array];
    
        
    for(NSDictionary *teamMember in memberList)
    {
        TeamMember *member = [[TeamMember alloc] init];
        member.LastName = [teamMember objectForKey:@"LastName"];
        member.FirstName = [teamMember objectForKey:@"FirstName"];
        member.CellPhone = [teamMember objectForKey:@"CellPhone"];
        member.Pager = [teamMember objectForKey:@"Pager"];
        member.OfficePhone = [teamMember objectForKey:@"OfficePhone"];
        member.HomePhone = [teamMember objectForKey:@"Home Phone"];
        
        member.FullName = [NSString stringWithFormat:@"%@ %@",member.FirstName,member.LastName];
        
        [self.teamMemberList addObject:member];
    }
    
    
    [self displayIndexList];
    
    [self.indicator stopAnimating];
    
    [self.indicator removeFromSuperview];
    
}

- (void)displayIndexList
{
    UILocalizedIndexedCollation *theCollation = [UILocalizedIndexedCollation currentCollation];
    if(self.teamMemberList)
    {
        NSMutableArray *teamMemberListTemp = [NSMutableArray arrayWithArray:teamMemberList];
               
        [self.teamMemberList removeAllObjects];
        
        // 1
        for(TeamMember *teamMember in teamMemberListTemp)
        {
            NSInteger sect = [theCollation sectionForObject:teamMember collationStringSelector:@selector(LastName)];
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
        for(TeamMember *teamMember in teamMemberListTemp)
        {
            [(NSMutableArray *)[sectionArrays objectAtIndex:teamMember.sectionNumber] addObject:teamMember];
        }
        
        // 4
        for (NSMutableArray *sectionArray in sectionArrays)
        {
            NSArray *sortedSectionArray = [theCollation sortedArrayFromArray:sectionArray collationStringSelector:@selector(LastName)];
            [self.teamMemberList addObject:sortedSectionArray];
        }
    }
    
    [self.tableView reloadData];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Clear out any object we were using to perform the request
    self.connection = nil;
    self.jsonData = nil;
    
    // Get the description of the error and alert the user
    NSString *errString = [error localizedDescription];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                        message:errString delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil, nil];
    
    [alertView show];
    
}





















@end
