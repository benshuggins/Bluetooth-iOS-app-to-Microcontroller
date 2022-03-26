# Bluetooth-iOS-app-to-Microcontroller
Bluetooth Low Energy Demo iOS app that controls a servo motor from a slider on the iphone througn Bluetooth Low Energy. The microcontoller is called the Argon particle board and it supports modern bluetooth low energy. This is a great board for prototyping mobile Bluetooth apps for the iphone that need to control real world peripherals, it is stable and reliable. The app has the ability to transfer data both ways, so for instance also transfer battery level powering micro back to iphone and display it on screen. I will include the c++ code that runs on the argon particle board in an entire project. 

In the project, the slider on the iphone controls a range of numbers from 0-255. I send this number through bluetooth to the particle board and then actuate a simple rc servo utilizing a simple pwm based Arduino library.

![2022-03-22 22 46 24](https://user-images.githubusercontent.com/6366030/159632171-228d64df-fb9b-48c5-b8e9-8362ba5f4604.gif)
