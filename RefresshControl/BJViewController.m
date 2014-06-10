//
//  BJViewController.m
//  RefresshControl
//
//  Created by Bablu Joshi on 10/06/14.
//  Copyright (c) 2014 BJ. All rights reserved.
//

#import "BJViewController.h"

@interface BJViewController ()

@end

@implementation BJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    myTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    myTableView.delegate=self;
    myTableView.dataSource=self;
    [self.view addSubview:myTableView];
    
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc]
                                        init];
    refreshControl.tintColor = [UIColor grayColor];
    
    [refreshControl addTarget:self action:@selector(updateTableView:) forControlEvents:UIControlEventValueChanged];
    
    
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"Updating data..."];

    
    [myTableView addSubview:refreshControl];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)updateTableView :(UIRefreshControl *)sender{
    [sender endRefreshing];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM d, h:mm:ss a"];
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated on %@", [formatter stringFromDate:[NSDate date]]];
    
    sender.attributedTitle = [[NSAttributedString alloc] initWithString:lastUpdated];
    
    
}
- (NSInteger)numberOfRowsInSection:(NSInteger)section{

    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text=@"Refresh Test";
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 10;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
