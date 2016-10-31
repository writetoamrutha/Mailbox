//
//  MailboxViewController.swift
//  Mailbox
//
//  Created by Amrutha Krishnan on 10/30/16.
//  Copyright © 2016 Amrutha Krishnan. All rights reserved.
//

import UIKit

class MailboxViewController: UIViewController {

    
    @IBOutlet weak var mailboxScrollView: UIScrollView!
    @IBOutlet weak var messageView: UIView!
    @IBOutlet weak var messageBgView: UIView!
    @IBOutlet weak var overviewView: UIView!
    @IBOutlet weak var overlayImageView: UIImageView!
    
    @IBOutlet weak var feedImage: UIImageView!
    
    @IBOutlet weak var messageImageView: UIImageView!
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    
    
    var messageOriginalPosition: CGPoint!
    var messageSlideOffset: CGFloat!
    var messageSlideLeft: CGPoint!
    var messageSlideRight: CGPoint!
    var messageHeight: CGFloat!

  

    var leftIconOriginalPosition: CGFloat!
    var rightIconOriginalPosition: CGFloat!
    
    
    
    
    var archiveIcon: UIImage! = UIImage(named: "archive_icon")
    var deleteIcon: UIImage! = UIImage(named: "delete_icon")
    var listIcon: UIImage! = UIImage(named: "list_icon")
    var laterIcon: UIImage! = UIImage(named: "later_icon")
    
   
    
   
    var rescheduleImage: UIImage! = UIImage(named: "reschedule")
    var listImage: UIImage! = UIImage(named: "list")
    
    
    
    
    var archiveColor = UIColor(red: 0, green: 0.8588, blue: 0.5137, alpha: 1.0) /* #00db83 */
    var defaultColor = UIColor(red: 0.8667, green: 0.8667, blue: 0.8667, alpha: 1.0) /* #dddddd */
    var deleteColor = UIColor(red: 0.898, green: 0.298, blue: 0.2784, alpha: 1.0) /* #e54c47 */

    var listColor = UIColor(red: 0.749, green: 0.5686, blue: 0.2314, alpha: 1.0) /* #bf913b */

    var laterColor = UIColor(red: 0.9882, green: 0.7843, blue: 0.3059, alpha: 1.0) /* #fcc84e */

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        mailboxScrollView.contentSize = CGSize (width: 320, height: 1340)
        
        
        
        overviewView.alpha = 0
        
        
        messageSlideOffset = 300

           messageSlideLeft = CGPoint (x: messageView.center.x - messageSlideOffset, y: messageView.center.y)
        
        messageSlideRight = CGPoint (x: messageView.center.x + messageSlideOffset, y: messageView.center.y)
        
        messageHeight = messageBgView.frame.height
        
        leftIconOriginalPosition = leftImageView.frame.origin.x
        rightIconOriginalPosition = rightImageView.frame.origin.x
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    
    @IBAction func didPanMessage(_ sender: UIPanGestureRecognizer) {
        
       
        if sender.state == .began
        {
            messageOriginalPosition = messageView.center
   
        }else if sender.state == .changed{
            
            
            
             let newPosition = messageOriginalPosition.x + sender.translation(in: view).x
            sender.view?.center = CGPoint (x: newPosition, y: messageOriginalPosition.y)
            
            
            
            
            if newPosition <= -50{
                messageBgView.backgroundColor = listColor
                rightImageView.image = listIcon
            }
            else if newPosition <= 20{
                messageBgView.backgroundColor = laterColor
                rightImageView.image = laterIcon
            }else if newPosition <= 270{
                messageBgView.backgroundColor = defaultColor
                rightImageView.image = laterIcon
            }else if newPosition <= 410{
                messageBgView.backgroundColor = archiveColor
                  leftImageView.image = archiveIcon
            }else {
                messageBgView.backgroundColor = deleteColor
                leftImageView.image = deleteIcon
            }
            
            
            
            leftImageView.alpha = 1
            rightImageView.alpha = 1
            print(sender.view!.frame.origin.x)
            
            if sender.view!.frame.origin.x >= -60
            {
                leftImageView.frame.origin.x = sender.view!.frame.origin.x - 50
                
            }
            
            if sender.view!.frame.origin.x <= 60
            {
                let rightEdge = sender.view!.frame.origin.x + sender.view!.frame.width
                print(rightEdge)
                rightImageView.frame.origin.x = rightEdge + 30
                
            }
            
            
            
        
            
            
            
            
            
        }
        
        
        
        else if sender.state == .ended{
          
            let newPosition = sender.view!.center.x
            let currentYPos = sender.view!.center.y
            
            
            if newPosition <= -50{
                
               UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: { 
               self.messageView.center = CGPoint(x: -600, y: currentYPos)
                

                }, completion: { (Bool) in
                    self.overlayImageView.image =
                        self.listImage
                    self.overviewView.alpha = 1

               })
                
                
                
                
                
            } else if newPosition >= -50 && newPosition <= 20 {
                
               // UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                 //   self.messageView.center = CGPoint(x: -600, y: currentYPos)
                //    }, completion: { (Bool) in
                //        self.overlayImageView.image = self.rescheduleImage
               //         self.overviewView.alpha = 1
                        

           //     })
                
                
                
                
               
               
            
            
            
            }
        //else if newPosition >= 20 && newPosition <= 270{
                
                
                
             //   UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
               //     self.messageView.center = CGPoint(x: 600, y: currentYPos)
                 //   }, completion: { (Bool) in
                       // self.leftImageView.frame.origin.x = self.leftIconOriginalPosition
                   //     self.leftImageView.frame.origin.x = 60
                        //self.rightImageView.frame.origin.x = self.rightIconOriginalPosition
               // })
                
                
                
            //}
          //  else if newPosition >= 270 && newPosition <= 410{
                
          //      UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
           //         self.messageView.center = CGPoint(x: 600, y: currentYPos)

           //         }, completion: { (Bool) in
             //           self.messageBgView.backgroundColor = self.defaultColor
              //          self.messageView.frame.origin.x = 0
                //        self.leftImageView.image = self.archiveIcon
                  //      self.rightImageView.image = self.laterIcon
                   //     self.leftImageView.frame.origin.x = self.leftIconOriginalPosition
                        //self.rightImageView.frame.origin.x = self.rightIconOriginalPosition
                       // self.messageImageView.frame.origin.x = self.messageOriginalPosition.x
                        
                        
                    //    UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                         //   self.feedImage.center.y += self.messageHeight
                            
                           // }, completion:nil)
                        
                       // UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
                            //self.feedImage.center.y -= self.messageHeight
               //             }, completion:nil)

                        
                        
                        
                       
             //   })
                
        //    }
        else
            {
                UIView.animate(withDuration: 0.5, animations: { () -> Void in
                    
                    self.messageView.center = CGPoint(x: 600, y: currentYPos)
                    }, completion: { (Bool) in
                        self.messageBgView.backgroundColor = self.defaultColor
                        self.messageView.frame.origin.x = 0
                        self.leftImageView.image = self.archiveIcon
                        self.rightImageView.image = self.laterIcon
                        self.leftImageView.frame.origin.x = self.leftIconOriginalPosition
                        self.rightImageView.frame.origin.x = self.rightIconOriginalPosition
                        self.messageImageView.frame.origin.x = self.messageOriginalPosition.x
                        
                        
                        UIView.animate(withDuration: 0.3, animations: { () -> Void in
                            self.feedImage.center.y -= self.messageHeight
                        })
                        
                        
               
                
            })
        }
        
            
        

        
        
    
    
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
}
}
