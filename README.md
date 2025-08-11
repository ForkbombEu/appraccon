# AppRaccoon - Google Play Store Metadata Scraper

A Docker-based tool to scrape metadata from Google Play Store URLs using the google-play-scraper library.

## Usage

### Building the Docker image

```bash
docker build -t appraccoon .
```

### Running the scraper

```bash
docker run --rm appraccoon "https://play.google.com/store/apps/details?id=com.example.app"
```

Replace the URL with the actual Google Play Store app URL you want to scrape.

### Example

```bash
docker run --rm appraccoon "https://play.google.com/store/apps/details?id=com.whatsapp"
```

This will output the app metadata as JSON to stdout.

## Output

The script outputs detailed metadata about the app including:
- App name and description
- Developer information
- Ratings and reviews
- Screenshots and images
- Version information
- Download counts
- And much more...

## Error Handling

- If no URL is provided, the script will exit with an error message
- If the URL format is invalid, the script will attempt to extract the app ID
- Any scraping errors will be reported to stderr while keeping stdout clean for the JSON output

## Development

To run locally without Docker:

```bash
npm install
node scraper.js "https://play.google.com/store/apps/details?id=com.example.app"
```
