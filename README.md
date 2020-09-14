# TrackingApp
The Back-end API for the Tracking App. Holds database info for All Users and allows RESTful HTTP requests to obtain and manipulate the User data.
The data held in this back-end API is related to User authentication, an expense table .

## Models
### - User
- Uses **has_secure_password**
- **Has_many** association with Expense Table
- Has three (3) unique fields: **:username, :email, :password_digest**

### - Expense
- **Has_many** association with Notes Table
- Has seven (4) unique fields: **:user_id, :name, :date_added, :amount**

## Controllers
### Registration Controller
Handles new user account creations  
Parameters accepted: { user: { :username, :email, :password, :password_confirmation} }

### Sessions Controller
Handles User Login and Logout requests  
Parameters accepted: { user: { :username or :email, :password} }

### Expense Controller
Handles expense creation, deletion and editing  
Parameters accepted: { expense: { :name, :date_added, :amount } }


## Routes
<pre>
Prefix Verb   URI Pattern                                                                       Controller#Action
sessions POST   /sessions(.:format)                                                             sessions#create
registrations POST   /registrations(.:format)                                                   registrations#create
logout DELETE /logout(.:format)                                                                 sessions#logout
logged_in GET    /logged_in(.:format)                                                           sessions#logged_in
expenses GET    /expenses(.:format)                                                                   expenses#index
POST   /expenses(.:format)                                                                         expenses#create
expense GET    /expenses/:id(.:format)                                                                expenses#show
PATCH  /expenses/:id(.:format)                                                                     expenses#update
PUT    /expenses/:id(.:format)                                                                     expenses#update
DELETE /expenses/:id(.:format)                                                                     expenses#destroy
root GET    /                                                                                   static#index
</pre>

## Built With

- Ruby - '2.6.3'
- Ruby on Rails '~> 6.0.3', '>= 6.0.3.2'
- PostgreSQL '>= 0.18', '< 2.0'
- Rack-CORS
- Bcrypt '~> 3.1.7'
- RSpec-rails '~> 4.0.0'

### Automated Testing with [RSPEC](https://github.com/rspec/rspec-rails)

* Run `bundle exe rspec` within the terminal console after installing project repository.

## Setting up your own Back-End

### Installation

* Download repository to your local machine, then run `bundle install` and run `rails db:setup`, `rails db:migrate` all within the terminal console.

### Navigate to config/initializers directory

1. Enter the cors.rb file and...
2. On line 10 you will replace ```origins 'https://trackingapp-api.herokuapp.com'``` with your own custom app's url. *(As you can see I used heroku to host my app)*
3. Close the cors.rb file and...
4. Open the session_store.rb file within the same config/initializers directory and...
5. Similar to what you did in the cors.rb file, on line 5 you will replace ```domain: 'trackingapp-api.herokuapp.com'``` with your own custom app's domain.

## Author

👤 **Damilola Ale**

- Github: [@damiecode](https://github.com/damiecode)
- Twitter: [@iamlildamski](https://twitter.com/iamlildamski)
- Linkedin: [Damilola Ae](https://linkedin.com/in/damiecode/)
- Email: _codenlyn@gmail.com_

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!
