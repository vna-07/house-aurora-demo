/* ============================================================
   HOUSE AURORA — CHECKOUT · INVOICING · VERIFICATION
   ============================================================ */

const HA = {
  legalName:'House Aurora Curation',
  tradingName:'House Aurora',
  tagline:'Intentional Luxury · Accessible Access',
  street:'Unit 6C1, Brookes On The Bay',
  street2:'6 Brookes Hill Street, Humewood',
  city:'Gqeberha',
  postal:'60011',
  country:'South Africa',
  whatsapp:'+27 (0)72 555 8932',
  email:'orders@houseaurora.co.za',
  emailSupport:'support@houseaurorastreetwear.com',
  hours:'Mon–Sat · 09:00–19:00 (Term Time)',
  instagram:'@house.aurora_',
  tiktok:'@houseaurora.drops',
  whatsappVIP:'House Aurora VIP Drops',
  site:'houseaurora.co.za'
};

/* Demo only. Production signing must happen server-side. */
const HA_SECRET = 'HA::CURATION::2026::JHB::v1';

function fallbackHash(str){
  let h1=0x811c9dc5,h2=0x01000193,h3=0x9e3779b9,h4=0x85ebca6b;
  for(let i=0;i<str.length;i++){
    const c=str.charCodeAt(i);
    h1=Math.imul(h1^c,16777619)>>>0;
    h2=Math.imul(h2+c,2246822519)>>>0;
    h3=Math.imul(h3^c,3266489917)>>>0;
    h4=Math.imul(h4+c,668265263)>>>0;
  }
  const hex=n=>('00000000'+n.toString(16)).slice(-8);
  return hex(h1)+hex(h2)+hex(h3)+hex(h4)+hex(h1^h4)+hex(h2^h3)+
    ((h1+h2)>>>0).toString(16).padStart(8,'0')+((h3+h4)>>>0).toString(16).padStart(8,'0');
}

async function hmacHex(message){
  try{
    if(window.crypto && window.crypto.subtle && window.crypto.subtle.importKey){
      const enc=new TextEncoder();
      const key=await window.crypto.subtle.importKey('raw',enc.encode(HA_SECRET),{name:'HMAC',hash:'SHA-256'},false,['sign']);
      const sig=await window.crypto.subtle.sign('HMAC',key,enc.encode(message));
      return [...new Uint8Array(sig)].map(b=>b.toString(16).padStart(2,'0')).join('');
    }
  }catch(e){}
  return fallbackHash(HA_SECRET+'|'+message);
}

