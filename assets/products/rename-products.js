// rename-products.js
// Run with:  node rename-products.js
// Place this file INSIDE your assets/products folder, then run it from there.
// It renames your original screenshot-derived filenames to the clean slugs
// index.html expects. Safe to re-run — already-renamed or missing files are
// skipped with a message, nothing is overwritten or deleted.

const fs = require('fs');
const path = require('path');

const pairs = [
  {
    "from": "Adidas Samba OG – 'Dark Brown Footwear White'.jpeg",
    "to": "adidas-samba-og-dark-brown-footwear-white-front.jpeg"
  },
  {
    "from": "Adidas Samba OG – 'Leopard Pony Hair Crimson'.jpeg",
    "to": "adidas-samba-og-leopard-pony-hair-crimson-front.jpeg"
  },
  {
    "from": "Adidas x Supreme Samba OG – 'Maroon Off-White Suede'.jpeg",
    "to": "adidas-x-supreme-samba-og-maroon-off-white-suede-front.jpeg"
  },
  {
    "from": "Adidas Forum Low CL – 'Mocha Cream'.jpeg",
    "to": "adidas-forum-low-cl-mocha-cream-front.jpeg"
  },
  {
    "from": "Adidas Originals Samba Jane Mary Jane – 'Frill Cloud White Soft Taupe.jpeg",
    "to": "adidas-samba-jane-mary-jane-frill-cloud-white-soft-taupe-front.jpeg"
  },
  {
    "from": "Adidas Sambarose Platform – 'Valentine’s Day White Glory Pink.jpeg",
    "to": "adidas-sambarose-platform-valentines-white-glory-pink-front.jpeg"
  },
  {
    "from": "Adidas Centennial 85 Low – 'Vintage Cream Crimson'.jpeg",
    "to": "adidas-centennial-85-low-vintage-cream-crimson-front.jpeg"
  },
  {
    "from": "Adidas Forum 84 Low ADV – 'Earth Mocha Suede'.jpeg",
    "to": "adidas-forum-84-low-adv-earth-mocha-suede-front.jpeg"
  },
  {
    "from": "Nike Air Force 1 Low '07 Custom – 'BE@RBRICK Sail Black'.jpeg",
    "to": "nike-af1-low-07-custom-bearbrick-sail-black-front.jpeg"
  },
  {
    "from": "Nike Air Force 1 Mid '07 x Reigning Champ – 'Wolf Grey Suede.jpeg",
    "to": "nike-af1-mid-07-x-reigning-champ-wolf-grey-suede-front.jpeg"
  },
  {
    "from": "Nike Air Force 1 Low '07 LV8 x Stüssy – 'Dice Off-White Black'.jpeg",
    "to": "nike-af1-low-07-lv8-x-stussy-dice-off-white-black-front.jpeg"
  },
  {
    "from": "Nike Air Force 1 Low '07 – 'Flax Wheat Nubuck Gum'.jpeg",
    "to": "nike-af1-low-07-flax-wheat-nubuck-gum-front.jpeg"
  },
  {
    "from": "Nike Air Force 1 Low '07 – 'Paisley Laser-Etched Suede Celestial Blue'.jpeg",
    "to": "nike-af1-low-07-paisley-laser-etched-suede-celestial-blue-front.jpeg"
  },
  {
    "from": "Nike Air Force 1 Low '07 x The North Face – 'Bone Sail Slate Grey'.jpeg",
    "to": "nike-af1-low-07-x-north-face-bone-sail-slate-grey-front.jpeg"
  },
  {
    "from": "Nike Air Force 1 Low '07 – '2D Manga Sketch Vibe White Black'.jpeg",
    "to": "nike-af1-low-07-2d-manga-sketch-vibe-white-black-front.jpeg"
  },
  {
    "from": "Nike Air Force 1 Low '07 – 'Sakura Floral Appliqué Pink Foam'.jpeg",
    "to": "nike-af1-low-07-sakura-floral-applique-pink-foam-front.jpeg"
  },
  {
    "from": "Fear of God Essentials 1977 Fleece Hoodie – 'Wheat Sand'.jpeg",
    "to": "fog-essentials-1977-fleece-hoodie-wheat-sand-front.jpeg"
  },
  {
    "from": "Corteiz Varsity Rugby Stripe Hoodie – 'Off-White Royal Blue & Burgundy'.jpg",
    "to": "corteiz-varsity-rugby-stripe-hoodie-off-white-royal-blue-burgundy-front.jpg"
  },
  {
    "from": "Adidas Originals CNY Tang Suit Track Jacket – 'Deep Plum Purple White'.jpg",
    "to": "adidas-cny-tang-suit-track-jacket-deep-plum-purple-white-front.jpg"
  },
  {
    "from": "Nike Sportswear Tech Fleece 2025 Full-Zip Tracksuit – 'Light Bone Phantom Grey'...upper.jpg",
    "to": "nike-tech-fleece-2025-tracksuit-light-bone-phantom-grey-front.jpg"
  },
  {
    "from": "Corteiz Alcatraz Knit Hooded Sweater – 'Cream White Black'.jpg",
    "to": "corteiz-alcatraz-knit-hooded-sweater-cream-white-black-front.jpg"
  },
  {
    "from": "Y-3 x Yohji Yamamoto x New Era Signature T-Shirt –Cloud White'.jpg",
    "to": "y3-x-new-era-signature-tshirt-cloud-white-front.jpg"
  },
  {
    "from": "Polo Ralph Lauren Striped Cotton Knit Polo Sweater – 'Royal Blue Cream White.jpg",
    "to": "polo-rl-striped-cotton-knit-polo-sweater-royal-blue-cream-white-front.jpg"
  },
  {
    "from": "Corteiz RULES THE WORLD Panel Full-Zip Hoodie – 'Heather Grey Black'.jpg",
    "to": "corteiz-rules-the-world-panel-hoodie-heather-grey-black-front.jpg"
  },
  {
    "from": "Louis Vuitton Damier Knit Beanie – 'Slate Grey & Pearl White'.jpg",
    "to": "lv-damier-knit-beanie-slate-grey-pearl-white-front.jpg"
  },
  {
    "from": "Corteiz Crtz Script Skull Cap Beanie – 'Black White Embroidery.jpg",
    "to": "corteiz-crtz-script-skull-cap-beanie-black-white-embroidery-front.jpg"
  },
  {
    "from": "Nike x NOCTA Mind 001 Slide – 'Triple White Black Branding'.jpeg",
    "to": "nike-x-nocta-mind-001-slide-triple-white-black-front.jpeg"
  },
  {
    "from": "Nike Asuna 2 Slide – 'Soft Pink Coconut Milk'.jpeg",
    "to": "nike-asuna-2-slide-soft-pink-coconut-milk-front.jpeg"
  }
];

let renamed = 0, missing = 0, already = 0;

for (const { from, to } of pairs) {
  const fromPath = path.join(__dirname, from);
  const toPath = path.join(__dirname, to);

  if (fs.existsSync(toPath)) {
    console.log('OK (already renamed):', to);
    already++;
    continue;
  }
  if (!fs.existsSync(fromPath)) {
    console.log('MISSING — could not find:', from);
    missing++;
    continue;
  }
  fs.renameSync(fromPath, toPath);
  console.log('Renamed:', from, ' ->  ', to);
  renamed++;
}

console.log('');
console.log(`Done. Renamed ${renamed}, already done ${already}, missing ${missing}.`);
if (missing > 0) {
  console.log('For any MISSING files above, check the exact filename in your folder');
  console.log('(open the folder in File Explorer/Finder) and tell me what it actually is.');
}