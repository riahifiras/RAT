# Remote Access Tool (RAT)
<img src="https://github.com/riahifiras/RAT/assets/120566908/6602c4a6-183e-4d90-94fb-740e6a262994" alt="rat-logo" width="400"/>


This project demonstrates a Remote Access Tool (RAT) developed for cybersecurity purposes. RATs are commonly used by attackers to gain unauthorized access to target systems and execute commands remotely.

## Features

- **Proof of Concept:** Showcase the feasibility of creating a RAT using PowerShell scripting.
- **Understanding Functionality:** Deepen understanding of RAT operations, including stealthy installation and remote control.
- **Demonstrating Data Exfiltration:** Show potential for data theft by RATs.
- **Showcasing Control Capabilities:** Demonstrate extensive control over compromised systems.
- **Education and Ethics:** Raise awareness about RAT dangers and ethical considerations.

## Usage

1. Clone the repository: `git clone https://github.com/khaledmraad/Ratatouille.git`
2. Execute the RAT script: `./initial.cmd`

## Architecture

The architecture of the RAT consists of several components:

- **PowerShell:** Primary scripting language for executing system-level commands and orchestrating malicious activities.
- **USB Rubber Ducky:** Physical attack vector for executing the initial command script on the target system.
- **SSH:** Secure communication protocol for establishing encrypted remote connections.
- **SMTP:** Simple Mail Transfer Protocol for transmitting system information to the attacker's email address.
- **Kali Linux Machine:** Attacker's machine used for establishing remote connections to the compromised system.
- **Windows 10 Machine:** Target system for deploying the RAT.

## Requirements
- **Network Connectivity:** Both attacker and target machines need to be on the same network for successful deployment and operation of the RAT.

**Note:** This project is intended for educational and ethical purposes only. It should only be used with the explicit permission of the target machine owner and for lawful and ethical reasons. Unauthorized access to computer systems is illegal and unethical.

