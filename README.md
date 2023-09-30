# News App

## Introduction

The News App is a Flutter application that provides a user-friendly interface for reading the latest news articles. It features a splash screen with a logo and transitions to the home screen where users can browse and read news articles.

## Getting Started

To run the News App on your local machine, follow these steps:

1. Ensure you have Flutter and Dart installed. If not, you can [install them](https://flutter.dev/docs/get-started/install).

2. Clone this repository to your local machine:

   ```shell
   git clone https://github.com/your-username/news-app.git
   ```

3. Navigate to the project directory:

   ```shell
   cd news-app
   ```

4. Install the project dependencies:

   ```shell
   flutter pub get
   ```

5. Run the application:

   ```shell
   flutter run
   ```

The News App will launch on your emulator or physical device.

**Note**: The News API used in this app can only handle a limited number of requests per day (approximately 100 requests). If you encounter issues with the app not loading news articles, it might be due to exceeding the API request limit. To resolve this, you can sign up for your own API key from the News API website and replace the existing API key in the code.

**Sign Up for a New API Key**: Visit [News API](https://newsapi.org/) to sign up and obtain a new API key for your personal use.

## Features

### Main File (`main.dart`)

- The `main.dart` file is the entry point of the application and contains the `MyApp` class, which handles the app's initialization, theme configuration, and transitions between the splash screen and home screen.

### Home Screen (`home.dart`)

- The `home.dart` file defines the `HomeScreen` class, which is the main screen of the News App. It loads and displays news articles, featuring a loading indicator and a PageView for navigating between articles.

### News Container (`news_container.dart`)

- The `news_container.dart` file defines the `NewsContainer` class responsible for displaying individual news articles in an appealing format. It includes features like displaying images, headlines, descriptions, and "Read More" buttons.

### Detailed Screen (`detailed.dart`)

- The `detailed.dart` file defines the `DetailedScreen` class, which displays the detailed content of a news article using a WebView. It ensures compatibility with HTTPS and allows users to view the full article.

### Article Data (`article_data.dart`)

- The `article_data.dart` file contains the `ArticleData` class, which represents the structure of a news article within the News App. It includes attributes for image URLs, headlines, descriptions, content, and news URLs. The `fromAPItoApp` method converts API response data into `ArticleData` objects.

### Get News (`get_news.dart`)

- The `get_news.dart` file defines the `GetNews` class, responsible for fetching news articles from an API. It randomly selects a news source, retrieves headlines, and returns an `ArticleData` object using the `fetchNews` method.
