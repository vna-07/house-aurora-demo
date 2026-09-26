#!/usr/bin/env bash
# rename-products.sh (v2 — corrected for the double-space filenames)
# Run with:  bash rename-products.sh
# Run this from your house-aurora-demo project ROOT (same folder as index.html).

cd "$(dirname "$0")"
renamed=0; missing=0; already=0

if [ -f "assets/products/adidas-samba-og-dark-brown-footwear-white-front.jpeg" ]; then
  echo "OK (already renamed): adidas-samba-og-dark-brown-footwear-white-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Adidas Samba OG – 'Dark Brown  Footwear White'.jpeg" ]; then
  mv "assets/products/Adidas Samba OG – 'Dark Brown  Footwear White'.jpeg" "assets/products/adidas-samba-og-dark-brown-footwear-white-front.jpeg"
  echo "Renamed: Adidas Samba OG – 'Dark Brown  Footwear White'.jpeg  ->  adidas-samba-og-dark-brown-footwear-white-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Adidas Samba OG – 'Dark Brown  Footwear White'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/adidas-samba-og-leopard-pony-hair-crimson-front.jpeg" ]; then
  echo "OK (already renamed): adidas-samba-og-leopard-pony-hair-crimson-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Adidas Samba OG – 'Leopard Pony Hair  Crimson'.jpeg" ]; then
  mv "assets/products/Adidas Samba OG – 'Leopard Pony Hair  Crimson'.jpeg" "assets/products/adidas-samba-og-leopard-pony-hair-crimson-front.jpeg"
  echo "Renamed: Adidas Samba OG – 'Leopard Pony Hair  Crimson'.jpeg  ->  adidas-samba-og-leopard-pony-hair-crimson-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Adidas Samba OG – 'Leopard Pony Hair  Crimson'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/adidas-x-supreme-samba-og-maroon-off-white-suede-front.jpeg" ]; then
  echo "OK (already renamed): adidas-x-supreme-samba-og-maroon-off-white-suede-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Adidas x Supreme Samba OG – 'Maroon  Off-White Suede'.jpeg" ]; then
  mv "assets/products/Adidas x Supreme Samba OG – 'Maroon  Off-White Suede'.jpeg" "assets/products/adidas-x-supreme-samba-og-maroon-off-white-suede-front.jpeg"
  echo "Renamed: Adidas x Supreme Samba OG – 'Maroon  Off-White Suede'.jpeg  ->  adidas-x-supreme-samba-og-maroon-off-white-suede-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Adidas x Supreme Samba OG – 'Maroon  Off-White Suede'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/adidas-forum-low-cl-mocha-cream-front.jpeg" ]; then
  echo "OK (already renamed): adidas-forum-low-cl-mocha-cream-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Adidas Forum Low CL – 'Mocha Cream'.jpeg" ]; then
  mv "assets/products/Adidas Forum Low CL – 'Mocha Cream'.jpeg" "assets/products/adidas-forum-low-cl-mocha-cream-front.jpeg"
  echo "Renamed: Adidas Forum Low CL – 'Mocha Cream'.jpeg  ->  adidas-forum-low-cl-mocha-cream-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Adidas Forum Low CL – 'Mocha Cream'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/adidas-samba-jane-mary-jane-frill-cloud-white-soft-taupe-front.jpeg" ]; then
  echo "OK (already renamed): adidas-samba-jane-mary-jane-frill-cloud-white-soft-taupe-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Adidas Originals Samba Jane Mary Jane – 'Frill Cloud White  Soft Taupe.jpeg" ]; then
  mv "assets/products/Adidas Originals Samba Jane Mary Jane – 'Frill Cloud White  Soft Taupe.jpeg" "assets/products/adidas-samba-jane-mary-jane-frill-cloud-white-soft-taupe-front.jpeg"
  echo "Renamed: Adidas Originals Samba Jane Mary Jane – 'Frill Cloud White  Soft Taupe.jpeg  ->  adidas-samba-jane-mary-jane-frill-cloud-white-soft-taupe-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Adidas Originals Samba Jane Mary Jane – 'Frill Cloud White  Soft Taupe.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/adidas-sambarose-platform-valentines-white-glory-pink-front.jpeg" ]; then
  echo "OK (already renamed): adidas-sambarose-platform-valentines-white-glory-pink-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Adidas Sambarose Platform – 'Valentine’s Day White  Glory Pink'.jpeg" ]; then
  mv "assets/products/Adidas Sambarose Platform – 'Valentine’s Day White  Glory Pink'.jpeg" "assets/products/adidas-sambarose-platform-valentines-white-glory-pink-front.jpeg"
  echo "Renamed: Adidas Sambarose Platform – 'Valentine’s Day White  Glory Pink'.jpeg  ->  adidas-sambarose-platform-valentines-white-glory-pink-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Adidas Sambarose Platform – 'Valentine’s Day White  Glory Pink'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/adidas-centennial-85-low-vintage-cream-crimson-front.jpeg" ]; then
  echo "OK (already renamed): adidas-centennial-85-low-vintage-cream-crimson-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Adidas Centennial 85 Low – 'Vintage Cream  Crimson'.jpeg" ]; then
  mv "assets/products/Adidas Centennial 85 Low – 'Vintage Cream  Crimson'.jpeg" "assets/products/adidas-centennial-85-low-vintage-cream-crimson-front.jpeg"
  echo "Renamed: Adidas Centennial 85 Low – 'Vintage Cream  Crimson'.jpeg  ->  adidas-centennial-85-low-vintage-cream-crimson-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Adidas Centennial 85 Low – 'Vintage Cream  Crimson'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/adidas-forum-84-low-adv-earth-mocha-suede-front.jpeg" ]; then
  echo "OK (already renamed): adidas-forum-84-low-adv-earth-mocha-suede-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Adidas Forum 84 Low ADV – 'Earth Mocha Suede'.jpeg" ]; then
  mv "assets/products/Adidas Forum 84 Low ADV – 'Earth Mocha Suede'.jpeg" "assets/products/adidas-forum-84-low-adv-earth-mocha-suede-front.jpeg"
  echo "Renamed: Adidas Forum 84 Low ADV – 'Earth Mocha Suede'.jpeg  ->  adidas-forum-84-low-adv-earth-mocha-suede-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Adidas Forum 84 Low ADV – 'Earth Mocha Suede'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-af1-low-07-custom-bearbrick-sail-black-front.jpeg" ]; then
  echo "OK (already renamed): nike-af1-low-07-custom-bearbrick-sail-black-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Nike Air Force 1 Low '07 Custom – 'BE@RBRICK Sail  Black'.jpeg" ]; then
  mv "assets/products/Nike Air Force 1 Low '07 Custom – 'BE@RBRICK Sail  Black'.jpeg" "assets/products/nike-af1-low-07-custom-bearbrick-sail-black-front.jpeg"
  echo "Renamed: Nike Air Force 1 Low '07 Custom – 'BE@RBRICK Sail  Black'.jpeg  ->  nike-af1-low-07-custom-bearbrick-sail-black-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike Air Force 1 Low '07 Custom – 'BE@RBRICK Sail  Black'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-af1-mid-07-x-reigning-champ-wolf-grey-suede-front.jpeg" ]; then
  echo "OK (already renamed): nike-af1-mid-07-x-reigning-champ-wolf-grey-suede-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Nike Air Force 1 Mid '07 x Reigning Champ – 'Wolf Grey Suede.jpeg" ]; then
  mv "assets/products/Nike Air Force 1 Mid '07 x Reigning Champ – 'Wolf Grey Suede.jpeg" "assets/products/nike-af1-mid-07-x-reigning-champ-wolf-grey-suede-front.jpeg"
  echo "Renamed: Nike Air Force 1 Mid '07 x Reigning Champ – 'Wolf Grey Suede.jpeg  ->  nike-af1-mid-07-x-reigning-champ-wolf-grey-suede-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike Air Force 1 Mid '07 x Reigning Champ – 'Wolf Grey Suede.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-af1-low-07-lv8-x-stussy-dice-off-white-black-front.jpeg" ]; then
  echo "OK (already renamed): nike-af1-low-07-lv8-x-stussy-dice-off-white-black-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Nike Air Force 1 Low '07 LV8 x Stüssy – 'Dice Off-White  Black'.jpeg" ]; then
  mv "assets/products/Nike Air Force 1 Low '07 LV8 x Stüssy – 'Dice Off-White  Black'.jpeg" "assets/products/nike-af1-low-07-lv8-x-stussy-dice-off-white-black-front.jpeg"
  echo "Renamed: Nike Air Force 1 Low '07 LV8 x Stüssy – 'Dice Off-White  Black'.jpeg  ->  nike-af1-low-07-lv8-x-stussy-dice-off-white-black-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike Air Force 1 Low '07 LV8 x Stüssy – 'Dice Off-White  Black'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-af1-low-07-flax-wheat-nubuck-gum-front.jpeg" ]; then
  echo "OK (already renamed): nike-af1-low-07-flax-wheat-nubuck-gum-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Nike Air Force 1 Low '07 – 'Flax Wheat Nubuck  Gum'.jpeg" ]; then
  mv "assets/products/Nike Air Force 1 Low '07 – 'Flax Wheat Nubuck  Gum'.jpeg" "assets/products/nike-af1-low-07-flax-wheat-nubuck-gum-front.jpeg"
  echo "Renamed: Nike Air Force 1 Low '07 – 'Flax Wheat Nubuck  Gum'.jpeg  ->  nike-af1-low-07-flax-wheat-nubuck-gum-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike Air Force 1 Low '07 – 'Flax Wheat Nubuck  Gum'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-af1-low-07-paisley-laser-etched-suede-celestial-blue-front.jpeg" ]; then
  echo "OK (already renamed): nike-af1-low-07-paisley-laser-etched-suede-celestial-blue-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Nike Air Force 1 Low '07 – 'Paisley Laser-Etched Suede  Celestial Blue'.jpeg" ]; then
  mv "assets/products/Nike Air Force 1 Low '07 – 'Paisley Laser-Etched Suede  Celestial Blue'.jpeg" "assets/products/nike-af1-low-07-paisley-laser-etched-suede-celestial-blue-front.jpeg"
  echo "Renamed: Nike Air Force 1 Low '07 – 'Paisley Laser-Etched Suede  Celestial Blue'.jpeg  ->  nike-af1-low-07-paisley-laser-etched-suede-celestial-blue-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike Air Force 1 Low '07 – 'Paisley Laser-Etched Suede  Celestial Blue'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-af1-low-07-x-north-face-bone-sail-slate-grey-front.jpeg" ]; then
  echo "OK (already renamed): nike-af1-low-07-x-north-face-bone-sail-slate-grey-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Nike Air Force 1 Low '07 x The North Face – 'Bone Sail  Slate Grey'.jpeg" ]; then
  mv "assets/products/Nike Air Force 1 Low '07 x The North Face – 'Bone Sail  Slate Grey'.jpeg" "assets/products/nike-af1-low-07-x-north-face-bone-sail-slate-grey-front.jpeg"
  echo "Renamed: Nike Air Force 1 Low '07 x The North Face – 'Bone Sail  Slate Grey'.jpeg  ->  nike-af1-low-07-x-north-face-bone-sail-slate-grey-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike Air Force 1 Low '07 x The North Face – 'Bone Sail  Slate Grey'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-af1-low-07-2d-manga-sketch-vibe-white-black-front.jpeg" ]; then
  echo "OK (already renamed): nike-af1-low-07-2d-manga-sketch-vibe-white-black-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Nike Air Force 1 Low '07 – '2D Manga Sketch  Vibe White Black'.jpeg" ]; then
  mv "assets/products/Nike Air Force 1 Low '07 – '2D Manga Sketch  Vibe White Black'.jpeg" "assets/products/nike-af1-low-07-2d-manga-sketch-vibe-white-black-front.jpeg"
  echo "Renamed: Nike Air Force 1 Low '07 – '2D Manga Sketch  Vibe White Black'.jpeg  ->  nike-af1-low-07-2d-manga-sketch-vibe-white-black-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike Air Force 1 Low '07 – '2D Manga Sketch  Vibe White Black'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-af1-low-07-sakura-floral-applique-pink-foam-front.jpeg" ]; then
  echo "OK (already renamed): nike-af1-low-07-sakura-floral-applique-pink-foam-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Nike Air Force 1 Low '07 – 'Sakura Floral Appliqué  Pink Foam'.jpeg" ]; then
  mv "assets/products/Nike Air Force 1 Low '07 – 'Sakura Floral Appliqué  Pink Foam'.jpeg" "assets/products/nike-af1-low-07-sakura-floral-applique-pink-foam-front.jpeg"
  echo "Renamed: Nike Air Force 1 Low '07 – 'Sakura Floral Appliqué  Pink Foam'.jpeg  ->  nike-af1-low-07-sakura-floral-applique-pink-foam-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike Air Force 1 Low '07 – 'Sakura Floral Appliqué  Pink Foam'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/fog-essentials-1977-fleece-hoodie-wheat-sand-front.jpeg" ]; then
  echo "OK (already renamed): fog-essentials-1977-fleece-hoodie-wheat-sand-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Fear of God Essentials 1977 Fleece Hoodie – 'Wheat  Sand'.jpeg" ]; then
  mv "assets/products/Fear of God Essentials 1977 Fleece Hoodie – 'Wheat  Sand'.jpeg" "assets/products/fog-essentials-1977-fleece-hoodie-wheat-sand-front.jpeg"
  echo "Renamed: Fear of God Essentials 1977 Fleece Hoodie – 'Wheat  Sand'.jpeg  ->  fog-essentials-1977-fleece-hoodie-wheat-sand-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Fear of God Essentials 1977 Fleece Hoodie – 'Wheat  Sand'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/corteiz-varsity-rugby-stripe-hoodie-off-white-royal-blue-burgundy-front.jpg" ]; then
  echo "OK (already renamed): corteiz-varsity-rugby-stripe-hoodie-off-white-royal-blue-burgundy-front.jpg"
  already=$((already+1))
