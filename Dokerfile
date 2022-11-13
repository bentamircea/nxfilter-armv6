FROM navikey/raspbian-buster

RUN apt -y update && apt -y upgrade \
  && apt -y install --no-install-recommends dnsutils iputils-ping tzdata curl \
  && curl $(printf ' -O http://pub.nxfilter.org/nxfilter-%s.deb' $(curl https://nxfilter.org/curver.php)) \
  && apt -y install --no-install-recommends ./$(printf 'nxfilter-%s.deb' $(curl https://nxfilter.org/curver.php)) \
  && apt -y clean autoclean \
  && apt -y autoremove \
  && cp -r /nxfilter/conf /nxfilter/conf.defaults \
  && rm -rf ./$(printf 'nxfilter-%s.deb' $(curl https://nxfilter.org/curver.php)) \
  && rm -rf /var/lib/apt && rm -rf /var/lib/dpkg && rm -rf /var/lib/cache && rm -rf /var/lib/log \
  && echo "$(curl https://nxfilter.org/curver.php)" > /nxfilter/version.txt \
  && wget https://cdn.azul.com/zulu-embedded/bin/zulu11.41.75-ca-jdk11.0.8-linux_aarch32hf.tar.gz \
  && mkdir /usr/lib/jvm \
  && tar -xzvf zulu11.41.75-ca-jdk11.0.8-linux_aarch32hf.tar.gz -C /usr/lib/jvm \
  && rm zulu11.41.75-ca-jdk11.0.8-linux_aarch32hf.tar.gz \
  && mkdir /var/lib/dpkg/ \
  && mkdir /var/lib/dpkg/alternatives \
  && update-alternatives --install /usr/bin/java java /usr/lib/jvm/zulu11.41.75-ca-jdk11.0.8-linux_aarch32hf/bin/java 1 \
  && update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/zulu11.41.75-ca-jdk11.0.8-linux_aarch32hf/bin/javac 1

EXPOSE 53/udp 80 443 19002 19003 19004

VOLUME ["/nxfilter/conf","/nxfilter/db","/nxfilter/log"]

COPY script/entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
