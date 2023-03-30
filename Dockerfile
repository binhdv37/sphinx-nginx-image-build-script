FROM sphinxdoc/sphinx AS builder
LABEL author="Doan Van Binh <binh.doan@sunteco.io>"

RUN pip install myst_parser furo sphinxcontrib-mermaid sphinx_design

COPY docs /docs
WORKDIR /docs

RUN make html

FROM nginx:alpine

COPY --from=builder /docs/build/html/ /usr/share/nginx/html

