# ldsyouth-notify

[![Join the chat at https://gitter.im/ARMmaster17/ldsyouth-notify](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/ARMmaster17/ldsyouth-notify?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![GitHub license](https://img.shields.io/github/license/ARMmaster17/ldsyouth-notify.svg)](https://github.com/ARMmaster17/ldsyouth-notify)
[![Build Status](https://travis-ci.org/ARMmaster17/ldsyouth-notify.svg)](https://travis-ci.org/ARMmaster17/ldsyouth-notify)
[![Code Climate](https://codeclimate.com/github/ARMmaster17/ldsyouth-notify/badges/gpa.svg)](https://codeclimate.com/github/ARMmaster17/ldsyouth-notify)
[![Test Coverage](https://codeclimate.com/github/ARMmaster17/ldsyouth-notify/badges/coverage.svg)](https://codeclimate.com/github/ARMmaster17/ldsyouth-notify/coverage)
[![Dependency Status](https://www.versioneye.com/user/projects/5591374a3965610019000020/badge.svg?style=flat)](https://www.versioneye.com/user/projects/5591374a3965610019000020)
[![GitHub release](https://img.shields.io/github/release/ARMmaster17/ldsyouth-notify.svg)](https://github.com/ARMmaster17/ldsyouth-notify)
[![GitHub forks](https://img.shields.io/github/forks/ARMmaster17/ldsyouth-notify.svg)](https://github.com/ARMmaster17/ldsyouth-notify)
[![GitHub stars](https://img.shields.io/github/stars/ARMmaster17/ldsyouth-notify.svg)](https://github.com/ARMmaster17/ldsyouth-notify)
[![GitHub issues](https://img.shields.io/github/issues/ARMmaster17/ldsyouth-notify.svg)](https://github.com/ARMmaster17/ldsyouth-notify)
[![Issue Stats](http://issuestats.com/github/ARMmaster17/ldsyouth-notify/badge/pr?style=flat)](http://issuestats.com/github/ARMmaster17/ldsyouth-notify)
[![Issue Stats](http://issuestats.com/github/ARMmaster17/ldsyouth-notify/badge/issue?style=flat)](http://issuestats.com/github/ARMmaster17/ldsyouth-notify)

Ldsyouth-notify is a omponentized, deployable tool for managing LDS youth group activities. It simplifies the task of sending emails out to keep parents and youth notified of upcoming mutual events and sunday assignments. It is designed to be easily deployable with no experience or hardware needed. Ldsyouth-notify also feeds directly from the lds.org directory. No need for keeping track of up-to-date emails!

# Getting started
To get started, you will need the following:
- [ ] A [Heroku account](heroku.com)
- [ ] A Google Drive or Dropbox account (For advanced users: Git)
- [ ] An LDS.org account with a valid calling (see below)
- [ ] A computer with an internet connection and 1 GB of free space (for temporary files, will be cleared when done)

### Valid callings
In order to successfully set up Ldsyouth-notify, you **MUST** have one of the following callings tied to your account. If you do not, you will have to delete everything and start over.
- Any bishopric calling
- Branch president
- YM/YW presidency
- Quorum/class president (Only the president can run the setup, but any youth in a presidency can use ldsyouth-notify)
- Ward Clerk
- Ward Technology Specialist
- Any calling in Boy Scouts (**NOT** Cub Scouts)

## Step 1: Deploying to Heroku
Heroku is an online PaaS (Platform as a Service) used to host web apps. Ldsyouth-notify is pre-packaged to easily deploy to Heroku with minimal configuration. Although Heroku offers paid plans with scaling, you will only need the free 1X plan (selected by default when you create an account).

If you have used Heroku before, then go ahead and follow these instructions. If not, continue to the next paragraph.
- [ ] `git clone` the repo to your hard drive
- [ ] Create a dyno for your app using <heroku.com> or the Toolbelt
- [ ] Using the Heroku Toolbelt, `git push` the app to Heroku
- [ ] Ensure that `RACK_ENV` is set to `production`

Go ahead and log into <heroku.com>. Once you are in, navigate to the GitHub project page <http://github.com/ARMmaster17/ldsyouth-notify> and click on the purple *Deploy to Heroku* button. Heroku will then ask you to pick a name for your "dyno". A dyno is a server that runs a web app on Heroku. Pick wisely as this name cannot be changed later. The URL to your dyno will become *YourDynoName*.herokuapp.com. Leave all the scaling options at 1. Once the code is copied, you should see the dashboard for your app. You may now proceed to step two.

## Step 2: Configuring ward data
Now navigate to *YourDynoName*.herokuapp.com (unless you modified the DNS settings, then use your own URL). You should be presented with a setup page. If not, go back and retry. You may need to recreate your Heroku Dyno.

For the first field, it will ask for your ward. Type it in **EXACTLY** as it appears on <lds.org>. For example, if you live in the Internet Valley ward, you would type "Internet Valley Ward" without the quotes. Note that capitalization is important. If you are not sure what to put, check your account on <lds.org>.

The next set of fields will ask what classes/quorums you would like to activate ldsyouth-notify for. Note that this can be changed later.

Upon finishing, click submit. You should then be redirected to a page asking you to log in using your <lds.org> account. Make sure that your ward clerk has added a valid calling to your <lds.org> profile first. Once you log in, it may ask if ldsyouth-notify can use some information from your account. Click accept. Ldsyouth-notify does not store any data, nor does it forward any information to us (see our information usage agreement included with ldsyouth-notify). All data that is stored, is kept inside your Secured Heroku Dyno.

Congratulations, you have now set up ldsyouth-notify! If you hit any errors, see the troubleshooting area of our wiki. If you still run into trouble, file a bug on our GitHub page: <http://github.com/ARMmaster17/ldsyouth-notify/issues/new>.

# Contributing
Although ldsyouth-notify is free, we do ask that you give back by contributing to the project. See our list of current issues to see what needs to be done: <http://github.com/ARMmaster17/ldsyouth-notify/issues>. Make sure your contributions conform to our standards listed in **~/CONTRIBUTING.md**.
