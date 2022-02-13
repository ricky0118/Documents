# Training

## Data grouping

We will split a big data set into a lot of smaller groups, and each group is called "***Batch***". And each batch will calculate a loss and do once iterative, and the process is called "***Update***". When all batches was been updated, then the cycle is called an "***Epoch***".

> ### Batch
> A small group of all data.

> ### Update
> An iterative of a batch.

> ### Epoch
> Finish all updates in the data set.

### For example
1. 10,000 data, and [[HyperParameters#Batch Size| batch size]] is 10.
	For one epoch will have ==1,000 times update==.
2. 10,000 data, and [[HyperParameters#Batch Size| batch size]] is 100.
	For one epoch will have ==10 times update==.
