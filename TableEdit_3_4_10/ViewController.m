//
//  ViewController.m
//  TableEdit_3_4_10
//
//  Created by SDT-1 on 2014. 1. 6..
//  Copyright (c) 2014년 steve. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITableView *table;

@end

@implementation ViewController

- (IBAction)toggleEdit:(id)sender {
    
    self.table.editing = !self.table.editing;
    
}


-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row %3 == 0) {
        return UITableViewCellEditingStyleNone;
    }
    else if(indexPath.row %3 == 1)
    {
        return UITableViewCellEditingStyleDelete;
        
    }
    else{
    
        return UITableViewCellEditingStyleInsert;
    
    }
    
    
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (UITableViewCellEditingStyleDelete == editingStyle) {
        NSLog(@"%d번째 삭제",indexPath.row);
    }
    else{
    
        NSLog(@"%d번째 추가",indexPath.row);
    
    }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"CELL_ID"];
    
    cell.textLabel.text  = [NSString stringWithFormat:@"Cell %d",indexPath.row];
    
    return cell;

}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
