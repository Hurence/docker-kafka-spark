Docker kafka-spark container file

used to build all other containers on it with latest jre 8, some dev tools enabled & kafka and spark enabled




build with th following command

.. code-block:: sh

    docker build --rm -t hurence/kafka-spark:1.0.1 .
    docker run  -it  hurence/kafka-spark:1.0.1  bash
