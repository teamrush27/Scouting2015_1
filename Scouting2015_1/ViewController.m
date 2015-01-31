//
//  ViewController.m
//  Scouting2015_1
//
//  Created by Team RUSH 2 on 1/17/15.
//  Copyright (c) 2015 FIRST Team RUSH 27 Robotics. All rights reserved.
//

#import "ViewController.h"

@interface ViewController1
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _chkStepCan1.transform = CGAffineTransformMakeRotation(-M_PI_2);
    _chkStepCan2.transform = CGAffineTransformMakeRotation(-M_PI_2);
    _chkStepCan3.transform = CGAffineTransformMakeRotation(-M_PI_2);
    _chkStepCan4.transform = CGAffineTransformMakeRotation(-M_PI_2);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Above is default stuff dont touch

// Match Number
    - (IBAction)matchChange:(UIStepper *)sender {
        int val = sender.value;
        _lblMatchNum.text = [NSString stringWithFormat:@"Match #: %d",val];
}
// Auton Totes

    - (IBAction)didMoveTotes:(UISwitch *)sender {
        _sgmTotesToAZ.enabled = _sgmMovedTotes.selectedSegmentIndex > 0;
        if(_sgmMovedTotes.selectedSegmentIndex == 0)
        {
            _sgmTotesToAZ.selectedSegmentIndex = -1;
        }}
// Cans From Step
    - (IBAction)didGetCanFromStep:(UISegmentedControl *)sender {

        if ( _sgmCansFromStep.selectedSegmentIndex == 1) {
            _chkStepCan1.enabled = YES;
            _chkStepCan2.enabled = YES;
            _chkStepCan3.enabled = YES;
            _chkStepCan4.enabled = YES;
 }
        else {
            _chkStepCan1.enabled = NO;
            _chkStepCan1.on = NO;
            _chkStepCan2.enabled = NO;
            _chkStepCan2.on = NO;
            _chkStepCan3.enabled = NO;
            _chkStepCan3.on = NO;
            _chkStepCan4.enabled = NO;
            _chkStepCan4.on = NO;
}}
// Teleop Scoreing
    - (IBAction)toteScoreChange:(UIStepper *)sender {
        int val = sender.value;
        _lblToteScore.text = [NSString stringWithFormat:@"#: %d",val];
}
    - (IBAction)canCapChange:(UIStepper *)sender {
        int val = sender.value;
        _lblCanCaps.text = [NSString stringWithFormat:@"#: %d",val];
}
    - (IBAction)canLitterChange:(UIStepper *)sender {
        int val = sender.value;
        _lblCannedLitter.text = [NSString stringWithFormat:@"#: %d",val];
}

// MISC

- (IBAction)noShow:(UISegmentedControl *)sender {
    _sgmSkizzles.enabled = _sgmStartLocation.selectedSegmentIndex > 0;
    if (_sgmStartLocation.selectedSegmentIndex == 0)
    {
        _sgmSkizzles.selectedSegmentIndex = -1;
    }
    else {
        _sgmSkizzles.enabled = YES;
        _sgmSkizzles.selectedSegmentIndex = 2;
}}
// Submit Button Area
    - (IBAction)submit:(id)sender
{
    [self save];
    [self nextMatch];
}
- (void) save
{/*
    NSString *resultLine = [NSString stringWithFormat: @"%i,%i,%@,%@,%@,%i,%i,%@,%@,%@,%@,%@,%i,%i,%i,%i,%i,%@,%@,%i",
                            _stpMatchNum.value,
                            _txtTeamNum.text,
                            _txtScouter.text,
                            _sgmStartLocation.selectedSegmentIndex,
                            _sgmMovedTotes.selectedSegmentIndex,
                            _sgmTotesToAZ.selectedSegmentIndex,
                            _sgmCansToAZ.selectedSegmentIndex,
                            _sgmCansFromStep.selectedSegmentIndex,
                            _chkStepCan1.isOn,
                            _chkStepCan2.isOn,
                            _chkStepCan3.isOn,
                            _chkStepCan4.isOn,
                            _sgmToteStack.selectedSegmentIndex,
                            _stpToteScore.value,
                            _stpCanCaps.value,
                            _sgmHighCap.selectedSegmentIndex,
                            _stpCannedLitter.value,
                            _sgmDoofus.selectedSegmentIndex,
                            _sgmStrategy.selectedSegmentIndex,
                            _sgmSkizzles.selectedSegmentIndex,
                            ];
    NSString *docPath= [NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, YES)objectAtIndex:0];
    NSString *fileName=[NSString stringWithFormat:@"crap.csv"];
    if(number<10)
        fileName =[NSString stringWithFormat:@"00%@.csv",
                   self->_lblMatchNum.text];
            */


    
}
- (void) nextMatch
{
    

}
@end
