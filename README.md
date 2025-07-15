# **GTM Template: Click ID to Cookie**

This is a Google Tag Manager Custom Template designed to capture common Click IDs (such as fbclid, gclid, ttclid, obclid, msclkid) from URL parameters and store them as browser cookies.  
This ensures marketing platforms like Facebook, Google Ads, TikTok, Taboola, and Microsoft Ads receive correct attribution data even when users navigate through multiple pages.

---

## 🔑 Key Features
- Supports fbclid, gclid, ttclid, obclid, msclkid, and similar click IDs.
- Stores these values as cookies with customizable expiry (7 / 15 / 30 / 90 days or custom).
- Automatically renews cookie expiry if the click ID is present again.
- Allows you to define your own cookie value prefix dynamically.
- Lightweight, fully customizable via GTM fields.

---

## 🛠 How It Works
- Captures the Click ID from the page URL (e.g., ?fbclid=XYZ)
- Stores it as a browser cookie (e.g., _fbc, _gcl_au)
- Adds a customizable prefix (e.g., fb.1., gcl.1.)
- Keeps the value fresh by resetting cookie expiry on every page view.
- Reuses existing cookies if no new Click ID is found.

---

## 🔧 Fields You Can Configure
| Field         | Purpose                             |
|---------------|-------------------------------------|
| Page Location | Source URL with query parameters     |
| Click ID      | Query parameter name (e.g., fbclid)  |
| Cookie Name   | Cookie name (e.g., _fbc, _gcl_au)    |
| Prefix        | Prefix for cookie value (e.g., fb., gcl.) |
| Cookie Lifetime | Choose between Standard (7/15/30/90 days) or Custom |

---

## 💡 Example Use Cases

| Platform | URL Parameter | Cookie Name | Example Prefix |
|----------|---------------|-------------|----------------|
| Facebook | fbclid        | _fbc        | fb.1.          |
| Google   | gclid         | _gcl_au     | gcl.1.         |
| TikTok   | ttclid        | _ttp        | ttp.1.         |
| Taboola  | obclid        | Custom      | ob.1.          |
| Bing     | msclkid       | Custom      | ms.1.          |

---

## 👨‍💻 Author  
**Alif Mahmud**  
🔗 [https://alifmahmud.com](https://alifmahmud.com) 