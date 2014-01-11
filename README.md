                  hazeblogger - static blog generator

                            general information


    Copyright (C) 2009-2011 Jaromir Hradilek
    Copyright (C) 2014 Rudolf Leermakers

    Permission is granted to copy, distribute and/or modify this document
    under the terms of the GNU Free Documentation License, Version 1.3 or
    any later version published by the Free Software Foundation; with no
    Invariant Sections, no Front-Cover Texts, and no Back-Cover Texts.

    A copy of the license is included as a file called FDL in the main
    directory of the hazeblogger source package.


# ABSTRACT

This document provides a general information about hazeblogger 1.0.0. For
installation instructions, refer to a file called INSTALL.


# TABLE OF CONTENTS

  1. Overview
  1.1. Notable Features
  1.2. Example Usage
  2. Development
  3. Bugs
  4. Copyright


# OVERVIEW

hazeblogger is a simple to use but capable CMS for the command line. Being
written in Perl as a cross-platform application, and producing static
content without the need of database servers or server-side scripting, it
is literally a CMS without boundaries suitable for a wide variety of web
presentations, from a personal weblog to a project page, or even a company
website.

## Notable Features

  * Generates valid HTML 4.01 Strict or XHTML 1.1 pages, and RSS 2.0 feed.
  * Generates yearly and monthly archives, and supports tags.
  * Allows you to create both blog posts and pages.
  * Enables a quick change of theme, style sheet, or localization.
  * Comes with tools for easy management of your blog.

## Example Usage

    haze-init   # Creates a new repository in .haze/
    haze-add    # Allows you to write a new post in your favorite editor
    haze-make   # Generates a blog from the repository


# DEVELOPMENT

As a version control system for its source code, hazeblogger uses Git with
a public repository located at github.com. To get the latest development
version, use the following command:

    git clone https://github.com/hatsuseno/hazeblogger.git hazeblogger

If you are planning to make some interesting changes, please, consider
cloning the project on Github, and submitting your patch via pull request.


# BUGS

To report a bug or to send a patch, please, add a new issue to the bug
tracker at [GitHub](https://github.com/hatsuseno/hazeblogger/issues).

