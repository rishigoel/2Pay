# 2Pay

For this project, I've decided to walk you through my full design process.  

### Introduction 

Nowadays, people love using their mobile phones.  Some prefer using it over their PC.  In fact, there were 200 million more mobile users than desktop/laptop users last year.  Because of this trend, more and more systems are being integrated into mobile platforms, so that they do not reduce the overall UX.  Some have done this very well, while others have not.  When it comes to shopping on mobile platforms, conventional sites require the user to manually enter in their billing information and shipping address.  Manually typing in vast amounts of information on one's mobile phone leads to a poor user experience, as it can be confusing and time consuming.  

### Problem Statement

How can we simplify the mobile shopping process?

### Competitive Landscape

Others have tried to solve this problem.  On newer versions of iOS for example, the user can save their credit card information on their phone.  Sites like AO.com, Crate and Barrel, and Topshop have used design elements such as big buttons and progress bars to create a better experience.  AO.com also allows the user to type in their postal code, and the site determines their address for them.  Reiss, another company trying to enhance this experience, uses a real-time address finder.  Finally, Card.Io, now a subsidiary of PayPal, created a library to gather the user's payment information by scanning their credit card.  

### Persona - Kyle Dejong

![alt text](https://github.com/rishigoel/2Pay/blob/master/Sketched%20Persona%20Pic.png)

### Concept Sketches

##### Option 1

![alt text](https://github.com/rishigoel/2Pay/blob/master/Lo-fi%20Option%201%20Wireframe.JPG)

##### Option 2

![alt text](https://github.com/rishigoel/2Pay/blob/master/Lo-fi%20Option%202%20Wireframe.JPG)

Above are two concepts I have for this problem.  The first is similar to the current process.  For the shipping information, the user starts typing in their address.  The backend would then try to autofill the necessary information.  As for the billing information, the user would have to type in their credit card number.  For the second option, I decided to get a bit more creative.  Rather than type in any information, the user would simply press two icons.  The first would scan their drivers license and then pull out the necessary shipping information.  The second would scan their credit card, using Card.Io, an open source library I've played around with.  It is capable of pulling out the necessary billing information.

### Mockups

So, I decided to go with a variation of option 2.  Basically, in order for the user to enter in their billing and shipping information, all they have to do is scan their driver's license and credit card.  However, I changed it up a bit, as I separated the one screen drawn above into 5 screens, so that I could avoid confusion amongst the users.  My solution will also allow the user to review their information before proceeding to the next step and eventually purchasing their products.  The screens are displayed in their natural order below.  I chose to design both icons used on the screen, in order to keep my skills sharp.

![alt text](https://github.com/rishigoel/2Pay/blob/master/Mockups/Shipping_iphone6plus_gold_portrait.png) 
![alt text](https://github.com/rishigoel/2Pay/blob/master/Mockups/Shipping%20Confirm_iphone6plus_gold_portrait.png) 
![alt text](https://github.com/rishigoel/2Pay/blob/master/Mockups/Billing_iphone6plus_gold_portrait.png) 
![alt text](https://github.com/rishigoel/2Pay/blob/master/Mockups/Billing%20Confirm_iphone6plus_gold_portrait.png) 
![alt text](https://github.com/rishigoel/2Pay/blob/master/Mockups/Review_iphone6plus_gold_portrait.png)



### Solution and Usability Testing:

The prototype is finished.  I was able to follow the screens almost to a tee, and both scanning functionalities work.  I am able to pull the shipping information from the driver's license by using AVFoundation to scan the barcode.  It's actually pretty cool what info the license contains - basically everything you see on the front.  As for the card, I used CardIO to get the billing information.  

Once completed, I performed some usability testing amongst my friends.  Ideally, I would conduct the testing with someone who fits my persona, but I'm at school, so I have to use what is available to me.  One key takeaway was scanning the driver's license all depended on the lighting conditions.  If the lighting was poor, it would not scan.  Some users were unaware of this, and got frustrated.  However, for those whom the scanning did work, they all noted how much faster my prototype was than the conventional method.  They all were intrigued by the technology and said they would like to see this adopted by companies with an online presence.


### Next Steps

Based on the usability testing, I would add in another screen that explains the driver's license scanning process.  These instructions would include: the proper orientation, the adequate amount of light, and a frame for the license.  This screen would hopefully reduce the potential frustration for the user, as they would be aware of what is going on.  At the moment, when the card is scanning, there is no information provided to the user.  This needs to be changed, so that they are kept in the loop.   
