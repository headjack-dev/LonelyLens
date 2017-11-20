# LonelyLens
Transform fisheye images to equirectangular projections for use in VR players.

![LonelyLens](https://headjack.io/files/gifs/LonelyLens.gif)

## Usage
The latest `LonelyLens.unitypackage` is available from the [releases](https://github.com/headjack-dev/LonelyLens/releases) page.

You can also clone and use the `headjack-dev/LonelyLens` git repository directly in a Unity project. 

Inside, you find a shader, a C# script to enhance performance, and an example scene. You can configure the transformation using the `Angle` and `Width` sliders.

`Angle` is the FOV of the fisheye lens used to shoot the image, for example 250º or 180º.

`Width` is the % of the total image frame the fisheye capture covers, see image below.

![LonelyLens width](https://headjack.io/files/gifs/LonelyLens-width.png)

For example, if the image frame is 2000 pixels wide, and the widest point of the fisheye capture is 1600px, then the `Width` slider should be set to `80%` (1600/2000).
