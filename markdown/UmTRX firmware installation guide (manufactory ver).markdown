![](http://s017.radikal.ru/i435/1409/3a/35cfd52210c9.png)

## UmTRX. Firmware installation guide (manufacturing version)

####Turn on laptop and choose *Ubuntu+*

**1.** Plug the cables to the UmTRX board

![](http://s020.radikal.ru/i712/1411/6c/5d94fbd5f9f1.jpg)

make sure you pull the switch down (for both baseline and Tx version)

![](http://s017.radikal.ru/i406/1411/93/21805c64d9a2.png)

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

**4.** **Check mark** in the 4xDDC firmware square if it is only the baseline version of UmTRX (not for the **-Tx version**) **Debug console** should always be check marked

**5.** Set the serial number and press start.

*Baseline* -- **BB001** (**B**=Baseline (fixed), **B**=Batch series (can change), **001**=UmTRX number. increment by 1) 

*Tx* -- **XA001** (**X**=Tx (fixed), **A**=Batch series (can change), **001**=UmTRX number. increment by 1)

**Note:** Serial number should be marked on the board itself by marker and match with the number you've typed

 

![](http://s50.radikal.ru/i127/1411/4f/808bf5326462.jpg)

**NOTE:** Usually it takes 4 minutes to load firmware per one UmTRX board.

When it's properly finished, you should hear a ringing sound and see a text that indicates that it's done.


Procedures for boards that failed:
-------
**Retest it:** 
 
Make sure all cables, connectors, and pins are tightly and securely connected. Sometimes the cause of failure is that the connectors are not fully pushed down into the pins.

##### If it fails again:

 - label the failed board that state it being "non-conforming" and include the serial number
 
 - include a quick note about why the board failed (the software should show where along the way it failed)
 
 - seperate the failed board into a different bin, labeled "non-conforming," away from the non-failed, conforming boards 