elif [ -f "assets/products/Corteiz Varsity Rugby Stripe Hoodie – 'Off-White  Royal Blue & Burgundy'.jpg" ]; then
  mv "assets/products/Corteiz Varsity Rugby Stripe Hoodie – 'Off-White  Royal Blue & Burgundy'.jpg" "assets/products/corteiz-varsity-rugby-stripe-hoodie-off-white-royal-blue-burgundy-front.jpg"
  echo "Renamed: Corteiz Varsity Rugby Stripe Hoodie – 'Off-White  Royal Blue & Burgundy'.jpg  ->  corteiz-varsity-rugby-stripe-hoodie-off-white-royal-blue-burgundy-front.jpg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Corteiz Varsity Rugby Stripe Hoodie – 'Off-White  Royal Blue & Burgundy'.jpg"
  missing=$((missing+1))
fi

if [ -f "assets/products/adidas-cny-tang-suit-track-jacket-deep-plum-purple-white-front.jpg" ]; then
  echo "OK (already renamed): adidas-cny-tang-suit-track-jacket-deep-plum-purple-white-front.jpg"
  already=$((already+1))
elif [ -f "assets/products/Adidas Originals CNY Tang Suit Track Jacket – 'Deep Plum Purple  White'.jpg" ]; then
  mv "assets/products/Adidas Originals CNY Tang Suit Track Jacket – 'Deep Plum Purple  White'.jpg" "assets/products/adidas-cny-tang-suit-track-jacket-deep-plum-purple-white-front.jpg"
  echo "Renamed: Adidas Originals CNY Tang Suit Track Jacket – 'Deep Plum Purple  White'.jpg  ->  adidas-cny-tang-suit-track-jacket-deep-plum-purple-white-front.jpg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Adidas Originals CNY Tang Suit Track Jacket – 'Deep Plum Purple  White'.jpg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-tech-fleece-2025-tracksuit-light-bone-phantom-grey-front.jpg" ]; then
  echo "OK (already renamed): nike-tech-fleece-2025-tracksuit-light-bone-phantom-grey-front.jpg"
  already=$((already+1))
