# Mirror Wall App

Mirror Wall is a Flutter-based mobile application that provides a multi-functional browser experience. The app allows users to browse the internet, save bookmarks, navigate back and forward, reload the current page, and return to the home page with ease.

## Features

- **Multi-Functional Browser**: Browse various websites using an integrated web browser.
- **Save Bookmarks**: Save your favorite websites for quick access.
- **Navigation Controls**: Go back to the previous page, move forward, reload the current page, and return to the home page.
- **Responsive UI**: A user-friendly interface that adapts to different screen sizes and orientations.

## Usage

### Home Page

The home page of the Mirror Wall app provides quick access to predefined popular search engines (Google, Yahoo, Bing, DuckDuckGo). Users can select a search engine to start browsing.

### Browser Controls

- **Back Button**: Navigate to the previous web page.
- **Forward Button**: Navigate to the next web page (if available).
- **Reload Button**: Reload the current web page.
- **Home Button**: Return to the home page of the app.
- **Bookmark Button**: Save the current web page to bookmarks for quick access later.

### Bookmarks

Access saved bookmarks from the bookmarks section. Click on a bookmark to navigate to the saved web page.

## Code Structure

- `main.dart`: The entry point of the app.
- `all_browser_data.dart`: Manages browser data and state.
- `home_page.dart`: The home page UI.
- `browser_page.dart`: The web browser UI with navigation controls.
- `bookmarks_page.dart`: Manages and displays saved bookmarks.

## Dependencies

- `flutter_webview_plugin`: For displaying web pages.
- `provider`: State management.
