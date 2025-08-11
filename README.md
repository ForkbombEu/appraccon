# AppRaccoon - Google Play Store Metadata Scraper

A Docker-based tool to scrape metadata from Google Play Store URLs using the google-play-scraper library.

## Quick Start

### Using the published Docker image

```bash
docker run --rm ghcr.io/forkbombeu/appraccoon:latest "https://play.google.com/store/apps/details?id=com.whatsapp"
```

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

## Publishing the Docker Image

### Manual Publishing

Use the provided script:

```bash
./publish.sh
```

Or manually:

1. **Login to GitHub Container Registry:**
   ```bash
   echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin
   # or interactively:
   docker login ghcr.io
   ```

2. **Tag and push the image:**
   ```bash
   docker tag appraccoon ghcr.io/forkbombeu/appraccoon:latest
   docker tag appraccoon ghcr.io/forkbombeu/appraccoon:v1.0.0
   docker push ghcr.io/forkbombeu/appraccoon:latest
   docker push ghcr.io/forkbombeu/appraccoon:v1.0.0
   ```

### Automated Publishing (GitHub Actions)

The repository includes a GitHub Actions workflow that automatically builds and publishes the Docker image to GitHub Container Registry (ghcr.io) when:
- Code is pushed to the `main` branch
- A new version tag is created (e.g., `v1.0.0`)

**No additional setup required!** The workflow uses the built-in `GITHUB_TOKEN` which automatically has the necessary permissions.

To trigger a new release:

```bash
git tag v1.0.0
git push origin v1.0.0
```

### Using the published image

Once published, users can run the scraper directly without building:

```bash
docker run --rm ghcr.io/forkbombeu/appraccoon:latest "https://play.google.com/store/apps/details?id=com.whatsapp"
```

## Development

To run locally without Docker:

```bash
npm install
node scraper.js "https://play.google.com/store/apps/details?id=com.example.app"
```