elif [ -f "assets/products/Nike Sportswear Tech Fleece 2025 Full-Zip Tracksuit – 'Light Bone  Phantom Grey'...upper.jpg" ]; then
  mv "assets/products/Nike Sportswear Tech Fleece 2025 Full-Zip Tracksuit – 'Light Bone  Phantom Grey'...upper.jpg" "assets/products/nike-tech-fleece-2025-tracksuit-light-bone-phantom-grey-front.jpg"
  echo "Renamed: Nike Sportswear Tech Fleece 2025 Full-Zip Tracksuit – 'Light Bone  Phantom Grey'...upper.jpg  ->  nike-tech-fleece-2025-tracksuit-light-bone-phantom-grey-front.jpg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike Sportswear Tech Fleece 2025 Full-Zip Tracksuit – 'Light Bone  Phantom Grey'...upper.jpg"
  missing=$((missing+1))
fi

if [ -f "assets/products/corteiz-alcatraz-knit-hooded-sweater-cream-white-black-front.jpg" ]; then
  echo "OK (already renamed): corteiz-alcatraz-knit-hooded-sweater-cream-white-black-front.jpg"
  already=$((already+1))
elif [ -f "assets/products/Corteiz Alcatraz Knit Hooded Sweater – 'Cream White  Black'.jpg" ]; then
  mv "assets/products/Corteiz Alcatraz Knit Hooded Sweater – 'Cream White  Black'.jpg" "assets/products/corteiz-alcatraz-knit-hooded-sweater-cream-white-black-front.jpg"
  echo "Renamed: Corteiz Alcatraz Knit Hooded Sweater – 'Cream White  Black'.jpg  ->  corteiz-alcatraz-knit-hooded-sweater-cream-white-black-front.jpg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Corteiz Alcatraz Knit Hooded Sweater – 'Cream White  Black'.jpg"
  missing=$((missing+1))
