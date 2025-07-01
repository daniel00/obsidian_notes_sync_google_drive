---
title: "Micromouse | IEEE at UCLA Project Docs"
source: "https://projects.ieeebruins.com/micromouse/"
author:
published:
created: 2025-07-01
description: "Hello and welcome to Micromouse 2.0! The purpose of Micromouse 2.0 is to provide other schools a resource bank to start their own Micromouse programs, and we aim to provide sample lectures, assignments, and our assistance if you need help on any part of the process. Wishing you luck on successfully establishing the Micromouse Project at your local student branch of IEEE or other engineering clubs at your schools."
tags:
  - "clippings"
---
## Micromouse

## Overview

Hello and welcome to Micromouse 2.0! The purpose of Micromouse 2.0 is to provide other schools a resource bank to start their own Micromouse programs, and we aim to provide sample lectures, assignments, and our assistance if you need help on any part of the process. Wishing you luck on successfully establishing the Micromouse Project at your local student branch of IEEE or other engineering clubs at your schools.## [📄️ Power Module](https://projects.ieeebruins.com/micromouse/power-module)

[

Overview

](https://projects.ieeebruins.com/micromouse/power-module)## [📄️ Motors and Encoders Module](https://projects.ieeebruins.com/micromouse/motors-and-encoders-module)

[

Overview

](https://projects.ieeebruins.com/micromouse/motors-and-encoders-module)## [📄️ IR Sensors Module](https://projects.ieeebruins.com/micromouse/ir-sensors-module)

[

Overview

](https://projects.ieeebruins.com/micromouse/ir-sensors-module)## [📄️ Microcontroller Module](https://projects.ieeebruins.com/micromouse/microcontroller-module)

[

Overview

](https://projects.ieeebruins.com/micromouse/microcontroller-module)## [📄️ STM32CubeIDE Module](https://projects.ieeebruins.com/micromouse/stm32cubeide-module)

[

Overview

](https://projects.ieeebruins.com/micromouse/stm32cubeide-module)## [📄️ Motor Setup and PID Module](https://projects.ieeebruins.com/micromouse/motor-setup-and-pid-module)

[

Overview

](https://projects.ieeebruins.com/micromouse/motor-setup-and-pid-module)## [📄️ IR Code Module](https://projects.ieeebruins.com/micromouse/ir-code-module)

[

Overview

](https://projects.ieeebruins.com/micromouse/ir-code-module)## [📄️ Floodfill Module](https://projects.ieeebruins.com/micromouse/floodfill-module)

[

Overview

](https://projects.ieeebruins.com/micromouse/floodfill-module)## [📄️ Q&A](https://projects.ieeebruins.com/micromouse/q-and-a)

[

Technical Questions

](https://projects.ieeebruins.com/micromouse/q-and-a)## [📄️ AAMC](https://projects.ieeebruins.com/micromouse/aamc)

[

What is AAMC

](https://projects.ieeebruins.com/micromouse/aamc)

## Who are we?

- Kevin Liu, UCLA, 2nd year Electrical Engineering major, Email: [kevliu2028@g.ucla.edu](https://projects.ieeebruins.com/micromouse/), Discord: kevinliu7949
- Kevin Xiao, UCLA, 2nd year Electrical Engineering major, Email: [kevinxiao@g.ucla.edu](https://projects.ieeebruins.com/micromouse/), Discord: nzextbone

We are the current leads of the Micromouse project at the student branch of IEEE at UCLA for the 2023-2024 school year. Feel free to contact us via email or Discord direct messages if you have any questions throughout the year.

## Micromouse Project Overview

Micromouse is a project in which students build a robot that can navigate itself through a 16x16 maze. The purpose is to provide students experience with designing schematics, working with microcontrollers, writing firmware, and being creative in how they approach problems and find solutions.

In a typical year, we’ve had around 25 teams of 2 to 3 students each. We have a deposit (returned to students as they complete competitions) of $40 per student.

We approach the project in two segments: the first half being making a Micromouse from a kit that the leads put together, the second half being each team making their own Micromouse from scratch.

Our syllabus for this school year [can be found here](https://docs.google.com/document/d/1W-dByAS4dsBlGHjXRbwJXAfKNBMwxYKZQs3AIJ9-hWw/edit?usp=sharing).

If you want to follow along and make your own mouse, the code solutions to the modules along with an implementation of floodfill for the simulator (see below for more info) [can be found here](https://drive.google.com/drive/folders/1m-HX5DWeVx7KHVTJ44n3G9iRv4eheELR?usp=sharing).

## The Rat

The rat acts as an introduction and guide for students to the key concepts of Micromouse.

We give each team a kit with parts for the first part of the project, containing:

- Rat PCB (designed by leads)
- STM32 Nucleo F411RE Development Board
- LiPo Batteries & Charger
- 2 Motors
- All the other parts (passives, encoders, IR emitters, etc.)

During this portion of the project, we provide students lectures and guiding assignments to teach them what makes up a Micromouse, and help them complete the rat.

An additional portion to this part of the project that we proposed this year was to give more focus on schematic and PCB design earlier on in the project, and thus we created assignments meant for students to complete on their own. We made this decision, as there were not a lot of PCB design courses at UCLA, and feel that PCB design is a key takeaway from Micromouse we wanted our students to learn.

![alt_text](https://projects.ieeebruins.com/assets/images/image1-f6c448254fa350860dd350c59349f175.png "image_tooltip")

![alt_text](https://projects.ieeebruins.com/assets/images/image2-7aa510070bae3047525c704a167b37cf.png "image_tooltip")

(Full Rat PCB and associated files available in the google drive folder)

### The Mouse

In this portion of the project, students put what they have learned from the Rat into practice. Students will create a schematic, a BOM (Bill of Materials), and a PCB of their own design, and we provide advice and guidance during the design process, with check-ins (our year, we choose to have 2 main check-ins, one for the schematic, the other for the PCB, and quick check-ins when finalizing the design).

We also lecture students on more efficient maze solving algorithms, specifically Floodfill, during this portion of the project.

This part of the project is more hands-off than the Rat, but may be more demanding in time as each group may have different problems or questions about their project as students design them.

## Schedule

We know that not every school follows the quarter system, but we’ve thought to include our drafted schedule as a frame of reference. The pacing of the program can be adjusted across end of term dates depending on how long the terms are and the structure of the academic year.

### Fall Quarter (Early October to Early December)

Week 3:

- Lecture: Project Overview, MCUs and Batteries
- Assignments assigned: Basic Nucleo Code, Power Delivery Schematic
- Syllabi and Safety Training are due

Week 4:

- Lecture: Motors and Encoders
- Assignments assigned: Motor Control, H-Bridge Schematic
- Basic Nucleo Code and Power Delivery Schematic are due

Week 5:

- Motor Control and H-Bridge Schematic are due

Week 6:

- Lecture: PID control
- Assignments assigned: PID Control, Power + H-Bridge PCB

Week 7:

- PID Control and Power + H-Bridge PCB are due

Week 8:

- Lecture: PID
- Assignments assigned: Navigating a Maze with IR, IR Schematic

Week 9:

- Navigating a Maze with IR is due

Week 10:

- Rat Competition
- Assignments assigned: Rough Draft of Mouse Schematics and BOM

Finals Week:

- IR Schematic is due

### Winter Quarter (Early January to Mid March)

Week 2:

- Schematic Design Reviews
- Assignments assigned: Final Draft of Schematics
- Rough Draft of Mouse Schematics and BOM are due

Week 3:

- Lecture: PCB Design
- Schematic Design Reviews continue
- Assignments assigned: PCB Rough Draft
- Final Draft of Schematic is due

Week 5:

- PCB Design Reviews
- Rough Draft of PCB is due

Week 6:

- PCB Design Reviews continue
- Final Draft PCB is due
- Placing PCB Orders

Week 7:

- Lecture: Floodfill
- Assignments assigned: Writing Floodfill Code

Finals Week:

- Floodfill Code due

### Spring Quarter (Late March to Late May)

Week 4:

- Check-in: Soldering is mostly complete

Week 6:

- Progress check-in

Week 8:

- Progress check-in

Week 9:

- Worksessions leading up to AAMC
- AAMC

## Events

## Showcases and Competition

At the end of Fall, we let the students compete against each other in a more casual competition with the Fall Rats. The maze we used in this competition was simple, and only requires a very simple maze solving algorithm (i.e. dead reckoning) for completion.

There have also been additional showcases in the past, such as a dress-up costume contest of the Rats.

## AAMC (All American Micromouse Competition)

AAMC is our yearly intercollegiate competition in May, where Micromouse teams across different schools compete in our large 16 by 16 maze! As in past years, AAMC will be hosted at UCLA, and we will reach out with more details later on in the school year, and we hope to see you there!

Even if you’re not competing, or do not have a Micromouse Program set up yet, we still recommend you to stop by. We think it’s a great opportunity to network with other Micromouse leads and it’s lots of fun to watch other students compete.

## Logistics

## Managing Teams

Keeping track of each team’s progress is important, as having too many loose ends by the time an important deadline approaches can be very stressful. Whether this is done through a spreadsheet or a document, keeping notes on progress will be beneficial as you follow up with teams that have fallen behind.

## Communications

Communications wise, we recommend having a centralized way of communicating with all the students of the project for project wide announcements, such as through Discord servers, mailing lists, or Google Classroom.

We also recommend letting each group have their own team group-chats, whether it’s one with the leads and the other members of the team, or an additional one with just team members, it’s good to make sure and check in from time to time to see if a team is still communicating with each other.

## Worksessions

Worksessions are good opportunities for students to come in and work with each other across teams on their project. We recommend scheduling more of them as you approach important deadlines.

## Floodfill Simulator

Floodfill Simulator is a software that provides a virtual and consistent way to test mazes and maze-solving algorithms.

This will come in plenty of help when you’re designing mazes for your own competitions, or helping debug maze-solving algorithms.

We will include a guide ([MacOS](https://docs.google.com/presentation/d/18rHwcIJNPsIRkun7N9Wq5YYAiFSc-rkyNcAQBOEolg4/edit?usp=sharing), [Windows](https://docs.google.com/presentation/d/1tr_2cUcouLl3fvlSyOth7XXo3jRbpBw1TfRX8yWRETY/edit?usp=sharing)) on how to set up the software and a link to its .