### Face Tracking Video Script

[Face detection running]

* In this project we'll learn how to detect faces in still images and live video.
* OpenCV includes a function for detecting faces that's very easy to use.
* However in order to understand its limitations and the situations where it will work, you need to learn a little bit about how face detection actually works.

[viola-jones paper scroll?]

* OpenCV's face detector uses an algorithm called Viola-Jones that was originally published in this paper here.
* It works by matching patterns of light and dark squares to different areas of the image at different scales.
* Faces have a consistent arrangement of highlights and shadows  based on how light falls on the nose, cheeks, forehead, and other facial features.
* The Viola-Jones algorithm can be trained to recognize these patterns by being shown lots of pictures of faces. This process is very resource intensive and takes a long time to complete.
* When complete, this training process results in a file called a "cascade", which can be loaded into OpenCV and used for realtime detection without having to go through the painstaking process of training each time.
* The cascade that's used most often is trained on frontal faces.

 

[cv dazzle makeup image]

* For his CV Dazzle project, artist Adam Harvey designed makeup that camouflages the wearer from Viola-Jones face detection.
* Harvey's designs work by introducing dark and light patches on the face in areas where they don't usually appear, frustrating the detection algorithm.

[cv dazzle before video]

* In order to design these patterns, Harvey created visualizations, like this one, that clearly show how the Viola-Jones algorithm works.
* What you're seeing here represents what happens when we detect faces just slowed down to the point where we can understand it.
* The algorithm is searching across the image, in different locations and scales.
* At each point, it compares a series of black and white patterns with the image, looking for equivalent areas of brightness and darkness of the image.
* When it finds enough of these, overlapping just the right way, it's matched a face.

[itp picture]

* This detection technique isn't limited to just one face.
* Here you can see it finding 79 faces in a single image.
* It will find every face in the image that it can. Keep in mind, though: the more faces that are present, the longer it will take to process each image.

[Alternative cascade montage]

* This technique is not just limited to whole faces.
* Researchers have trained cascades for:
* individual parts of the face like nose and ears
* Pedestrians on the street
* even clock faces.

[face detection running] 

* Face detection is one of the most useful and most widely deployed computer vision techniques in the world.
* In another project, we'll look at how to keep track of which face is which as we track them over time.