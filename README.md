# subdomain_validator.py

This Python script generates a list of subdomains where is a known format such as us-001.domain.com through us-100.domain.com and then validates each subdomain by performing a DNS lookup to check if it resolves to a valid IP address. The validated subdomains are then written to an output file. This tool can be useful for generating a list of valid subdomains for use in security testing or other applications.

# validator.html

The code is a web application that allows you to check if a list of domain names is valid. The application is written in JavaScript and uses a couple of external services to accomplish its task.

When you open the application, you'll see a simple web page with a text box and a button. To use the application, you simply enter a list of domain names, one per line, into the text box and click the button.

When you click the button, the application uses a JavaScript function called `checkDomains()` to validate the domain names. This function takes the input text, splits it into individual domain names, and sends a DNS query for each domain name to the Cloudflare DoH JSON API.

The Cloudflare DoH JSON API is an external service that provides a secure way to send DNS queries over HTTPS. When the API receives a DNS query, it looks up the corresponding IP address for the domain name and returns the result as a JSON object.

The `checkDomains()` function receives the JSON object for each DNS query and checks if it contains a valid IP address. If the JSON object contains a valid IP address, the domain name is added to a list of valid domains. Otherwise, the domain name is skipped.

Once all of the DNS queries have completed, the `checkDomains()` function updates the output text with the list of valid domain names. The output text is displayed in a separate text box below the input text box.
