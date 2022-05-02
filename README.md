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

