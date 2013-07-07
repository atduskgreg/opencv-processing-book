# Track All the Things

## Face Detection

_Pointing cameras at people_

### Video Summary

### Quiz

### Code

#### Important Functions

* <code>opencv.loadCascade()</code> - Setup for face tracking (or other cascade-based tracking).
* <code>OpenCV.CASCADE_FRONTALFACE_ALT</code> - A constant referring to the standard cascade for detecting faces. Pass this to <code>opencv.loadCascade()</code> to setup for face detection.
* <code>opencv.detect()</code> - Detect objects in the current image based on the configured cascade. Returns an array of Rectangle objects.

#### Browse the Code

* Detect faces in video
* Detect clocks with a different cascade