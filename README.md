Motion Control Raiden Game

This project was for the course ECE532 at the University of Toronto, April 2017. This repository contains the source code and detailed documentation of the Motion Control Raiden Game. Players can control the aircrafts to eliminate enemies using body motions. At most two players are allowed.


How to use:
To run the game, you will need:

- A Digilent Nexys-4-DDR board
- An ov7670 camera connected to FPGA
- A 640x480 VGA Monitor connected to FPGA
- two colored objects(blue and red for player1 and player2)

To run the game, compile the "ECE532_integration" Vivado project and download it to the FPGA board. Then Launch the SDK and compile the helloworld.c program to enter the game page.
Note: To start the game, you need to turn on SW0. This will lead to the welcome page. Then you need to turn off SW0 to enter the game. SW0 also can reset everything during the game.

Repository Structure
- Docs: Contain the proposal and final report for this group
- Src:
  - ECE532_integration:
    - ECE532_integration:This folder contains the main project, both digital system and the SDK software. Contains all files needed to run the Raiden game.
    - ip_repo: Contains the IP modules used in this project.
       - audio_out_1.0: Contains the custom audio IP
       - Graphics_IP_1.0: Contains the custom graphics IP
       - pmod_input2_1.0: Contains the video decoder IP, provided in ECE532 Piazza
       - position_locator_1.0: Contains the motion detector IP



Authors:
Yi Tian Lu, Sheng Zhan, Zhe Wu

Acknowledgements:
We would like to thank Professor Paul Chow and all the TAs in ECE532 to provide the helps and guidance in this project.
