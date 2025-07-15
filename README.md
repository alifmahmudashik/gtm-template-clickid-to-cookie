# **GTM Template: Click ID to Cookie**

This is a **Google Tag Manager Custom Template** designed to capture common Click IDs (such as **fbclid**, **gclid**, **ttclid**, **obclid**, **msclkid**) from the URL parameters and store them as browser cookies.  
This helps ensure marketing platforms like **Facebook, Google Ads, TikTok, Taboola, and Microsoft Ads** receive correct attribution data, even if the user navigates through multiple pages.

---

## **🚀 Key Features**
- Supports **fbclid**, **gclid**, **ttclid**, **obclid**, **msclkid** and similar click IDs.
- Stores these values as cookies with customizable expiry (**7 / 15 / 30 / 90 days or custom**).
- Automatically renews cookie expiry if the click ID is present again.
- Lightweight, fully customizable via GTM fields.

---

## **🔧 How It Works**
- Captures the click ID from the page URL (e.g., `?fbclid=XYZ`)
- Saves it as a browser cookie (e.g., `_fbc`, `_gcl_au`, etc.)
- Keeps the value fresh by resetting cookie expiry on every page view.
- If no new click ID exists, reuses the existing cookie.

---

## **📄 Fields You Can Configure**
- **Page Location:** Source for URL parameters
- **Click ID:** The parameter name (e.g., fbclid)
- **Cookie Name:** The name to store it as (e.g., _fbc)
- **Cookie Lifetime:** Choose between Standard (7/15/30/90 days) or Custom

---

## **📊 Example Use Cases**

| Platform | URL Parameter | Cookie Name |
|----------|---------------|-------------|
| Facebook | `fbclid`      | `_fbc`      |
| Google   | `gclid`       | `_gcl_au`   |
| TikTok   | `ttclid`      | `_ttp`      |
| Taboola  | `obclid`      | Custom      |
| Bing     | `msclkid`     | Custom      |

---

## **👨‍💻 Author**
**Alif Mahmud**  
[https://alifmahmud.com](https://alifmahmud.com)  

---