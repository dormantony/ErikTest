FROM osrm/osrm-backend
VOLUME [ "/data" ]
ENV pais=berlin
WORKDIR /data
RUN  apt-get update -y && \
     apt-get upgrade -y && \
     apt-get dist-upgrade -y && \
     apt-get -y autoremove && \
     apt-get clean
RUN apt-get install -y wget
RUN apt-get install zip \
    unzip \
    && rm -rf /var/lib/apt/lists/*
RUN mkdir /testo    
# RUN wget -P /testing  https://s3.amazonaws.com/arete.temporal/osrm/${pais}_data.zip
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osm.pbf
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.cell_metrics
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.cells
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.cnbg
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.cnbg_to_ebg
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.datasource_names
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.ebg
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.ebg_nodes
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.edges
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.enw
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.fileIndex
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.geometry
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.icd
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.maneuver_overrides
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.mldgr
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.names
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.nbg_nodes
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.partition
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.properties
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.ramIndex
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.restrictions
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.timestamp
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.tld
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.tls
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.turn_duration_penalties
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.turn_penalties_index
RUN wget -P /testo https://s3.amazonaws.com/arete.temporal/osrm/mexico_data/mexico-latest.osrm.turn_weight_penalties
RUN ls /testo
# RUN unzip /testing/${pais}_data.zip -d /data
CMD ["osrm-routed","-a","mld","/testo/mexico-latest.pbf"]
RUN ls /data
EXPOSE 5000`
