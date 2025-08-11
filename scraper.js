#!/usr/bin/env node

const gplay = require('google-play-scraper');

// Get URL from command line arguments
const url = process.argv[2];

if (!url) {
  console.error('Error: Please provide a Google Play Store URL as an argument');
  console.error('Usage: node scraper.js <google-play-store-url>');
  process.exit(1);
}

// Extract app ID from URL
function extractAppId(url) {
  const match = url.match(/id=([^&]+)/);
  if (match) {
    return match[1];
  }
  
  // Alternative pattern for some URLs
  const altMatch = url.match(/\/store\/apps\/details\?.*id=([^&]+)/);
  if (altMatch) {
    return altMatch[1];
  }
  
  throw new Error('Could not extract app ID from URL');
}

async function scrapeApp(url) {
  try {
    const appId = extractAppId(url);
    console.error(`Scraping app with ID: ${appId}`);
    
    const appData = await gplay.app({ appId });
    
    // Output the metadata to stdout as JSON
    console.log(JSON.stringify(appData, null, 2));
    
  } catch (error) {
    console.error('Error scraping app:', error.message);
    process.exit(1);
  }
}

// Run the scraper
scrapeApp(url);
