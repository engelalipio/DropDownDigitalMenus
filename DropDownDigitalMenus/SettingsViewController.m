//
//  DessertsViewController.m
//  DropDownDigitalMenus
//
//  Created by Engel Alipio on 10/24/14.
//  Copyright (c) 2014 Digital World International. All rights reserved.
//

#import "SettingsViewController.h"
#import "AppDelegate.h"
#import "Constants.h"

@interface SettingsViewController (){
    AppDelegate *appDelegate;
    NSArray *languages;
}

-(void) initLanguages;
-(void) configureFields;
@end

@implementation SettingsViewController


-(void) initLanguages{
    if (!languages){
       
        languages = [[NSArray alloc] initWithObjects:@"English", @"Spanish", @"French",
                    @"Italian", @"Portuguese", @"German", @"Russian", @"Dutch", @"Korean", @"Croatian",@"Greek",  nil];
 
    }
}

-(void) configureFields{

    [self.savedLabel setHidden:YES];
    [self.txtTableNumber setText:[appDelegate restaurantTable]];
    [self.txtName setText:[appDelegate restaurantName]];
    [self.txtAddress setText:[appDelegate restaurantAddress]];
    [self.txtCity setText:[appDelegate restaurantCity]];
    [self.txtState setText:[appDelegate restaurantState]];
    [self.txtZip setText:[appDelegate restaurantZip]];
    
    if (! self.pickerLanguage){
        self.pickerLanguage  = [[UIPickerView alloc] init];
    }
    [self.pickerLanguage setDelegate:self];
    [self.pickerLanguage setDataSource:self];
    
    if (! self.switchDynamic){
        self.switchDynamic = [[UISwitch alloc] init];
    }
    [self.switchDynamic setOn:[appDelegate isDynamic]];
    
    if (! self.txtSeconds){
        self.txtSeconds = [[UITextField alloc] init];
    }
    
    [self.txtSeconds setText:[NSString stringWithFormat:@"%d",[appDelegate interval]]];
    
}

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return languages.count;
}

-(void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    NSString *language = [languages objectAtIndex:row];
    
    [self.languageImage setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",[language uppercaseString]]]];
    
}


-(UIView*) pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row
         forComponent:(NSInteger)component
          reusingView:(UIView *)view{
    
    int w = 0,
        h = 0;
    
    NSString *labelText = @"";
    
    switch (component) {
        case 0:
            w = 200;
            h = 21;
            
            labelText = [languages objectAtIndex:row];
            
            break;
    }
    
    CGRect labelFrame = CGRectMake(0.0f, 0.0f, w, h);
    
    UILabel *pickerLabel = [[UILabel alloc] initWithFrame:labelFrame];
    
    [pickerLabel setText:labelText];
    
    
    return  pickerLabel;
    
}



-(void) viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

    [self configureFields];

    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    if (! appDelegate){
        appDelegate = [AppDelegate currentDelegate];
    }
    [self initLanguages];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)actionSaveSettings:(UIButton *)sender {
    
    [appDelegate setRestaurantTable:self.txtTableNumber.text];
    [appDelegate setRestaurantName:self.txtName.text];
    [appDelegate setRestaurantCity:self.txtCity.text];
    [appDelegate setRestaurantState:self.txtState.text];
    [appDelegate setRestaurantZip:self.txtZip.text];
 
    NSInteger selectedLanguageIndex = [self.pickerLanguage selectedRowInComponent:0];
    
    if (selectedLanguageIndex > -1){
        NSString *language = [languages objectAtIndex:selectedLanguageIndex];
        [appDelegate setLanguage:language];
    }
    
    [appDelegate setIsDynamic:self.switchDynamic.isOn];
    
    [appDelegate setInterval:[self.txtSeconds.text integerValue]];
    
    if (self.switchOrderReset.isOn){
        [appDelegate setIsSent:NO];
        [appDelegate setIsPaid:NO];
    }
    
    [self.savedLabel setHidden:NO];
   
}

- (IBAction)actionChangeInterval:(UIStepper *)sender {
   
    NSInteger seconds = 0;
    
    seconds = self.stepperInterval.value;
    
    if (seconds <=0){
        seconds = 0;
    }
    
    [self.txtSeconds setText:[NSString stringWithFormat:@"%d",seconds]];
    
}

- (IBAction)actionDynamicChanged:(UISwitch *)sender {
    
 
   [self.stepperInterval setEnabled:self.switchDynamic.isOn];
    
}
@end