fi

if [ -f "assets/products/y3-x-new-era-signature-tshirt-cloud-white-front.jpg" ]; then
  echo "OK (already renamed): y3-x-new-era-signature-tshirt-cloud-white-front.jpg"
  already=$((already+1))
elif [ -f "assets/products/Y-3 x Yohji Yamamoto x New Era Signature T-Shirt –Cloud White'.jpg" ]; then
  mv "assets/products/Y-3 x Yohji Yamamoto x New Era Signature T-Shirt –Cloud White'.jpg" "assets/products/y3-x-new-era-signature-tshirt-cloud-white-front.jpg"
  echo "Renamed: Y-3 x Yohji Yamamoto x New Era Signature T-Shirt –Cloud White'.jpg  ->  y3-x-new-era-signature-tshirt-cloud-white-front.jpg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Y-3 x Yohji Yamamoto x New Era Signature T-Shirt –Cloud White'.jpg"
  missing=$((missing+1))
fi

if [ -f "assets/products/polo-rl-striped-cotton-knit-polo-sweater-royal-blue-cream-white-front.jpg" ]; then
  echo "OK (already renamed): polo-rl-striped-cotton-knit-polo-sweater-royal-blue-cream-white-front.jpg"
  already=$((already+1))
elif [ -f "assets/products/Polo Ralph Lauren Striped Cotton Knit Polo Sweater – 'Royal Blue  Cream White'.jpg" ]; then
  mv "assets/products/Polo Ralph Lauren Striped Cotton Knit Polo Sweater – 'Royal Blue  Cream White'.jpg" "assets/products/polo-rl-striped-cotton-knit-polo-sweater-royal-blue-cream-white-front.jpg"
  echo "Renamed: Polo Ralph Lauren Striped Cotton Knit Polo Sweater – 'Royal Blue  Cream White'.jpg  ->  polo-rl-striped-cotton-knit-polo-sweater-royal-blue-cream-white-front.jpg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Polo Ralph Lauren Striped Cotton Knit Polo Sweater – 'Royal Blue  Cream White'.jpg"
  missing=$((missing+1))
