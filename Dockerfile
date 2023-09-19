FROM jekyll/jekyll:4
WORKDIR /app
RUN chmod a+w . # HACK
COPY Gemfile .
RUN bundle install 
COPY . .
RUN jekyll build
VOLUME /output
CMD ["tar", "-czf", "/output/site.tar.gz", "_site"]
