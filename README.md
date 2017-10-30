# *Vivace*, by Macrohard

## E-commerce Site Description
Macrohard Incorporated is a software company that has been in business since 2015. They employ close to 30 people to handle development and operations. Their focus had been to assist developers in creating software through their innovative developer tools; their flagship product being Material Workshop at the time. Unfortunately, Macrohard has fallen on hard times, and their software development products have been failing to meet sales goals for the last year. The company is desperate to acquire a new source of revenue.

Almost too conveniently for the company, President Jack Boxington, had an obsession with bad music. In fact, he was so obsessed, he also owned a small shop downtown that exclusively sold physical copies of bad music. He found moderate success; the store quickly became the CEO's primary source of income, thanks to the recent popularization of irony in today's youth. After months of watching his customers poke around on their phones, a solution to Macrohard's dilemma hit the man like a bullet train.

For Jack, it was a no-brainer: to save Macrohard, reform the company to sell bad music over the Web!

Macrohard is looking to potential web developers to create this website, dubbed Vivace. The website should present bad music first and foremost, with options for listening to and purchasing individual songs. 

## Database Structure Description
erd.xml is a Draw.io XML file that contains the entity-relationship diagram for this project.

### Genre
Represents a Genre associated with a Song. Intended to fill the category requirements for this project.

Columns:
- GenreID:Integer
- Name:String

Associations:
- A Genre has many Songs.

### Song
Represents an individual Song. This is the primary product served by the Site.

Columns:
- SongID:Integer
- GenreID:Integer
- Title:String
- Artist:String
- Image:String
- Price:Integer
- PreviewLink:String
- CreatedAt:Date
- OnSale:Boolean

Associations:
- A Song has one Genre.

### Order
Represents an Order that a customer places for one or more Songs.

Columns:
- OrderID:Integer
- UserID:Integer
- PSTRate:Integer
- GSTRate:Integer
- HSTRate:Integer
- Status:String

Associations:
- An Order is associated with one User.
- An Order has one or many LineItems.

### LineItem
Represents a single item within an Order.

Columns:
- LineItemID:Integer
- OrderID:Integer
- SongID:Integer
- Price:Integer

Associations:
- A LineItem belongs to one Order.

### User
Represents an end user for this service.

Columns:
- UserID:Integer
- ProvinceID:Integer
- Username:String
- Password:String
- FirstName:String
- LastName:String
- Address:String
- City:String
- IsAdmin:Boolean

Associations:
- A User has many Orders.
- A User belongs to one Province.

### Province
Represents a province, with tax information.

Columns:
- ProvinceID:Integer
- PSTRate:Integer
- GSTRate:Integer
- HSTRate:Integer

Associations:
- A Province has many Users.

## Strengths and Weaknesses

Strengths:
- Backend/architectural design, including database and controllers
- Emphasis on clean, readable code.
- Proficient in writing CSS to achieve styling goals
- Proficient in writing ECS and jQuery.
- Experience with the MVC architecture.
- Experience with security best practices.
- Experience with networking and server operations for successfully hosting the site.

Weaknesses:
- Not a fan of Javascript front-end libraries/literally anything other than ECS, such as Angular.
- Not a fan of most CSS libraries (e.g. Bootstrap), either.
- No experience with Rails prior to this course.
- No experience with using SLIM to template pages.
- No experience with implementing a payment solution (Paypal/Stripe)
- Little experience with responsive design
- No experience with gems like paperclip
- Little experience with designing e-commerce apps in general
