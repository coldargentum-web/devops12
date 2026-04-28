FROM fluent/fluentd:v1.16-debian-1
USER root
# Видаляємо стару версію і ставимо сумісну
RUN gem uninstall -I elasticsearch && \
    gem install elasticsearch -v 7.17.0 && \
    gem install fluent-plugin-elasticsearch --no-document --version 5.2.4
USER fluent