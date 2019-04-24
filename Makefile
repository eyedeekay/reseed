
I2P=/var/lib/i2p/i2p-config/netDb

build:
	docker build -t eyedeekay/reseed .

run: build
	docker run -itd \
		--user=i2psvc \
		--mount type=bind,source="$(I2P)",target="$(I2P)",readonly \
		--name reseed \
		-p 127.0.0.1:7843:7843 \
		eyedeekay/reseed
