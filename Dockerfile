FROM odoo:19.0

# Install git
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Create addons directory
RUN mkdir -p /mnt/extra-addons

# Clone and copy addons using environment variable for token
ARG GITHUB_TOKEN
RUN git clone https://${GITHUB_TOKEN}@github.com/ahmedhd123/fmoh.git /tmp/fmoh && \
    cp -r /tmp/fmoh/ac_correspondence /mnt/extra-addons/ && \
    cp -r /tmp/fmoh/dashboard_pro /mnt/extra-addons/ && \
    rm -rf /tmp/fmoh && \
    chown -R odoo:odoo /mnt/extra-addons

