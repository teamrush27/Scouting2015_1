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
}}
// Submit Button Area
    - (IBAction)submit:(id)sender
{
    [self save];
    [self nextMatch];
}
- (void) save
{
   
// Saves the data in order of resultLine based on what we want in the code.
 int number = [_stpMatchNum value];
    NSString *resultLine = [NSString stringWithFormat: @"%i,%i,%@,%i,%i,%@,%@,%@,%i,%i,%i,%i,%@,%i,%i,%@,%@,%i,%@,%@,%@",
                     [[NSNumber numberWithDouble:_stpMatchNum.value] intValue],
                     [_txtTeamNum.text intValue],
                     [_sgmStartLocation titleForSegmentAtIndex:fmax(_sgmStartLocation.selectedSegmentIndex,0)],
                     [[_sgmRobotToAZ titleForSegmentAtIndex:fmax(_sgmRobotToAZ.selectedSegmentIndex,0)] boolValue]? 1 : 0,
                     [[_sgmThreeToteStack titleForSegmentAtIndex:fmax(_sgmThreeToteStack.selectedSegmentIndex,0)]boolValue],
                     [_sgmTotesToAZ titleForSegmentAtIndex:fmax(_sgmTotesToAZ.selectedSegmentIndex,0)],
                     [_sgmCansToAZ titleForSegmentAtIndex:fmax(_sgmCansToAZ.selectedSegmentIndex,0)],
                     [_sgmCansFromStep titleForSegmentAtIndex:fmax(_sgmCansFromStep.selectedSegmentIndex,0)],
                     _chkStepCan1.isOn,
                     _chkStepCan2.isOn,
                     _chkStepCan3.isOn,
                     _chkStepCan4.isOn,
                     [_sgmToteStack titleForSegmentAtIndex:fmax(_sgmToteStack.selectedSegmentIndex,0)],
                     [[NSNumber numberWithDouble: _stpToteScore.value] intValue],
                     [[NSNumber numberWithDouble: _stpCanCaps.value] intValue],
                     [_sgmHighCap titleForSegmentAtIndex:fmax(_sgmHighCap.selectedSegmentIndex,0)],
                     [_sgmTeleopCansFromStep titleForSegmentAtIndex:fmax(_sgmTeleopCansFromStep.selectedSegmentIndex,0)],
                     [[NSNumber numberWithDouble: _stpCannedLitter.value] intValue],
                     [_sgmDoofus titleForSegmentAtIndex:fmax(_sgmDoofus.selectedSegmentIndex,0)],
                     [_sgmStrategy titleForSegmentAtIndex:fmax(_sgmStrategy.selectedSegmentIndex,0)],
                     [_sgmSkizzles titleForSegmentAtIndex:fmax(_sgmSkizzles.selectedSegmentIndex,0)]];

    // Code for saving, mainly around the CSV part
    NSString *docPath= [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)objectAtIndex:0];
     NSString *fileName=@"";
     NSString *deviceName = [[UIDevice currentDevice] name];
     if(number<10){
         fileName =[NSString stringWithFormat:@"00%i_%@_%@.csv",
                   [[NSNumber numberWithDouble:_stpMatchNum.value] intValue], deviceName, _txtScouterNum.text];
     }
     else if(number/10<10){
         fileName =[NSString stringWithFormat:@"0%i_%@_%@.csv",
                    [[NSNumber numberWithDouble:_stpMatchNum.value] intValue], deviceName, _txtScouterNum.text];
     }
     else {
         fileName =[NSString stringWithFormat:@"%i_%@_%@.csv",
             [[NSNumber numberWithDouble:_stpMatchNum.value] intValue], deviceName, _txtScouterNum.text];
     }
     NSString *fullFilePath=[docPath stringByAppendingPathComponent:fileName];
     if (![[NSFileManager defaultManager] fileExistsAtPath:docPath]) {
     [[NSFileManager defaultManager]
      createFileAtPath:fileName contents:nil attributes:nil];
     }
     [resultLine writeToFile:fullFilePath atomically:YES encoding:NSUTF8StringEncoding error: nil];


}

// Clears all fields and labels of the app to default settings. Also incraments match number by 1
- (void) nextMatch
{
 
// Match / Team Num
[_stpMatchNum setValue:_stpMatchNum.value +1];
[_txtTeamNum setText:@""];
  

// Auton Below
[_sgmStartLocation setSelectedSegmentIndex:UISegmentedControlNoSegment];
_sgmRobotToAZ.selectedSegmentIndex = 0;
_sgmThreeToteStack.selectedSegmentIndex = 0;
_sgmTotesToAZ.selectedSegmentIndex = 0;
_sgmCansToAZ.selectedSegmentIndex = 0;
_sgmCansFromStep.selectedSegmentIndex = 0;

_chkStepCan1.on = NO;
_chkStepCan2.on = NO;
_chkStepCan3.on = NO;
_chkStepCan4.on = NO;
// Teleop And Misc Below
_sgmStrategy.selectedSegmentIndex = 0;
_sgmToteStack.selectedSegmentIndex = 0;
_sgmHighCap.selectedSegmentIndex = 0;
_stpCanCaps.value = 0;
_stpToteScore.value = 0;
_stpCannedLitter.value = 0;

_sgmTeleopCansFromStep.selectedSegmentIndex = 0;
_sgmSkizzles.selectedSegmentIndex = 2;
_sgmDoofus.selectedSegmentIndex = 0;
// Labels That needed Reseting
[self matchChange:_stpMatchNum];
[self toteScoreChange:_stpToteScore];
[self canCapChange:_stpCanCaps];
[self canLitterChange:_stpCannedLitter];
[self noShow:_sgmSkizzles];
[self didChangeTeamNum:_txtTeamNum];
}

- (IBAction)didChangeLocation:(UISegmentedControl *)sender {
[self didChangeTeamNum:_txtTeamNum];
}
// Limits the length of the text as well enables and disabled the Submit button ( _chkSubmit )
- (IBAction)didChangeTeamNum:(UITextField *)sender {
    
     if ([[sender text] length] > 4) {
        [sender setText:[[sender text] substringToIndex:4]];
}
     if ([_txtTeamNum.text length]!= 0 & _sgmStartLocation.selectedSegmentIndex > -1 & [_txtScouterNum.text length]!= 0) {
        [_chkSubmit setEnabled:YES];
         
}
    else {
    [_chkSubmit setEnabled:NO];
}




}
- (IBAction)didChangeScoutNum:(UITextField *)sender {
    [self didChangeTeamNum:_txtTeamNum];
}
@end
