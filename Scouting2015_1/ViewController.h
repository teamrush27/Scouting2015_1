//
//  ViewController.h
//  Scouting2015_1
//
//  Created by Team RUSH 2 on 1/17/15.
//  Copyright (c) 2015 FIRST Team RUSH 27 Robotics. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController

// Match Number
    @property (strong, nonatomic) IBOutlet UILabel *lblMatchNum;
    @property (weak, nonatomic) IBOutlet UIStepper *stpMatchNum;
        - (IBAction)matchChange:(UIStepper *)sender;
        // Notes; Nothing has been added for uploading
@property (weak, nonatomic) IBOutlet UITextField *txtTeamNum;
- (IBAction)didChangeTeamNum:(UITextField *)sender;

// Auton
    @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmThreeToteStack;
    @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmTotesToAZ;
               // Above is connected together in code

        @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmRobotToAZ;

        @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmCansToAZ;

        // Below is connected together in code
    @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmCansFromStep;
        - (IBAction)didGetCanFromStep:(UISegmentedControl *)sender;
    @property (weak, nonatomic) IBOutlet UISwitch *chkStepCan1;
    @property (weak, nonatomic) IBOutlet UISwitch *chkStepCan2;
    @property (weak, nonatomic) IBOutlet UISwitch *chkStepCan3;
    @property (weak, nonatomic) IBOutlet UISwitch *chkStepCan4;
        // Above is connected together in code
// Teleop
        @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmToteStack;

        // Below is connected together in code
    @property (weak, nonatomic) IBOutlet UIStepper *stpToteScore;
    @property (weak, nonatomic) IBOutlet UILabel *lblToteScore;
        - (IBAction)toteScoreChange:(UIStepper *)sender;
        // Above is connected together in code

        // Below is connected together in code
    @property (weak, nonatomic) IBOutlet UIStepper *stpCanCaps;
    @property (weak, nonatomic) IBOutlet UILabel *lblCanCaps;
        - (IBAction)canCapChange:(UIStepper *)sender;
        // Above is connected together in code

    @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmHighCap;

        // Below is connected together in code

    @property (weak, nonatomic) IBOutlet UIStepper *stpCannedLitter;
    @property (weak, nonatomic) IBOutlet UILabel * lblCannedLitter;
        - (IBAction)canLitterChange:(UIStepper *)sender;

        // Above is connected together in code

    @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmTeleopCanFromStep;


// MISC
    @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmStartLocation;
    @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmSkizzles;
        - (IBAction)noShow:(UISegmentedControl *)sender;

    @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmDoofus;
    @property (weak, nonatomic) IBOutlet UISegmentedControl *sgmStrategy;
// Submit Button Area


    @property (weak, nonatomic) IBOutlet UIButton *chkSubmit;
    - (IBAction)submit:(id)sender;
    - (void) save;
    - (void) nextMatch;

@end

