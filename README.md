## Tech Stack
- Language: Ruby 3.1.2
- Framework: Rails 7.0.4.3
- DB: SQLite
- Authentication: Api Guard

## Prerequisites

- Ruby 3.1.2
- Rails 7.0.4.3

## Getting Started

- Fork Repo
- Install bundle by running ```bundle install``` (You may need to nstall ```rmagick``` locally if not installed)
- ```rails db:migrate```
- ```rails db:seed```
- ```rails s```

* You can access visitors website by accessing ```http://localhost:3000/``` and access the admin part by accessing ```http://localhost:3000/admin``` 

## ⚡ For Testing Telegram Bot
- Put your Telegram bot HTTP API Token in ```app_config.yml``` as 'TELEGRAM_BOT_TOKEN' value
- ```ngrok http 3000```
- Copy the website link (for example: "https://d5a8-41-239-120-73.ngrok-free.app/") to ```config.hosts << "d5a8-41-239-120-73.ngrok-free.app"``` line in ```development.rb``` file
- In a new Rails Console run the following: 
  ```require "telegram/bot"```
  ```token = AppConfig.telegram["TELEGRAM_BOT_TOKEN"]```
  ```Telegram::Bot::Client.new(token).set_webhook(url: "PUT_YOUR_NGROK_WEBSITE_LINK_HERE/webhooks/telegram/#{token}")``` and Voila! You can interact with your telegram bot now :D

## Seeded Data
### Bicycles
```
    {
        "id": 1,
        "name": "Bicycle #1",
        "description": "Bicycle #1 Description",
        "price": "100",
        "style": "Bicycle #1 Style"
        photo: "img-1.png"
    },
    {
        "id": 2,
        "name": "Bicycle #2",
        "description": "Bicycle #2 Description",
        "price": "200",
        "style": "Bicycle #2 Style"
        photo: "img-2.png"
    },
    {
        "id": 3,
        "name": "Bicycle #3",
        "description": "Bicycle #3 Description",
        "price": "300",
        "style": "Bicycle #3 Style"
        photo: "img-3.png"
    },
        {
        "id": 4,
        "name": "Bicycle #4",
        "description": "Bicycle #4 Description",
        "price": "400",
        "style": "Bicycle #4 Style"
        photo: "img-4.png"
    },
        {
        "id": 5,
        "name": "Bicycle #5",
        "description": "Bicycle #5 Description",
        "price": "500",
        "style": "Bicycle #5 Style"
        photo: "img-5.png"
    },
```

### Bicycles
```
  {
      "id": 1,
      "email": "admin@example.com",
      "password": "password"
},
```
