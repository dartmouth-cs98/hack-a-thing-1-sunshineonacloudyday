# hack-a-thing-1-sunshineonacloudyday
# Lauren Mitchell and Cristina Curcelli

# What we attempted to build
We followed this tutorial: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/index.html#//apple_ref/doc/uid/TP40015214-CH2-SW1 in its entirety, so this repo is very reflective of the code written there

This made an application with the ability the following screens:

Meal Table View Screen: a list with a small image view of each meal, as well as its rating and name

Meal Edit/ New Meal Screen: this screen can either create a new meal where you can add photo/name/rating or can adjust the settings of a previously defined meal

We then updated the updated the app to the following:

It is now an app for ratings on dog breeds!
The app also takes care of the pesky incident where photos that are not totally square are no longer distorted into a forced square.
Also, when inserting a new dog breed, it will insert the breed into the table view at the correct location such that breeds are sorted by rating - because who doesn't want their favorite dog on top?!

# Limitations

When you adjust a dog breed rating (i.e. click from the Breed Table View Screen to a dog's Breed Edit Screen, and then save the changed rating), the breed will not re-sort appropriately, but rather maintain its same rank as prior to the edit. 

# Who did what

Cristina did parts: (Part 1)Build a Basic UI, Connect the UI to Code (together in class), Define Your Data Model, (Part 2) Create a Table View, Implement Navigation, Implement Edit and Delete Behavior, (After tutorial) refactored to dog breeds and fixed photo distortion

Lauren did parts: (Part 1) Connect the UI to Code (together in class), Work with View Controllers, Implement a Custom Control, (Part 2) Persist Data, (After tutorial) implemented logic so that ratings are ordered correctly in the table view

# What you learned
Lauren: I learned a lot more about the XCode simulator than I had previously known. I had also never coded in Swift before, and have also never used a language where half of it involved physically dragging and dropping elements in a GUI like fashion. For me, I did not like this style of coding since I felt as though I had less control over how different components interacted with each other. I would rather have written out in code how each component interacted rather then dragged and dropped connections and used dropdown menus. I had also never created a mobile app before so this was a a very interesting experience, which I thought would have been more like designing a website.

Cristina: In terms of Swift as a language and the XCode IDE, Swift itself is similar enough to C and its relatives that the code didn't throw us too much for a loop. But Swift has an odd way of walking the line between being a GUI that the programmer interacts with to create a UI and being an actual coding language. The language is definitely geared toward "easy app development" -- which it was -- but I think because of the process of creating a UI and then connecting that UI to the code, I actually found it more difficult to understand what was controlled and created by the "Storyboard", that is, the UI creation experience, versus what we actually coded in the .swift files. I'm sure there is a workaround here, though, and a way to create the UI elements in the .swift files to avoid using the somewhat disorienting Storyboard. 

# What didn't work
Lauren: Again because of dragging and dropping to make connections, if I were to make one mistake when I initially connected different features, this would introduce a lot of bugs later down the line, and then when I would attempt to remedy it in a quick-fix, this would introduce more bugs, so I would end up deleting the entire feature and starting over to make the connection correct again. I found Swift to be very unforgiving in that sense. Also learning a new language and following a tutorial, I find that a lot of the nuances of what the code actually means are a bit lost.

Cristina: I found the tutorial instructions accurate and explicit - following them to a tee worked. A lot of the code was fed to us, including Swift-specific things I wouldn't have known (i.e. switch statements, guard statements, different data types, etc.), so not needing to look through documentation to find that was probably a long-term downside, since it'll be more difficult to reproduce in the future on our end. 
