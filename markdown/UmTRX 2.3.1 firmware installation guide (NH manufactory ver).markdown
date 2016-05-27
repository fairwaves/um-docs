![](http://s017.radikal.ru/i435/1409/3a/35cfd52210c9.png)

## UmTRX 2.3.1. Firmware installation guide (NH manufacturing version)

####Turn on laptop and choose *Ubuntu+*

**1.** Plug the cables to the UmTRX board

![](http://s52.radikal.ru/i138/1505/79/95db0832ac7d.png)

![](http://s009.radikal.ru/i310/1505/a9/3f28c2cef72c.jpg)

Make sure you plug JTAG cable correct

![](http://s014.radikal.ru/i326/1505/33/628de481d9fc.png)

pull the switch (1,2) in to ON position

![](http://s50.radikal.ru/i130/1505/d0/e06dee4344ab.png)

**2.** Open the terminal (**ctrl+alt+t**) and run super user mode:

	shell> sudo -s

**password:** fairwaves

**3.** Now go to **umtrx** directory on the Laptop which contains all files and utils for the firmware UmTRX board:

	shell> cd umtrx/ 

![](http://s017.radikal.ru/i433/1411/7a/f16487835048.jpg)

and run **tester.py**


	shell> ./tester.py


![](http://s017.radikal.ru/i441/1411/52/d07003dce853.png)

### All described above is Initial startup. Don't need to do that again afterwards!!!
_______

**4.** **Debug console** should always be check marked

**5.** Set the serial number and press start.

**Note:** Serial number should be marked on the board itself by marker and match with the number you've typed



**NOTE:** Usually it takes 4 minutes to load firmware per one UmTRX board.


Procedures for boards that failed:
-------
**Retest it:** 
 
Make sure all cables, connectors, and pins are tightly and securely connected. Sometimes the cause of failure is that the connectors are not fully pushed down into the pins.

##### If it fails again:

 - label the failed board that state it being "non-conforming" and include the serial number
 
 - include a quick note about why the board failed (the software should show where along the way it failed)
 
 - seperate the failed board into a different bin, labeled "non-conforming," away from the non-failed, conforming boards 
