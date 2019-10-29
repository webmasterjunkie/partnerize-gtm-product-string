# Partnerize GTM Product String
If your GTM setup uses a custom dataLayer structure and a custom HTML image for tracking, this variable will allow you to convert your products into the required format for Partnerize tracking.
# Example
Your GTM variable:
```
[{"Product Name": "Big Shoes", "Price": 32.99},{"Product Name": "Big Hats", "Price": 12.99}]
```

This custom variable will take the incoming array, and convert it to the formatted string:
```
[/category:Big%20Shoes/value:32.99][/category:Big%20Hats/value:12.99]
```
## Screenshot
![](https://github.com/webmasterjunkie/partnerize-gtm-product-string/blob/master/assets/screenshot.png)
