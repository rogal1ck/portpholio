make:
	wget http://repos.1c-bitrix.ru/yum/bitrix-env.sh
	mv bitrix-env.sh src/
	docker build --rm -t base_dbus -f src/Dockerfile.base .
	cd src && \
	docker build --rm -t a_db      -f Dockerfile.main .
	docker run --name a_db -d --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 80:80 a_db
	docker exec a_db /bin/bash /root/bitrix-env.sh
	docker exec -it a_db /bin/bash /root/menu.sh
	docker commit a_db yourbitrix
	docker rm -f a_db
	docker run --name yourbitrix -d --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -v /root/content:/root/content -p 80:80 yourbitrix
	make clean

clean:
	rm src/bitrix-env.sh
