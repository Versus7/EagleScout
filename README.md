# Why tis code needs MVVM
## Model, View, View-Model

The main reason that I'm thinking about implementing MVVM here is for persistence.
Persistence will not be possible unless I can control when to save new scouting reports (when the form is submit), through the view
Yes, SwiftUI takes control of a lot of the business logic for me, but that is not a sustainable, long-term coding style.
By adding a View-Model, I can control all of this, and get more control over everything, rather than the direct connection between views and models that I currently have.

[ ] Look into MVVM (I think I did it for tetris)
