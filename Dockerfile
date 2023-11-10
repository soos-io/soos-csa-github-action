FROM soosio/csa

USER ROOT
COPY check_version.py /check_version.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["-h"]