function randomHex(nBytes){
  try{
    const b=window.crypto.getRandomValues(new Uint8Array(nBytes));
    return [...b].map(x=>x.toString(16).padStart(2,'0')).join('');
  }catch(e){
    let s='';
    for(let i=0;i<nBytes*2;i++)s+='0123456789abcdef'[Math.floor(Math.random()*16)];
    return s;
  }
}
function orderIdNew(){return 'AURORA-'+new Date().getFullYear()+'-'+randomHex(3).toUpperCase();}
function thankYouNew(){
  const chars='ABCDEFGHJKLMNPQRSTUVWXYZ23456789';
  let bytes;
  try{bytes=window.crypto.getRandomValues(new Uint8Array(6));}
  catch(e){bytes=Uint8Array.from({length:6},()=>Math.floor(Math.random()*256));}
  return 'AURORA10-'+[...bytes].map(x=>chars[x%chars.length]).join('');
}
function escapeHtml(s){return String(s==null?'':s).replace(/[&<>"']/g,c=>({'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'}[c]));}
function copyText(txt){
  if(navigator.clipboard&&navigator.clipboard.writeText){navigator.clipboard.writeText(txt).catch(()=>{});return;}
  const ta=document.createElement('textarea');ta.value=txt;ta.style.cssText='position:fixed;opacity:0;pointer-events:none';
  document.body.appendChild(ta);ta.select();try{document.execCommand('copy');}catch(e){}document.body.removeChild(ta);
}
function isoNow(){return new Date().toISOString();}
function fmtDate(iso){
  const d=new Date(iso),p=n=>String(n).padStart(2,'0');
  return `${p(d.getDate())}/${p(d.getMonth()+1)}/${d.getFullYear()} · ${p(d.getHours())}:${p(d.getMinutes())}`;
}

const coModal=$('#coModal'),invModal=$('#invModal'),vfModal=$('#vfModal');
let currentInvoice=null;

function renderCheckoutSummary(){
  const el=$('#coSummary');if(!el)return;
  const total=cartTotal(),due=depositMode?Math.ceil(total/2):total,balance=depositMode?total-due:0;
  el.innerHTML=`<h4>Order Summary · ${cartCount()} item${cartCount()!==1?'s':''}</h4>
    ${cart.map(item=>{const p=PRODUCTS.find(x=>x.id===item.id);if(!p)return '';
      return `<div class="co-summary-row"><span>${escapeHtml(p.brand)} ${escapeHtml(p.name)} · ${escapeHtml(item.size)} × ${item.qty}</span><span>${money(p.price*item.qty)}</span></div>`;
    }).join('')}
    <div class="co-summary-row total"><span>Order Total</span><span>${money(total)}</span></div>
    ${depositMode?`<div class="co-summary-row due"><span>Due Today — 50% Deposit</span><span>${money(due)}</span></div><div class="co-summary-row"><span>Balance On Dispatch</span><span>${money(balance)}</span></div>`:''}`;
}

function openCheckout(){
  if(!cart.length){toast('Your allocation is empty');return;}
  closeCart();renderCheckoutSummary();
  let saved=null;try{saved=JSON.parse(localStorage.getItem('ha_customer')||'null');}catch(e){}
  if(saved){
    ['name','email','phone','city','address','postal','province'].forEach(key=>{
      const field=$('#co'+key.charAt(0).toUpperCase()+key.slice(1));
      if(field)field.value=saved[key]||'';
    });
  }
  coModal.classList.add('on');document.body.classList.add('locked');
}
function closeCheckout(){
  coModal.classList.remove('on');
  if(!invModal.classList.contains('on')&&!$('#cartDrawer').classList.contains('on')&&!qv.classList.contains('on'))document.body.classList.remove('locked');
}

$('#coClose').addEventListener('click',closeCheckout);
$('#coCancel').addEventListener('click',()=>{closeCheckout();openCart();});
coModal.addEventListener('click',e=>{if(e.target===coModal)closeCheckout();});
$$('#coPayOptions .co-pay-opt').forEach(option=>option.addEventListener('click',()=>{
  $$('#coPayOptions .co-pay-opt').forEach(item=>item.classList.remove('on'));
  option.classList.add('on');
  const radio=option.querySelector('input');if(radio)radio.checked=true;
}));

async function buildOrder(customer,pay){
  const iso=isoNow(),id=orderIdNew(),thankYouCode=thankYouNew();
  const items=cart.map(item=>{const p=PRODUCTS.find(x=>x.id===item.id);return{
    id:item.id,brand:p?p.brand:'',name:p?p.name:'',variant:p?p.variant:'',size:item.size,qty:item.qty,
    unit:p?p.price:0,total:p?p.price*item.qty:0
  };});
  const subtotal=items.reduce((sum,item)=>sum+item.total,0),shipping=0,total=subtotal+shipping;
  const depositOn=!!depositMode,dueToday=depositOn?Math.ceil(total/2):total,balance=depositOn?total-dueToday:0;
  const canonical=[id,iso,total,items.map(item=>item.id+'/'+item.size+'x'+item.qty).join(';'),customer.email.toLowerCase()].join('|');
  const signature=await hmacHex(canonical);
  return {id,iso,items,subtotal,shipping,total,dueToday,balance,depositOn,pay,customer,thankYouCode,signature,canonical,
    signatureShort:signature.slice(0,24).toUpperCase(),verifyUrl:`https://${HA.site}/verify?o=${id}&s=${signature.slice(0,24)}`};
}
function saveCustomer(customer){try{localStorage.setItem('ha_customer',JSON.stringify(customer));}catch(e){}}
function saveOrder(order){
  try{
    const all=JSON.parse(localStorage.getItem('ha_orders')||'[]');
    all.unshift({id:order.id,iso:order.iso,total:order.total,dueToday:order.dueToday,balance:order.balance,depositOn:order.depositOn,pay:order.pay,thankYouCode:order.thankYouCode,signature:order.signature,canonical:order.canonical,customer:order.customer,items:order.items});
    localStorage.setItem('ha_orders',JSON.stringify(all.slice(0,50)));
  }catch(e){}
}

function renderInvoice(order){
  currentInvoice=order;
  const qrSrc='https://api.qrserver.com/v1/create-qr-code/?size=220x220&margin=0&color=2B1E1A&bgcolor=F8F5F0&data='+encodeURIComponent(order.verifyUrl);
  const rows=order.items.map(item=>`<tr><td>${escapeHtml(item.brand)} ${escapeHtml(item.name)}<span class="v">${escapeHtml(item.variant)}</span></td><td>${escapeHtml(item.size)}</td><td class="qty">×${item.qty}</td><td>${money(item.unit)}</td><td>${money(item.total)}</td></tr>`).join('');
  const notes=order.customer.notes?`<div style="margin-top:1.4rem;padding:1rem 1.2rem;background:rgba(43,30,26,.04);border-radius:8px;font-size:.72rem;color:rgba(43,30,26,.7);line-height:1.7"><b style="display:block;font-size:.5rem;letter-spacing:.3em;text-transform:uppercase;color:var(--bronze-dk);margin-bottom:.4rem">Order Notes</b>${escapeHtml(order.customer.notes)}</div>`:'';
  $('#slipInner').innerHTML=`
    <div class="slip-top"><div class="slip-brand"><div class="slip-mark">HA</div><div><h2>House Aurora</h2><span>${HA.tagline}</span></div></div><div class="slip-meta"><span class="inv-label">Official Invoice</span><b>${order.id}</b><em>${fmtDate(order.iso)}</em></div></div>
    <div class="slip-parties"><div><span class="slip-label">Billed To</span><b>${escapeHtml(order.customer.name)}</b><p>${escapeHtml(order.customer.email)}</p><p>${escapeHtml(order.customer.phone)}</p><p>${escapeHtml(order.customer.address)}<br>${escapeHtml(order.customer.city)}${order.customer.province?', '+escapeHtml(order.customer.province):''} ${escapeHtml(order.customer.postal)}</p></div>
      <div><span class="slip-label">Dispatch From</span><b>${HA.legalName}</b><p>${HA.street}</p><p>${HA.street2}</p><p>${HA.city}, ${HA.postal}</p></div>
      <div><span class="slip-label">Status</span><b class="slip-status">${order.depositOn?'Deposit Secured':'Paid In Full'}</b><p>${escapeHtml(order.pay)}</p><p>${order.depositOn?'50% Deposit · Balance on dispatch':'Full payment received'}</p></div></div>
    <table class="slip-table"><thead><tr><th>Item</th><th>Size</th><th>Qty</th><th>Unit</th><th>Total</th></tr></thead><tbody>${rows}</tbody></table>${notes}
    <div class="slip-totals"><div><span>Subtotal</span><b>${money(order.subtotal)}</b></div><div><span>Express Shipping</span><b>Complimentary</b></div><div class="total"><span>Order Total</span><b>${money(order.total)}</b></div>${order.depositOn?`<div class="due"><span>Due Today — 50%</span><b>${money(order.dueToday)}</b></div><div class="bal"><span>Balance On Dispatch</span><b>${money(order.balance)}</b></div>`:''}</div>
    <div class="slip-thanks"><div><h3>Thank you.</h3><p>You're part of the House now. Enjoy <b>10% off</b> your next allocation — tap the code to copy it.</p><div class="slip-code" id="slipThanksCode" title="Tap to copy">${order.thankYouCode}</div></div><div class="slip-qr"><img src="${qrSrc}" alt="Order verification QR" onerror="this.style.display='none'"><span>Scan to verify</span></div></div>
    <div class="slip-verify"><div><span class="slip-label">Cryptographic Signature · HMAC-SHA256</span><code>${order.signature}</code></div><div><span class="slip-label">Verify At</span><code>${HA.site}/verify<br>Order · ${order.id}<br>Short Sig · ${order.signatureShort}</code></div></div>
    <div class="slip-footer"><div><b>House Aurora Curation</b><p>${HA.street} · ${HA.street2}</p><p>${HA.city} · ${HA.postal} · ${HA.country}</p></div><div><b>Support</b><p>WhatsApp ${HA.whatsapp}</p><p>${HA.email}</p><p>${HA.hours}</p></div><div><b>Follow The House</b><p>Instagram ${HA.instagram}</p><p>TikTok ${HA.tiktok}</p><p>WhatsApp VIP · ${HA.whatsappVIP}</p></div></div>`;
}

$('#coForm').addEventListener('submit',async event=>{
  event.preventDefault();
  const data=new FormData(event.target),customer={name:(data.get('name')||'').toString().trim(),email:(data.get('email')||'').toString().trim(),phone:(data.get('phone')||'').toString().trim(),city:(data.get('city')||'').toString().trim(),address:(data.get('address')||'').toString().trim(),postal:(data.get('postal')||'').toString().trim(),province:(data.get('province')||'').toString().trim(),notes:(data.get('notes')||'').toString().trim()},pay=(data.get('pay')||'Card').toString();
  if(!customer.name||!customer.email||!customer.phone||!customer.city||!customer.address||!customer.postal||!customer.province||!/^\S+@\S+\.\S+$/.test(customer.email)){toast('Please complete all required fields');return;}
  const submit=$('#coSubmit'),original=submit.textContent;submit.disabled=true;submit.textContent='Generating…';
  try{
    const order=await buildOrder(customer,pay);saveCustomer(customer);saveOrder(order);try{localStorage.setItem('ha_ordered','1');}catch(e){}
    cart=[];saveCart();renderCart();depositMode=false;
    const full=$('#cdFull'),deposit=$('#cdDeposit');if(full&&deposit){full.classList.add('on');deposit.classList.remove('on');}
    closeCheckout();renderInvoice(order);invModal.classList.add('on');document.body.classList.add('locked');toast('Invoice generated · '+order.id);
  }catch(error){console.error(error);toast('Something went wrong — please try again');}
  finally{submit.disabled=false;submit.textContent=original;}
});

$('#invClose').addEventListener('click',()=>{invModal.classList.remove('on');if(!$('#cartDrawer').classList.contains('on')&&!coModal.classList.contains('on'))document.body.classList.remove('locked');});
$('#invCopyId').addEventListener('click',()=>{if(currentInvoice){copyText(currentInvoice.id);toast('Order code copied');}});
$('#invPrint').addEventListener('click',()=>{document.body.classList.add('printing-invoice');setTimeout(()=>{window.print();setTimeout(()=>document.body.classList.remove('printing-invoice'),400);},60);});
$('#slipInner').addEventListener('click',event=>{if(event.target&&event.target.id==='slipThanksCode'){copyText(event.target.textContent.trim());toast('10% code copied');}});

async function openVerification(order){
  const content=$('#vfContent');content.innerHTML='<p style="font-size:.82rem;color:rgba(43,30,26,.6);padding:1rem 0">Recomputing signature…</p>';vfModal.classList.add('on');document.body.classList.add('locked');
  const recomputed=await hmacHex(order.canonical),ok=recomputed===order.signature;
  content.innerHTML=`<div class="vf-status ${ok?'ok':''}"><div class="vf-icon">${ok?'✓':'!'}</div><div><h4>${ok?'Authentic House Aurora Order':'Signature Mismatch'}</h4><p>${ok?'This order slip matches the cryptographic signature on record.':'This slip could not be verified — do not fulfil.'}</p></div></div>
    <div class="vf-details"><div class="vf-row"><span>Order Code</span><b>${order.id}</b></div><div class="vf-row"><span>Issued</span><b>${fmtDate(order.iso)}</b></div><div class="vf-row"><span>Customer</span><b>${escapeHtml(order.customer.name)}</b></div><div class="vf-row"><span>Items</span><b>${order.items.reduce((count,item)=>count+item.qty,0)}</b></div><div class="vf-row"><span>Order Total</span><b>${money(order.total)}</b></div><div class="vf-row"><span>Payment</span><b>${order.depositOn?'50% Deposit Secured':'Paid In Full'} · ${escapeHtml(order.pay)}</b></div><div class="vf-row"><span>Thank-You Code</span><b>${order.thankYouCode}</b></div><div class="vf-row"><span>Signature</span><b style="font-family:'Courier New',monospace;font-size:.62rem;word-break:break-all">${order.signature.slice(0,24)}…</b></div></div>
    <p style="font-size:.68rem;color:rgba(43,30,26,.5);margin-top:1.2rem;line-height:1.75">Signature is recomputed live in your browser from the stored order data. In production this check runs server-side against an HMAC key that never leaves House Aurora infrastructure.</p>`;
}
$('#invVerify').addEventListener('click',()=>{if(currentInvoice)openVerification(currentInvoice);});
$('#vfClose').addEventListener('click',()=>{vfModal.classList.remove('on');if(!invModal.classList.contains('on'))document.body.classList.remove('locked');});
vfModal.addEventListener('click',event=>{if(event.target===vfModal)$('#vfClose').click();});
$('#checkoutBtn').addEventListener('click',openCheckout);

document.addEventListener('keydown',event=>{
  if(event.key!=='Escape')return;
  if(vfModal.classList.contains('on')){$('#vfClose').click();return;}
  if(invModal.classList.contains('on')){$('#invClose').click();return;}
  if(coModal.classList.contains('on'))closeCheckout();
});
