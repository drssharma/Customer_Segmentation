# Customer_Segmentation in R

## Introduction:

Most of the times in Marketing, we hear a term as ‘a group of customers who share similar sets of needs and wants.’ Yes, I went back to my textbook for that one. A customer segment could be a cohort of people belonging to the same age group, gender, geographical region, showcasing affinity towards a certain type of product or price range. But when you have a mixed bag of parameters like that, how do you decide which one of those to use to create neat little segments that can be used for targeting a marketing activity? Should people from the North make up one segment, and middle aged people be another, and another one for people who like to shop just on the weekend? But customers are much more complicated than that. A simple geographic or demographic segmentation may not just cut it anymore.

![image](https://user-images.githubusercontent.com/90656596/166182018-27352b12-fee2-4309-b752-569a6aed7794.png)


I am going to use k-means algorithms for clustering on a dataset of customers from Kaggle. The dataset mainly covers some demographic attributes of an automobile dealer’s target market of customers. I’ll be using R for this analysis after quite a sabbatical, and might therefore appear Rusty.


### Purpose of the Analysis
Clustering analysis on data 


### Research Questions:

- What is the overall trend of the dataset, are the segments dominated by males or females.
- How is the trend in terms of Age, is it younger people or elderly people who are dominated in a particular segment. 
- Which segment has low or which one has high spending score.

Based on the analysis, marketing team can decide which type of communication to send to which segment.

## Methodology:
- Statistical Analysis
- Data preprocessing
- Data Visualization
- K-means algorithm


### 1. Statistical Analysis on Data:

The dataset is loaded from Kaggle. It has 6718 rows and 11 columns. The dataset mainly covers some demographic attributes of an automobile dealer’s target market of customers such as ID, Age, Profession, Education, Marital Status, Work Experience and Spending Score, Var1, Segmentation etc. First, I did some statistical analysis on data to get familiar with it and removed ID, Var1, Segmentation columns as we don't need them for Clustering. There are some blank values in the the column named "Profession". I replaced them with NA values and then I removed all the NA values. 

### Data Visualization: 

- The general age of customers in this dataset lies between 18–60.
- Customers have a work experience of 0 -4 years with a few outliers having more than 10 years of work experience
- Family size ranges between 2- 4
- There are more males than females in the customer base
- There are more married people than unmarried
- A major portion of the customers are graduates
- Artist is the most common profession seen among customers
- Most customers belong to the low spending score category
![Age Distribution](https://user-images.githubusercontent.com/90656596/166261590-6210d25b-b60b-4d60-8220-0ea8a9d7a107.png)


![Work-Ex Distribution](https://user-images.githubusercontent.com/90656596/166261642-35ac3491-13f2-4466-b784-188cb05c415a.png)


![Family Size Distribution](https://user-images.githubusercontent.com/90656596/166261949-3a6da685-2bef-4173-ba41-8bdee41f8693.png)


![Gender Counts](https://user-images.githubusercontent.com/90656596/166262122-064ec616-e1da-4bfb-aa55-e42e3773af4a.png)


![Marital Status](https://user-images.githubusercontent.com/90656596/166262187-77910ab5-2d32-44b2-abfa-40e2afe8abeb.png)


![Education Status](https://user-images.githubusercontent.com/90656596/166262286-774e727b-fa93-47bf-b1d2-8ccab1d4150f.png)


![Professions](https://user-images.githubusercontent.com/90656596/166262322-8358915e-1214-4690-ba09-579d691a2d74.png)

![Finanicial Status](https://user-images.githubusercontent.com/90656596/166262352-b7d5dfd2-64f5-46fb-93ab-794ffbe9f473.png)


## Machine Learning Algorithm (K-means): 

As K means clustering deals with only numerical data. We need to change all the character variables into numeric variables. To do that, first I will create 2 datasets, one for numeric and other for character variables and then I will change character varibles into numeric and later I will combine them.

I transformed the character variable into numeric/dummy by using remove_most_frequent_dummy = TRUE, to avoid dummy variable trap. Now there are 18 variables in Character Data.

### Standardizing the data

After combining numerical and character data, I standardized the data so all the values can come in the same range.

### Elbow Method

From the Elbow graph, we can see that the optimal centres value is 6.

![Elbow Method](https://user-images.githubusercontent.com/90656596/166268744-6e744bd7-e488-459b-8104-504abbca5e51.png)

### Customer Profiling

<img width="461" alt="image" src="https://user-images.githubusercontent.com/90656596/166285677-9d0bcd9a-1731-4f28-9714-20c154654250.png">


- Most of the customer segments are dominated by males, which is the overall trend in the underlying dataset as well. Segments 1,2 and 4 are dominated by Married persons while segment 3, 5 and 6 has more unmarried people, which is in line with the observation that it is a younger segment of customers with a minimum age of 18.
- It is also interesting to note that the segments 2,3,5,6 with younger customers i.e. 18–45 year old have low spend scores whereas segments 1 and 4 with middle aged and elderly customers have average to high spend scores.
Based on this analysis, the automobile dealer’s marketing team can identify what kind of communication to send to each of these segments. Segments 1 and 4 can be targeted for luxury Sedans since they have good spending scores and not typically large family sizes. Segment 2,5 can be targeted for entry level cars and Segment 3,6 can be targeted for mid sized SUVs because they have big family size with low spending score.


