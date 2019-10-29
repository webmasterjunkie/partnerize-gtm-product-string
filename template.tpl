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
  "categories": [
    "UTILITY",
    "TAG_MANAGEMENT"
  ],
  "displayName": "Partnerize Item String",
  "description": "Create a formatted string of product details. This will conform values to the required Partnerize item level format.",
  "containerContexts": [
    "WEB"
  ],
  "brand": {
    "displayName": "Partnerize",
    "id": "github.com_webmasterjunkie"
  }
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "helpText",
    "displayName": "Use this variable to turn an array of product details (e.g. <strong>[{'Product Name': 'Shoes', 'Price': 123.99},{'Product Name': 'Hats', 'Price': 12.99}]</strong>) into the Partnerize formatted item string."
  },
  {
    "type": "SELECT",
    "name": "inputArray",
    "displayName": "Product Array Variable",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true
  },
  {
    "type": "LABEL",
    "name": "helpText2",
    "displayName": "If the names of the product variables need to be renamed, you can assign them here. (e.g. <strong>Product Name => category</strong>)"
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "valueMapping",
    "displayName": "Map Product Names",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Key Name",
        "name": "customParameters",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Partnerize Name",
        "name": "customValues",
        "type": "SELECT",
        "selectItems": [
          {
            "value": "category",
            "displayValue": "Category"
          },
          {
            "value": "sku",
            "displayValue": "SKU"
          },
          {
            "value": "value",
            "displayValue": "Item Value"
          },
          {
            "value": "quantity",
            "displayValue": "Quantity"
          }
        ]
      }
    ],
    "help": "Map the names of your product values to the appropriate Partnerize key for tracking."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const encodeUriComponent = require('encodeUriComponent');

const inputArray = data.inputArray;
const productMapping = data.valueMapping;
let productString = '';

/*
Remove any characters that could cause issues with the Partnerize parameter
customParameters 	string 	The value from the data object
return 				string	The value that is cleaned as a parameter name
*/
function formatParameter(customParameters){
  	const regex = "/[^A-Za-z0-9_]/";
	const mappedName = checkParameterMapping(customParameters);

	let string = mappedName.replace(' ', '_');

	return string.replace(regex, '', string).toLowerCase();
}

function checkParameterMapping(customParameters){
	let paramName = '';
	productMapping.forEach(function(element) {
		if (element.customParameters === customParameters){
			paramName = element.customValues;
		}
	});

  	if (paramName === ''){
		paramName = customParameters;
    }

  	return paramName;
}

if (typeof inputArray === 'object'){
    inputArray.forEach(function(element) {
      	productString = productString + '[';
		for (let key in element){
			productString = productString + '/' + formatParameter(key) + ':' + encodeUriComponent(element[key].toString());
        }
      	productString = productString + ']';
    });
}

return productString;


___NOTES___

Created on 28/10/2019, 10:54:06
