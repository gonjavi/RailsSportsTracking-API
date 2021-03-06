## Rails Sports Tracking API

This is a sports tracking  API built with Ruby on Rails and deployed on Heroku. The sports that can be tracked are Jogging, Cycling, Swimming, Weight lifting, Treadmill, Walking. The measurements that can be taken are date and time on the selected sport. This API uses Rack cors middleware to support Cross-Origin Resource Sharing (CORS) for Rack compatible web applications.

This project has 2 models(sports and measurements) with associations a sport can have many measurements, and a measurement belongs to a sport. It accepts Http requests to create, delete, and display measurements, display the sports and display the progress during the time. It serialized to JSON using the gem Fast_jsonapi, and send it back as a response.

## To test the deployed API

Use a program like Insomnia or Postman.

 - You can use GET to the following URL to see the six sports:

https://trackingapi-gon.herokuapp.com/api/v1/sports.json

Click on send

![screenshot](./img/sportsget.png)  

Expected Result

![screenshot](./img/sportsget2.png)  




- You can use GET to the following URL to get all measurements:

https://trackingapi-gon.herokuapp.com/api/v1/measurements


Click on send

![screenshot](./img/measurementsget.png)  

Expected Result

![screenshot](./img/measurementsget2.png)  




- You can use POST to the following URL to create a new measurement:

https://trackingapi-gon.herokuapp.com/api/v1/measurements

including a JSON similar to the next one:
{
	"time": "01:02",
	"date": "2020-07-15T08:49:51.141Z",
	"sport_id": 2
}

![screenshot](./img/measurementspost2.png)  

Click on send

![screenshot](./img/measurementspost.png)  

Expected Result

![screenshot](./img/measurementspost3.png)  




- You can use DELETE to the following URL to destroy a measurement, adding the id number of the measurement at the end:

https://trackingapi-gon.herokuapp.com/api/v1/measurements/id

Click on send

![screenshot](./img/measurementsdelete.png)  

Expected Result

![screenshot](./img/measurementsdelete2.png)  



### Prerequisites
- npm 6.14.5
- node 14.3.0

### Setup

- Run $npm install   -to install all dependencies from a package.json file
- Run on the command line: $npm start
- You will see the project on broswer
- [http://localhost:3000](http://localhost:3000) to view it in the browser.

The page will reload if you make edits.<br />
You will also see any lint errors in the console.


## Built With

- Ruby 2.6.3
- Rails 6.0.3.2
- FastJsonApi 1.1
- Visual Code

## Installation

```bash
$ bundle install
```
* Create PostgreQSL database:
```bash
$ rails db:create
```
* Migrate the database:
```bash
$ rails db:migrate
```
* Simply run the app with :
```bash
$ rails s
```
## RSpec Tests

For RSpec testing run the following commands:

- $rspec --format documentation

## API Link

[API Link](https://trackingapi-gon.herokuapp.com/)

### Prerequisites

- npm 6.14.5
- node 14.5.0


## Author:
👤 **Gonza Javier Mancilla**

- Github: [@gonjavi](https://github.com/gonjavi)
- Linkedin: [@g-javier-mancilla](https://www.linkedin.com/in/g-mancillla)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!


## Show your support

Give a ⭐️ if you like this project!


## 📝 License

This project is [MIT](lic.url) licensed.
