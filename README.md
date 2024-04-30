# Application template

# Table of Contents  

[About](#about)  

[Setup](#setup)  

[Project WIKI](https://gitlab.builder.ai/devops/template-app/-/wikis/home)  


## About  

This is the ruby repe which is using pstore to store users survey, after users submit the survey 
feedback he will get total percentage and also he will get total overall ercentage

## Setup

Clone (make a copy) of this repository.

Choose a name specific to your project, it must start with a letter and only contain letters, numbers or hyphens ( - ) and underscores ( _ )

Install Docker in your system
Run this command to add all dependency in your System

docker build -t coding_assessment .

docker run -it --rm coding_assessment

## Run Manually
1. bundle exec ruby questionnaire.rb

## Rub Test Cases
1. bundle exec rspec survey_spec.rb
