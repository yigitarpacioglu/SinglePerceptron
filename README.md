# SinglePerceptron

1. Reading and Visualizing Data
2. Initializing Neccessary Variables
3. Training Data
4. Test Data

# 1. Reading and Visualizing Data

In first part, data has been imported into MATLAB from txt file. (trainingdata). This dataset is separated into matrix and vector. (X, td) related to their conditions. (feature, label). A helper user defined function with name ‘plotData.m’ has been created to plot data distribution.

# 2. Initializing Neccessary Variables

In this part some variables have been defined. (E.g. learning rate(𝛼), desired iteration, preallocations vs.)

# 3. Training Data

This part is containing architecture of perceptron. In order to boost up execution speed, mostly vectorized operations are preferred. While using vectorized operations, bias is considered as feature 𝑥0 and 𝑥0=1 for all training sets.

Training part consists from 3 different algorithm:
1. Gradient Descent
2. Stochastic Gradient Descent
3. Mini Batch Gradient Descent

According the selection of user, desired method can be used in algorithm. User should write only GD,SGD or MBGD without apostrophes. If any wrong attempts are made, then program warn user to enter different value until correct one is registered.

Gradient descent algorithm simply consists from 5 steps:
1. Net input has been defined
2. Hard limit function has been applied to threshold (classify) values.
3. Proper gradient has been applied.
4. Weights are updated with gradient value.
5. Repeat this until desired iteration is provided.

On the other hand in Stochastic method; before iteration, data samples randomized. Then each training examples have been scanning through and performing update one by one to related samples. Having done this with parameter ‘k’. Columns are vectorized for ‘Xsto’ and updates multiplied in a moment easily.

Taking samples from dataset in each iteration and calculating weights is another way to boost up speed. Although algorithm is not written in vectorized form, execution speed remarkably increased. This method is called Mini-batch gradient descent. Here it is started with, randomizing batches in iteration loop. Point in here is to use different set of data in each iteration. Then with ‘Data_Points’ array, range of batch is set. Here vectorized form is selected again, speed is significantly increased with that way but results are more unreliable.

After that boundary for classification of training data has taken care with ‘bounDary’ function. And accuracy is printed simply by looking in ‘p’(predicted) for ‘td’ target values. Mean values has taken into consider and printed as percentage. All errors are obtained almost in same way. (td-od)