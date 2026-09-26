const fs = require('fs');
const path = require('path');

const htmlPath = path.join(__dirname, 'index.html');

if (fs.existsSync(htmlPath)) {
    let content = fs.readFileSync(htmlPath, 'utf8');
    
    // Regex to find any image references inside assets/products/ ending in .jpg, .jpeg, or .png
    const updatedContent = content.replace(/assets\/products\/([^"']+)\.(jpeg|jpg|png)/gi, 'assets/products/$1.webp');

    fs.writeFileSync(htmlPath, updatedContent, 'utf8');
    console.log('Successfully updated index.html to use WebP images!');
} else {
    console.log('Could not find index.html in the root directory.');
}