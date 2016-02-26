# Code Book

## variables
`` ls()


 [1] "act_names"        "activ_array"      "activ_means"     
 [4] "complete_dataset" "features"         "new_cols"        
 [7] "read_subjects"    "read_x_data"      "read_y_data"     
 [10] "subjects"         "x_data"           "y_data"

###  act_names

``act_names

     id            name
	1  1            WALKING
	2  2   WALKING_UPSTAIRS
	3  3 WALKING_DOWNSTAIRS
	4  4            SITTING
	5  5           STANDING
	6  6             LAYING

### subject


`` data.frame(table(subjects))
       subject Freq


	 1         1  347
	 2         2  302
	 3         3  341
	 4         4  317
	 5         5  302
	 6         6  325
	 7         7  308
	 8         8  281
	 9         9  288
	 10       10  294
	 11       11  316
	 12       12  320
	 13       13  327
	 14       14  323
	 15       15  328
	 16       16  366
	 17       17  368
	 18       18  364
	 19       19  360
	 20       20  354
	 21       21  408
	 22       22  321
	 23       23  372
	 24       24  381
	 25       25  409
	 26       26  392
	 27       27  376
	 28       28  382
	 29       29  344
	 30       30  383
