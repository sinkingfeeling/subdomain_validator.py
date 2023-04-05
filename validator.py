import os
import socket

# specify the domain
domain = "domain.com"

# specify the output file path
output_file = "output.txt"

# loop through 100 numbers and generate the output
with open(output_file, "w") as f:
    for i in range(1, 101):
        # format the number with leading zeros
        num = "{:03d}".format(i)
        # generate the subdomain
        subdomain = f"us-{num}.{domain}"
        # run nslookup on the subdomain
        try:
            socket.gethostbyname(subdomain)
            # write the subdomain to the output file if it resolves to an IP address
            f.write(subdomain + os.linesep)
        except socket.error:
            # do nothing if the subdomain does not resolve to an IP address
            pass
