//
//  AddItemViewController.h
//  toDoList Exercise
//
//  Created by Karlo Pagtakhan on 01/26/2016.
//  Copyright © 2016 AccessIT. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddItemViewControllerDelegate <NSObject>

- (void)didSaveNewTodo:(NSString *) todoText;

@end

@interface AddItemViewController : UIViewController

@property (nonatomic, strong) id <AddItemViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *textField;

- (IBAction)cancel:(id)sender;

- (IBAction)save:(id)sender;

@end
