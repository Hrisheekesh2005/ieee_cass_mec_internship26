Smart Machine Health Monitoring ASIC

This project was developed as part of the IEEE Circuits and Systems Society (IEEE CASS) Digital IC Design Internship using the ASIC design flow.

The Smart Machine Health Monitoring ASIC monitors the health of an industrial machine by analyzing 8-bit temperature and 8-bit vibration inputs. Based on predefined threshold values and the duration for which these parameters exceed safe operating limits, the system classifies the machine's condition into one of three states:

-Normal – Machine is operating within safe limits.
-Repair Required – Parameters have exceeded warning thresholds for a specified duration.
-Replacement Required – Critical thresholds have been exceeded for an extended period, indicating severe machine degradation.

The design incorporates time-based decision logic, ensuring that temporary fluctuations do not trigger false alarms. Instead, the ASIC continuously monitors the sensor inputs and changes the machine status only when abnormal conditions persist beyond defined time limits.

Features
8-bit Temperature Input
8-bit Vibration Input
Time-dependent fault detection
Three-level machine health classification
Designed using the complete ASIC implementation flow
Tools Used
Verilog HDL – RTL Design
Cadence Xcelium – Functional Simulation
Cadence Genus – Logic Synthesis
Cadence Innovus – Floorplanning, Placement, Clock Tree Synthesis, Routing, and Physical Design
  
  
