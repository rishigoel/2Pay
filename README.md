# 2Pay

For this project, I've decided to walk you through my full design process.  

### Introduction 

Nowadays, people love using their mobile phones.  Some prefer using it over their PC.  In fact, there were 200 million more mobile users than desktop/laptop users last year.  Because of this trend, more and more systems are being integrated into mobile platforms, so that they do not reduce the overall UX.  Some have done this very well, while others have not.  When it comes to shopping on mobile platforms, conventional sites require the user to manually enter in their billing information and shipping address.  Manually typing in vast amounts of information on one's mobile phone leads to a poor user experience, as it can be confusing and time consuming.  

### Problem Statement

How can we simplify the mobile shopping process?

### Competitive Landscape

Others have tried to solve this problem.  On newer versions of iOS for example, the user can save their credit card information on their phone.  Sites like AO.com, Crate and Barrel, and Topshop have used design elements such as big buttons and progress bars to create a better experience.  AO.com also allows the user to type in their postal code, and the site determines their address for them.  Reiss uses a real-time address finder.  Finally, Card.Io, now a subsidiary of PayPal, created a library to gather the user's payment information by scanning their credit card.  

### Persona - Kyle Dejong

![alt text](https://github.com/rishigoel/2Pay/blob/master/Sketched%20Persona%20Pic.png)

### Concept Sketches

##### Option 1

![alt text](https://github.com/rishigoel/2Pay/blob/master/Lo-fi%20Option%201%20Wireframe.JPG)

##### Option 2

![alt text](https://github.com/rishigoel/2Pay/blob/master/Lo-fi%20Option%202%20Wireframe.JPG)

Above are two concepts I have for this problem.  The first is similar to the current process.  For the shipping information, the user starts typing in their address.  The backend would then try to autofill the necessary information.  As for the billing information, the user would have to type in their credit card number.  For the second option, I decided to get a bit more creative.  Rather than type in any information, the user would simply press two icons.  The first would scan their drivers license and then pull out the necessary shipping information.  The second would scan their credit card, using Card.Io, an open source library I've used before.  It can pull out the necessary billing information.

### Mockups

So, I decided to go with a variation of option 2.  Basically, in order for the user to enter in their billing and shipping information, all they have to do is scan their driver's license and credit card.  However, I changed it up a bit, as I separated the one screen drawn above into 5 screens, so that I could avoid confusion amongst the users.  My solution will also allow the user to review their information before proceeding to the next step and eventually purchasing their products.  The screens are displayed in their natural order below.  

![alt text](https://github.com/rishigoel/2Pay/blob/master/Mockups/Shipping_iphone6plus_gold_portrait.png) ![alt text](https://github.com/rishigoel/2Pay/blob/master/Mockups/Shipping%20Confirm_iphone6plus_gold_portrait.png) ![alt text](https://github.com/rishigoel/2Pay/blob/master/Mockups/Billing_iphone6plus_gold_portrait.png) ![alt text](https://github.com/rishigoel/2Pay/blob/master/Mockups/Billing%20Confirm_iphone6plus_gold_portrait.png) ![alt text](https://github.com/rishigoel/2Pay/blob/master/Mockups/Review_iphone6plus_gold_portrait.png)



### Coming soon:

Solution
