# Electricity-Management
This project is a simple Energy Monitoring System, which aims to monitor electricity usage, temperature, and humidity, and transmit the data to a cloud database for visualization and analysis.

## Branches

- [Elec_Monitoring_App](https://github.com/blury2903/Electricity-Management/tree/elec_monitoring_branch): An application for monitoring electrical systems.
- [ESP8266_LORA_GATEWAY](https://github.com/blury2903/Electricity-Management/tree/esp_gateway_branch): A gateway using ESP8266 for sending and receiving data via LoRa protocol.
- [STM32_LORA_NODE](https://github.com/blury2903/Electricity-Management/tree/stm32_node_branch): A node using STM32 for sending and receiving data via LoRa protocol.


## Overview
The Smart Energy Monitoring System utilizes multiple components to gather, process, and transmit data:

- **PZEM-004T Module**: Reads electrical data such as voltage, current, power, and energy consumption.
- **DHT11 Sensor**: Gathers temperature and humidity data from the environment.
- **STM32F103C8T6 Microcontroller**: Collects data from PZEM-004T and DHT11, packages it, and sends it to the LoRa SX1278 module.
- **LoRa SX1278 Module**: Wirelessly transmits packaged data to the LoRa module on the Gateway.
- **Gateway**: Receives data from the LoRa module, forwards it to an ESP8266 for processing, and then sends it to Firebase via Wi-Fi using HTTP.
- **Firebase**: Cloud database where data is stored and retrieved for further processing.
- **Flutter App**: Retrieves data from Firestore in Firebase for display on a mobile application.

## Result

<div style="display: flex; flex-wrap: wrap;">
    <div style="flex: 50%; padding: 5px;">
        <p align="center"><strong>Finished Product</strong></p>
        <p align="center"><img src="/imgs/board.jpg" alt="Board" width="500"></p>
    </div>
    <div style="flex: 50%; padding: 5px;">
        <p align="center"><strong>Login Screen</strong></p>
        <p align="center"><img src="/imgs/login_sceen.jpg" alt="Login screen" width="300"></p>
    </div>
    <div style="flex: 33.33%; padding: 5px;">
        <p align="center"><strong>Main Screen</strong></p>
        <p align="center"><img src="/imgs/main_screen.jpg" alt="Main screen" width="300"></p>
    </div>
    <div style="flex: 33.33%; padding: 5px;">
        <p align="center"><strong>Main Screen with Alarm</strong></p>
        <p align="center"><img src="/imgs/alarm_screen.jpg" alt="Main screen with alarm" width="300"></p>
    </div>
    <div style="flex: 33.33%; padding: 5px;">
        <p align="center"><strong>Comparison Screen</strong></p>
        <p align="center"><img src="/imgs/comparison_screen.jpg" alt="Comparison screen" width="300"></p>
    </div>
    <div style="flex: 33.33%; padding: 5px;">
        <p align="center"><strong>Detail Screen</strong></p>
        <p align="center"><img src="/imgs/detail_screen.jpg" alt="Detail screen" width="300"></p>
    </div>
</div>
