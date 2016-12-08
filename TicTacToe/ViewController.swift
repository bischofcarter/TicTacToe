//
//  ViewController.swift
//  TicTacToe
//
//  Created by Carter Bischof on 11/18/16.
//  Copyright © 2016 Carter Bischof. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var gridView: UIView!
    
    @IBOutlet weak var labOne: Grid_Label!
    
    @IBOutlet weak var labTwo: Grid_Label!
    
    @IBOutlet weak var labThree: Grid_Label!
    
    @IBOutlet weak var labFour: Grid_Label!
    
    @IBOutlet weak var labFive: Grid_Label!
    
    @IBOutlet weak var labSix: Grid_Label!
    
    @IBOutlet weak var labSeven: Grid_Label!
    
    @IBOutlet weak var labEight: Grid_Label!
    
    @IBOutlet weak var labNine: Grid_Label!
    
    var labelsArray : [Grid_Label] = [ ]
    
    var myGrid = Grid_Label()
    
    
    
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        labelsArray = [labOne, labTwo, labThree, labFour, labFive, labSix, labSeven, labEight, labNine]
        
    }
    @IBAction func screenTapped(sender: AnyObject)
    {
        print ("Screen Tapped!")
        
        for label in labelsArray
            //Iterate through labels array
        {
            if CGRectContainsPoint(label.frame, sender.locationInView(gridView))
            {
                if label.canTap == true
                {
                
                if myGrid.xTurn == true
                {
                    label.text = "😈"
                }
                    
                else
                {
                    label.text = "😠"
                }
                
                myGrid.xTurn = !myGrid.xTurn
                    label.canTap = false
                    myGrid.count += 1
                    print(myGrid.count)
                }
            }
        }
        checkWinner()
    }

    
        func checkWinner()
    {
        if labOne.text == labTwo.text && labTwo.text == labThree.text && labOne.text != ""
        {
            print("Winner!")
            win(labOne.text!)
        }
        if labFour.text == labFive.text && labFive.text == labSix.text && labFour.text != ""
        {
            print("Winner!")
            win(labFour.text!)
        }
        if labSeven.text == labEight.text && labEight.text == labNine.text && labSeven.text != ""
        {
            print("Winner!")
            win(labSeven.text!)
        }
        if labOne.text == labFive.text && labFive.text == labNine.text && labOne.text != ""
        {
            print("Winner!")
            win(labOne.text!)
        }
        if labOne.text == labFour.text && labFour.text == labSeven.text && labOne.text != ""
        {
            print("Winner!")
            win(labOne.text!)
        }
        if labTwo.text == labFive.text && labFive.text == labEight.text && labTwo.text != ""
        {
            print("Winner!")
            win(labTwo.text!)
        }
        if labThree.text == labSix.text && labSix.text == labNine.text && labThree.text != ""
        {
            print("Winner!")
            win(labThree.text!)
        }
        if labThree.text == labFive.text && labFive.text == labSeven.text && labThree.text != ""
        {
            print("Winner!")
            win(labThree.text!)
        }
        if myGrid.count == 9
        {
            win("No One")
        }
    }




func win(winner:String)
{
    //Displays alert view controller
    
    let alert = UIAlertController(title: winner + " is the winner!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
    
    let resetButton = UIAlertAction(title: "Play Again", style: UIAlertActionStyle.Default, handler: {sender in
        
        for labels in self.labelsArray
        {
            labels.text = ""
            labels.canTap = true
        }
        self.myGrid.xTurn = true
        self.myGrid.count = 0
    })
    alert.addAction(resetButton)
    presentViewController(alert, animated: true, completion: nil)
}
}








