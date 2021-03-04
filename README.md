# iOS Assessment

iOS Assessment for ULesson

# Stack

The following Technology stack was used in this project :

**Swift** : Programming Language

**XCode** : IDE

# Steps To Run

**1** - Do a git clone of the project : 

**2** - Launch XCode

**3** - Run the challenge.xcodeproj file


# Process

**VIEWCONTROLLERS:**

- The DashboardController and SubjectController UICollectionViewControllers were designed with the new Swift ConpositionalLayout Pattern. This gave the flexibility of managing multiple sections with different UICollectionViewCells, all within one UICollectionViewController.

- UICollectionReusableViews were also used to handle supplementary views. These views were reused in both the DashboardController and SubjectController

**REUSABLE COMPONENTS AND EXTENSIONS**
Reusable components and extensions to view classes were also created to handle easy creation of UIView Components. Classes like VideoView was also created with re-usability in mind. Also Reusable animation UIView classes were created for Viewcontroller backgrounds
Also note the random SubjectCell background color and animation


**ANIMATION**
- Custom Animation utils were created and can be called any UIViewclass


**COREDATA**
- This test covers only the Recently watched videos. And this is populated once a video is opened.
- Persisting the Subjects, Chapters from the api request would take me a little longer to restructure and persist (Time Constraint)

**AUTOLAYOUT**
- A shorthand autholayout UIView extension was applied for most of the layouts

**LIBRARIES**
- The only Libraries used was KingFisher for displaying remote images url on UIImageviews

**ISSUES**
- The test specified using ExoPlayer for the vide, however, exoplanet of an android library. For this used AVPlayer, custom to iOS AVKit and AVFoundation
- I had last minute issues with AVPlayer, stopped rendering video. I’ll figure that out and make another push, if required.
- Time Constraint: I ran out of time implementing the video controls as well as UI Tests