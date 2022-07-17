# nekopon.pl
server {
	listen unix:/var/run/www.sock;
	server_name nekopon.pl www.nekopon.pl nekoponmvppnutba7awvelxayxoutkolpplmmp7mxmfrobswqkbi5kad.onion;

	root /var/www/htdocs/nekopon.pl;

	include snippets/security-headers.conf;
	add_header Cross-Origin-Resource-Policy "same-origin" always;
	add_header Permissions-Policy "accelerometer=(), ambient-light-sensor=(), autoplay=(), battery=(), camera=(), clipboard-read=(), clipboard-write=(), display-capture=(), document-domain=(), encrypted-media=(), fullscreen=(), geolocation=(), gyroscope=(), hid=(), idle-detection=(), interest-cohort=(), magnetometer=(), microphone=(), midi=(), payment=(), picture-in-picture=(), publickey-credentials-get=(), screen-wake-lock=(), serial=(), sync-xhr=(), xr-spatial-tracking=()" always;
	# Google's web.dev/measure, Lighthouse and scrapers won't be able to use robots.txt with connect-src 'none'. Sad.
	add_header Content-Security-Policy "default-src 'none'; child-src 'none'; connect-src 'self'; font-src 'none'; img-src 'self'; manifest-src 'none'; script-src 'self'; style-src 'self'; form-action 'none'; frame-ancestors 'none'; block-all-mixed-content; base-uri 'none'" always;
	add_header Onion-Location http://nekoponmvppnutba7awvelxayxoutkolpplmmp7mxmfrobswqkbi5kad.onion$request_uri;

	location / { try_files $uri $uri/ =404; }

	location ~ "\.webp$" {
		include snippets/security-headers.conf;
		# avoid breaking image hotlinking such as https://github.com/TryGhost/Ghost/issues/12880
		add_header Cross-Origin-Resource-Policy "cross-origin" always;
		add_header Permissions-Policy "accelerometer=(), ambient-light-sensor=(), autoplay=(), battery=(), camera=(), clipboard-read=(), clipboard-write=(), display-capture=(), document-domain=(), encrypted-media=(), fullscreen=(), geolocation=(), gyroscope=(), hid=(), idle-detection=(), interest-cohort=(), magnetometer=(), microphone=(), midi=(), payment=(), picture-in-picture=(), publickey-credentials-get=(), screen-wake-lock=(), serial=(), sync-xhr=(), xr-spatial-tracking=()" always;
		add_header Content-Security-Policy "default-src 'none'; child-src 'none'; connect-src 'self'; font-src 'none'; img-src 'self'; manifest-src 'none'; script-src 'none'; style-src 'none'; form-action 'none'; frame-ancestors 'none'; block-all-mixed-content; base-uri 'none'" always;
		add_header Onion-Location http://nekoponmvppnutba7awvelxayxoutkolpplmmp7mxmfrobswqkbi5kad.onion$request_uri;
	}

	location /assets/img/gravatar.png {
		include snippets/security-headers.conf;
		# avoid breaking image hotlinking such as https://github.com/TryGhost/Ghost/issues/12880
		add_header Cross-Origin-Resource-Policy "cross-origin" always;
		add_header Permissions-Policy "accelerometer=(), ambient-light-sensor=(), autoplay=(), battery=(), camera=(), clipboard-read=(), clipboard-write=(), display-capture=(), document-domain=(), encrypted-media=(), fullscreen=(), geolocation=(), gyroscope=(), hid=(), idle-detection=(), interest-cohort=(), magnetometer=(), microphone=(), midi=(), payment=(), picture-in-picture=(), publickey-credentials-get=(), screen-wake-lock=(), serial=(), sync-xhr=(), xr-spatial-tracking=()" always;
		add_header Content-Security-Policy "default-src 'none'; child-src 'none'; connect-src 'self'; font-src 'none'; img-src 'self'; manifest-src 'none'; script-src 'none'; style-src 'none'; form-action 'none'; frame-ancestors 'none'; block-all-mixed-content; base-uri 'none'" always;
		add_header Onion-Location http://nekoponmvppnutba7awvelxayxoutkolpplmmp7mxmfrobswqkbi5kad.onion$request_uri;

		proxy_pass https://secure.gravatar.com/avatar/b1ba96bc4847f45193a62856d3592063;
		proxy_pass_request_headers off;
		proxy_buffering on;
		proxy_cache static;
		proxy_ignore_headers Cache-Control;
		proxy_ignore_headers Expires;
		proxy_hide_header Cache-Control;
		proxy_hide_header Expires;
	}
}
