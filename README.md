# _AutoHandBrake - a Windows batch file that automates Handbrake processing_
#### By _**Garrett Carver**_
_email: gariti@gmail.com_

##### _someone posted this request on [Reddit](https://www.reddit.com/r/VideoEditing/comments/3n61w2/does_any_compression_software_allow_you_to_start/) wondering how they can completely automate video encoding using HandBrake. The solution I created is a batch file that will run Handbrake on every video file in it's current directory.  Combined with windows task scheduler, this will automate this process completely_

## Setup

1. Download AutoHandBrake [here](https://github.com/gariti/AutoHandBrake/archive/master.zip) and unzip all files somewhere on your local drive

2. Open up AutoHandBrake.bat with a text editor

3. Modify **set HANDBRAKE_EXE_LOC=".\HandBrakeCLI.exe** and set it to the full path to **'HandBrakeCLI.exe'** EXAMPLE: **set HANDBRAKE_EXE_LOC="C:\HandBrakeCLI.exe"**

4. (optional) Modify **set HANDBRAKE_OPTIONS=** and add any commandline options that you need handbrake to use. See handbrakeCommands.txt for full list of options (note: there is no need to set the input & output, as the batch file already does this) EXAMPLE: **set HANDBRAKE_OPTIONS=-r 10**

5. (optional) Modify **set OUTPUT_NAME_MODIFIER=_hb** to change the output file name modifier

6. Place AutoHandBrake.bat in same directory where your video files live.

7. Run the batch file to start converting all video files in that folder.  A folder called 'HandBrake_Output' will appear and it will put the output video files there

8. To fully automate, add ' AutoHandBrake.bat ' to Windows Task Scheduler.





### Legal

Copyright (c) 2015 **_Garrett Carver_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
