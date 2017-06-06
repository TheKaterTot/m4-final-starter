# URLockBox
URLockBox is a Rails app that allows users to create and store links.
It uses:
    
    Rails 5.0
    Ruby 2.3.0

![alt text](https://user-images.githubusercontent.com/1721599/26842370-cbac40b0-4aa9-11e7-8077-6482fa41bfd9.png)

This app is built with a restful API based on the resource 'link' (with the exception of /links, which is replaced by the root).

Links marked as 'Top Link' or 'Hot' are dependent on data from a companion app, https://github.com/TheKaterTot/hot_reads, retrieved and compared through a service utilizing Faraday.

## Setup

To set up URLockBox:

1. Clone done this repo.
2. Bundle
3. rake db:setup
4. To run the test suite, rspec
    
    Note: You will need to download version 46 of Firefox [here](https://www.softexia.com/windows/web-browsers/firefox-46). If you do have it, make sure it is on version 46. Selenium does not work with all versions of Firefox, so make sure that you are using Firefox 46 or else it will potentially cause you problems.

    If you already have Firefox and it's on a version more recent than 46, the easiest way to downgrade is to turn off automatic updates, uninstall Firefox, and then install version 46.

## Companion

URLockbox's companion app is live at https://rocky-atoll-70277.herokuapp.com/. Hot Reads tracks which links are most popular for the past 24 hours.

## Using the App

Only valid URLs are accepted in URLockbox links. Links are validated using the validate_url gem.

URLockBox can be viewed live at https://dry-caverns-43653.herokuapp.com/. 
