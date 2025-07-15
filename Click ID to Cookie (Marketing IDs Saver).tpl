___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Click ID to Cookie (Marketing IDs Saver)",
  "description": "Capture click IDs (fbclid, gclid, etc.) from URLs and store them as cookies for accurate marketing attribution with custom lifetime options.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "pageLocation",
    "displayName": "Page Location",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "clickId",
    "displayName": "Click ID",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "cookieName",
    "displayName": "Cookie Name",
    "simpleValueType": true
  },
  {
    "type": "RADIO",
    "name": "standard",
    "displayName": "Cookie Lifetime",
    "radioItems": [
      {
        "value": "cookieLifeTimeStandard",
        "displayValue": "Standard",
        "subParams": [
          {
            "type": "SELECT",
            "name": "standardDays",
            "displayName": "",
            "macrosInSelect": false,
            "selectItems": [
              {
                "value": "sevenDays",
                "displayValue": "7 Days"
              },
              {
                "value": "fifteenDays",
                "displayValue": "15 Days"
              },
              {
                "value": "thirtyDays",
                "displayValue": "30 Days"
              },
              {
                "value": "ninetyDays",
                "displayValue": "90 Days"
              }
            ],
            "simpleValueType": true,
            "defaultValue": "ninetyDays"
          }
        ]
      },
      {
        "value": "cookieLifeTimeCustom",
        "displayValue": "Custom",
        "subParams": [
          {
            "type": "TEXT",
            "name": "customDays",
            "displayName": "",
            "simpleValueType": true
          }
        ]
      }
    ],
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_SERVER___

const setCookie = require('setCookie');
const getCookieValues = require('getCookieValues');
const logToConsole = require('logToConsole');
const makeNumber = require('makeNumber');
const getTimestamp = require('getTimestamp');

const pageLocation = data.pageLocation; // Full URL must come from this variable.
const clickId = data.clickId;
const cookieName = data.cookieName; // This must be just the cookie name, not a URL.

const cookieLifetimeOption = data.cookieLifetime;
let days = 90; // Default to 90 days

// Determine expiry days
if (cookieLifetimeOption === 'cookieLifeTimeStandard') {
    if (data.standardDays === 'sevenDays') days = 7;
    if (data.standardDays === 'fifteenDays') days = 15;
    if (data.standardDays === 'thirtyDays') days = 30;
    if (data.standardDays === 'ninetyDays') days = 90;
} else if (cookieLifetimeOption === 'cookieLifeTimeCustom') {
    days = makeNumber(data.customDays) || 90;
}

const expiryMs = days * 24 * 60 * 60 * 1000;

function getQueryParam(url, key) {
    const queryString = url.split('?')[1] || '';
    const params = queryString.split('&');
    for (let i = 0; i < params.length; i++) {
        const parts = params[i].split('=');
        if (parts[0] === key) {
            return parts[1];
        }
    }
    return null;
}

const fbcParam = getQueryParam(pageLocation, clickId);

let cookieValue;

if (fbcParam) {
    cookieValue = 'fb.1.' + getTimestamp() + '.' + fbcParam;
    setCookie(cookieName, cookieValue, {
        path: '/',
        'max-age': expiryMs / 1000
    });
} else {
    const existingCookie = getCookieValues(cookieName)[0];
    if (existingCookie) {
        cookieValue = existingCookie;
        setCookie(cookieName, existingCookie, {
            path: '/',
            'max-age': expiryMs / 1000
        });
    }
}

logToConsole('Returning cookie:', cookieValue);
return cookieValue || '';


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "get_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "cookieAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "set_cookies",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedCookies",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "name"
                  },
                  {
                    "type": 1,
                    "string": "domain"
                  },
                  {
                    "type": 1,
                    "string": "path"
                  },
                  {
                    "type": 1,
                    "string": "secure"
                  },
                  {
                    "type": 1,
                    "string": "session"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "*"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  },
                  {
                    "type": 1,
                    "string": "any"
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 15/07/2025, 23:54:56


