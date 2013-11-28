This repo contains my response to a challenge set by a London tech company.

##Task

build a simple web or command line application, which should allow users to enter an arbitrary GitHub username, and be presented with a best guess of the GitHub user's favourite programming language.

##My Response

Given the choice of a command line or web application, I opted for the web, using Sinatra as a lightweight framework. I used Ruby's net::http class over github's Octokit api wrapper as I didn't require authentication, testing using webmocks and rspec fixtures to control the testing environment. 

The application covers some edge cases, including if the username submitted by the user doesn't exist or if github returns 'nil' as a favourite language. However given more time I would also include:

- a response for a scenario where there are multiple possibilities for a users favourite language
- a breakdown of the amount the submitted user uses each language, which could be graphically represented (see spec/support/fixtures/user_language_breakdown.json to see an example of the information I could have used. The only downside is that plugins are included, which can lead to misleading results).