fi

if [ -f "assets/products/corteiz-rules-the-world-panel-hoodie-heather-grey-black-front.jpg" ]; then
  echo "OK (already renamed): corteiz-rules-the-world-panel-hoodie-heather-grey-black-front.jpg"
  already=$((already+1))
elif [ -f "assets/products/Corteiz RULES THE WORLD Panel Full-Zip Hoodie – 'Heather Grey  Black'.jpg" ]; then
  mv "assets/products/Corteiz RULES THE WORLD Panel Full-Zip Hoodie – 'Heather Grey  Black'.jpg" "assets/products/corteiz-rules-the-world-panel-hoodie-heather-grey-black-front.jpg"
  echo "Renamed: Corteiz RULES THE WORLD Panel Full-Zip Hoodie – 'Heather Grey  Black'.jpg  ->  corteiz-rules-the-world-panel-hoodie-heather-grey-black-front.jpg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Corteiz RULES THE WORLD Panel Full-Zip Hoodie – 'Heather Grey  Black'.jpg"
  missing=$((missing+1))
fi

if [ -f "assets/products/lv-damier-knit-beanie-slate-grey-pearl-white-front.jpg" ]; then
  echo "OK (already renamed): lv-damier-knit-beanie-slate-grey-pearl-white-front.jpg"
  already=$((already+1))
