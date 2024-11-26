__🚆 Railway Tender Price Prediction Application__
This repository contains a Railway Tender Price Prediction Application, designed to predict
the L1 Price based on key features using machine learning models such as Linear Regression
and Decision Tree Regression. The project leverages Python, Streamlit, SQL, and several data
preprocessing and analysis libraries. The application includes a user-friendly web interface 
built with Streamlit.


📋 Features
End-to-End Workflow:


Data ingestion from MySQL database.
Data preprocessing using pipelines for categorical and numerical features.

Model training and evaluation with various regressors.


Streamlit Interface:
Interactive UI for inputting features like Railway Location, Nature, Basic, Category, and Quantity.

Real-time prediction of L1 Price using a pre-trained Linear Regression model.


Machine Learning Models:

Models used:
Linear Regression (chosen as the final model for its performance).

Decision Tree Regressor.

Random Forest Regressor.


Model evaluation using metrics such as:
Mean Squared Error (MSE).

R² Score.


Data Visualization:
Insights derived using Matplotlib and Seaborn.

Pie charts, bar plots, and count plots for categorical feature analysis.


Data Analysis:
Skewness, kurtosis, variance, and standard deviation for numerical fields.

Exploratory Data Analysis (EDA) with Sweetviz.

Deployment:
Interactive Streamlit web application.


__🔧 Preprocessing and Model Pipeline__

Preprocessing:
Categorical Features:
Handled with SimpleImputer for missing values and OneHotEncoder for encoding.
Numerical Features:
Imputed with SimpleImputer and scaled with StandardScaler.


Model Training:
Trained on features such as:
Railway_Location, Nature, Category, Basic, Qty.
Finalized model: Linear Regression (saved as pipeline_with_model.pkl).


Evaluation:

Linear Regression:
R² Score: X.XX
Mean Squared Error: X.XX
Decision Tree Regressor:
R² Score: X.XX
Mean Squared Error: X.XX
Random Forest Regressor:
R² Score: X.XX
Mean Squared Error: X.XX


📊 Key Insights
Top 15 Railway Locations by majority:
Visualized using pie charts and bar plots.


Analysis of Awarded Categories:
Count plot to identify the frequency of different categories.


Numerical Statistics:
Skewness, kurtosis, variance, and standard deviation of key features.


Missing Values:
Handled using appropriate imputation techniques.



🌟 Highlights

Dynamic Pipeline:
Automates preprocessing for both training and real-time data.


Interactive Web App:
Simple interface for users to make predictions with ease.


Scalable:
Ready for integration with live data sources and deployment on the cloud.


📜 Future Enhancements
Implement advanced models like Gradient Boosting or XGBoost for higher accuracy.

Deploy the application on cloud platforms (e.g., AWS, Heroku).

Add more visualizations for business insights.
