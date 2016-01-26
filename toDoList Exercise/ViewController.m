//
//  ViewController.m
//  toDoList Exercise
//
//  Created by Karlo Pagtakhan on 01/26/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import "ViewController.h"
#import "ListTableViewCell.h"
#import "AddItemViewController.h"

@interface ViewController ()<AddItemViewControllerDelegate>


@property(nonatomic, strong) NSMutableArray * todos;

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.todos = [[NSMutableArray alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSString *todoText = self.todos[indexPath.row];
    cell.label.text = todoText;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.todos.count;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    UINavigationController *nav = segue.destinationViewController;
    
    AddItemViewController *addVC = nav.viewControllers[0];
    addVC.delegate = self;
    
}

- (void)didSaveNewTodo:(NSString *)todoText{
    [self.todos addObject:todoText];
    [self.tableView reloadData];
    NSLog(@"%@", todoText);
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        [self.todos removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];
    }
}


@end
