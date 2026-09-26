const fs = require('fs');
const path = require('path');
const sharp = require('sharp');

const directoryPath = path.join(__dirname, 'assets', 'products');

// Check if directory exists
if (!fs.existsSync(directoryPath)) {
    console.error(`Directory not found: ${directoryPath}`);
    process.exit(1);
}

fs.readdir(directoryPath, async (err, files) => {
    if (err) {
        return console.error('Unable to scan directory: ' + err);
    }

    console.log(`Found ${files.length} items. Processing images...`);

    for (const file of files) {
        const filePath = path.join(directoryPath, file);
        const ext = path.extname(file).toLowerCase();

        // Skip directories and files that are already webp
        if (fs.lstatSync(filePath).isDirectory() || ext === '.webp') {
            continue;
        }

        // Target only common image formats
        if (['.jpg', '.jpeg', '.png'].includes(ext)) {
            const baseName = path.basename(file, ext);
            const outputFilePath = path.join(directoryPath, `${baseName}.webp`);

            try {
                await sharp(filePath)
                    .webp({ quality: 85 }) // Adjust quality (1-100) as needed
                    .toFile(outputFilePath);
                
                console.log(`Converted: ${file} -> ${baseName}.webp`);
            } catch (error) {
                console.error(`Failed to convert ${file}:`, error.message);
            }
        }
    }

    console.log('All image conversions completed!');
});