elif [ -f "assets/products/Louis Vuitton Damier Knit Beanie – 'Slate Grey & Pearl White'.jpg" ]; then
  mv "assets/products/Louis Vuitton Damier Knit Beanie – 'Slate Grey & Pearl White'.jpg" "assets/products/lv-damier-knit-beanie-slate-grey-pearl-white-front.jpg"
  echo "Renamed: Louis Vuitton Damier Knit Beanie – 'Slate Grey & Pearl White'.jpg  ->  lv-damier-knit-beanie-slate-grey-pearl-white-front.jpg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Louis Vuitton Damier Knit Beanie – 'Slate Grey & Pearl White'.jpg"
  missing=$((missing+1))
fi

if [ -f "assets/products/corteiz-crtz-script-skull-cap-beanie-black-white-embroidery-front.jpg" ]; then
  echo "OK (already renamed): corteiz-crtz-script-skull-cap-beanie-black-white-embroidery-front.jpg"
  already=$((already+1))
elif [ -f "assets/products/Corteiz Crtz Script Skull Cap Beanie – 'Black  White Embroidery.jpg" ]; then
  mv "assets/products/Corteiz Crtz Script Skull Cap Beanie – 'Black  White Embroidery.jpg" "assets/products/corteiz-crtz-script-skull-cap-beanie-black-white-embroidery-front.jpg"
  echo "Renamed: Corteiz Crtz Script Skull Cap Beanie – 'Black  White Embroidery.jpg  ->  corteiz-crtz-script-skull-cap-beanie-black-white-embroidery-front.jpg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Corteiz Crtz Script Skull Cap Beanie – 'Black  White Embroidery.jpg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-x-nocta-mind-001-slide-triple-white-black-front.jpeg" ]; then
  echo "OK (already renamed): nike-x-nocta-mind-001-slide-triple-white-black-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Nike x NOCTA Mind 001 Slide – 'Triple White  Black Branding'.jpeg" ]; then
  mv "assets/products/Nike x NOCTA Mind 001 Slide – 'Triple White  Black Branding'.jpeg" "assets/products/nike-x-nocta-mind-001-slide-triple-white-black-front.jpeg"
  echo "Renamed: Nike x NOCTA Mind 001 Slide – 'Triple White  Black Branding'.jpeg  ->  nike-x-nocta-mind-001-slide-triple-white-black-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike x NOCTA Mind 001 Slide – 'Triple White  Black Branding'.jpeg"
  missing=$((missing+1))
fi

if [ -f "assets/products/nike-asuna-2-slide-soft-pink-coconut-milk-front.jpeg" ]; then
  echo "OK (already renamed): nike-asuna-2-slide-soft-pink-coconut-milk-front.jpeg"
  already=$((already+1))
elif [ -f "assets/products/Nike Asuna 2 Slide – 'Soft Pink  Coconut Milk'.jpeg" ]; then
  mv "assets/products/Nike Asuna 2 Slide – 'Soft Pink  Coconut Milk'.jpeg" "assets/products/nike-asuna-2-slide-soft-pink-coconut-milk-front.jpeg"
  echo "Renamed: Nike Asuna 2 Slide – 'Soft Pink  Coconut Milk'.jpeg  ->  nike-asuna-2-slide-soft-pink-coconut-milk-front.jpeg"
  renamed=$((renamed+1))
else
  echo "MISSING -- could not find: Nike Asuna 2 Slide – 'Soft Pink  Coconut Milk'.jpeg"
  missing=$((missing+1))
fi

echo ""
echo "Done. Renamed $renamed, already done $already, missing $missing."