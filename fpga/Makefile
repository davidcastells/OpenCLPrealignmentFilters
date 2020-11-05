all: basic_ap_uint.h shd.cl shouji.cl

clean:
	rm -f basic_ap_uint.h
	rm -f /tmp/basic_ap_uint.h.metaprogram.cpp
	rm -f /tmp/basic_ap_uint.h.generator

basic_ap_uint.h: /tmp/basic_ap_uint.h.generator
	/tmp/basic_ap_uint.h.generator > basic_ap_uint.h

/tmp/basic_ap_uint.h.generator: /tmp/basic_ap_uint.h.generator.cpp
	g++ /tmp/basic_ap_uint.h.generator.cpp -o /tmp/basic_ap_uint.h.generator

/tmp/basic_ap_uint.h.generator.cpp: basic_ap_uint.h.metaprogram metagenerator
	./metagenerator basic_ap_uint.h.metaprogram > /tmp/basic_ap_uint.h.generator.cpp

metagenerator: metagenerator.cpp
	g++ metagenerator.cpp -o metagenerator

shd.cl: /tmp/shd.cl.generator
	/tmp/shd.cl.generator > shd.cl

/tmp/shd.cl.generator: /tmp/shd.cl.generator.cpp
	g++ /tmp/shd.cl.generator.cpp -o /tmp/shd.cl.generator

/tmp/shd.cl.generator.cpp: shd.cl.metaprogram
	./metagenerator shd.cl.metaprogram > /tmp/shd.cl.generator.cpp


shouji.cl: /tmp/shouji.cl.generator
	/tmp/shouji.cl.generator > shouji.cl

/tmp/shouji.cl.generator: /tmp/shouji.cl.generator.cpp
	g++ /tmp/shouji.cl.generator.cpp -o /tmp/shouji.cl.generator

/tmp/shouji.cl.generator.cpp: shouji.cl.metaprogram
	./metagenerator shouji.cl.metaprogram > /tmp/shouji.cl.generator.cpp

