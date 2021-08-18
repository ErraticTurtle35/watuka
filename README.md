# Wakuta

Wakuta is a small testing tool made in Ruby v2.4.9 for the Upwork Take Home Task.

## Installation

We have the following dependencies:

- selenium-webdriver gem

```bash
gem install selenium-webdriver
```

- chromedriver (For the moment we are only supporting the latest version of the browser)
- geckodriver (For the moment we are only supporting the latest version of the browser)

## Usage

For launch Wakuta just execute the main.rb file in the root of the project

```ruby
ruby main.rb
```

We have some configurations that can be modified inside the 'wakuta_configuration.json' in the 'utils' folder

```json
{
  "driver": {
    "browser": "firefox",
    "timeout": 60
  }
}
```

- The browser to use: firefox or chrome
- The timeout for the selenium implicit_wait: a integer that represents seconds

For the moment we only have one test scenario, the search of a talent by a specific keyword. To modify the search
keyword you have to update the file 'search_of_talent_data.json' inside the test folder 'tests/search_of_talents/data'

```json
{
  "searchKeyword": "Gabriel M",
  "url": "https://www.upwork.com/"
}
```

- The url for start the testing process
- The searchKeyword for the test

## Known issues
- The captcha steps is managed manually