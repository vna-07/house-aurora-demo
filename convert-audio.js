const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const audioDir = path.join(__dirname, 'audio');
const files = fs.readdirSync(audioDir);

files.forEach(file => {
  if (path.extname(file) === '.mp3') {
    const name = path.basename(file, '.mp3');
    const inputPath = path.join(audioDir, file);
    const outputPath = path.join(audioDir, `${name}.m4a`); // or .webm / .ogg

    console.log(`Converting ${file} -> ${name}.m4a...`);
    execSync(`ffmpeg -i "${inputPath}" -c:a aac -b:a 128k "${outputPath}" -y`);
  }
});

console.log('Audio conversion complete!');