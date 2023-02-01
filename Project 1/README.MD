````
variable_structure_PID.mdl
````
This simulink model is located under the directory 'files'.

The model is dependent on the following files that are located in the same folder:
1. theta_input.m
2. omega_input.m
3. psi_input.m
4. dynamics.m
5. smc1.m

### To run this model
1. Open this file in any MATLAB version before 2019b (preferably 2018b) as this model extensively uses SIMSCAPE Multibody - V1 for the modeling aspect of the project.
2. Add the path to the project in the MATLAB.
3. After adding the relevant path, open this file in SIMULINK and run the model.
4. The scope put to show error in joint angles, and torque will be generated.

