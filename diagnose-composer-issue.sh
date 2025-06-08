#!/bin/bash

echo "=== Diagnosing composer module issue ==="

echo "1. Checking the actual content of topicThumbs.js in the container:"
echo "---"
docker exec guaptalk_app head -n 10 /usr/src/app/public/src/modules/topicThumbs.js

echo ""
echo "2. Checking if composer module exists:"
echo "---"
docker exec guaptalk_app ls -la /usr/src/app/build/public/src/modules/composer.js 2>/dev/null || echo "composer.js not found in build directory"

echo ""
echo "3. Checking the plugin directory:"
echo "---"
docker exec guaptalk_app ls -la /usr/src/app/node_modules/nodebb-plugin-composer-default/static/lib/composer.js 2>/dev/null || echo "composer plugin not found"

echo ""
echo "4. Let's manually fix the file with the correct content:"
echo "---"
docker exec guaptalk_app sh -c "cat > /usr/src/app/public/src/modules/topicThumbs.js << 'ENDOFFILE'
'use strict';

define('topicThumbs', [
	'api', 'bootbox', 'alerts', 'uploader', 'benchpress', 'translator', 'composer', 'jquery-ui/widgets/sortable',
], function (api, bootbox, alerts, uploader, Benchpress, translator, composer) {
	const Thumbs = {};

	Thumbs.get = id => api.get(\\\`/topics/\\\${id}/thumbs\\\`, { thumbsOnly: 1 });

	Thumbs.getByPid = pid => api.get(\\\`/posts/\\\${encodeURIComponent(pid)}\\\`, {}).then(post => Thumbs.get(post.tid));

	Thumbs.delete = (id, path) => api.del(\\\`/topics/\\\${id}/thumbs\\\`, {
		path: path,
	});

	Thumbs.deleteAll = (id) => {
		Thumbs.get(id).then((thumbs) => {
			Promise.all(thumbs.map(thumb => Thumbs.delete(id, thumb.url)));
		});
	};

	Thumbs.upload = id => new Promise((resolve) => {
		uploader.show({
			title: '[[topic:composer.thumb-title]]',
			method: 'put',
			route: config.relative_path + \\\`/api/v3/topics/\\\${id}/thumbs\\\`,
		}, function (url) {
			resolve(url);
		});
	});

	Thumbs.modal = {};

	Thumbs.modal.open = function (payload) {
		const { id, pid } = payload;
		let { modal } = payload;
		let numThumbs;

		return new Promise((resolve) => {
			Promise.all([
				Thumbs.get(id),
				pid ? Thumbs.getByPid(pid) : [],
			]).then(results => new Promise((resolve) => {
				const thumbs = results.reduce((memo, cur) => memo.concat(cur));
				numThumbs = thumbs.length;

				resolve(thumbs);
			})).then(thumbs => Benchpress.render('modals/topic-thumbs', { thumbs })).then((html) => {
				if (modal) {
					translator.translate(html, function (translated) {
						modal.find('.bootbox-body').html(translated);
						Thumbs.modal.handleSort({ modal, numThumbs });
					});
				} else {
					modal = bootbox.dialog({
						title: '[[modules:thumbs.modal.title]]',
						message: html,
						onEscape: true,
						backdrop: true,
						buttons: {
							add: {
								label: '<i class=\"fa fa-plus\"></i> [[modules:thumbs.modal.add]]',
								className: 'btn-success',
								callback: () => {
									Thumbs.upload(id).then(() => {
										Thumbs.modal.open({ ...payload, modal });
										composer.updateThumbCount(id, \\\$(\\\`[component=\"composer\"][data-uuid=\"\\\${id}\"]\\\`));
										resolve();
									});
									return false;
								},
							},
							close: {
								label: '[[global:close]]',
								className: 'btn-primary',
							},
						},
					});
					Thumbs.modal.handleDelete({ ...payload, modal });
					Thumbs.modal.handleSort({ modal, numThumbs });
				}
			});
		});
	};

	Thumbs.modal.handleDelete = (payload) => {
		const modalEl = payload.modal.get(0);
		const { id: uuid } = payload;
		modalEl.addEventListener('click', (ev) => {
			if (ev.target.closest('button[data-action=\"remove\"]')) {
				bootbox.confirm('[[modules:thumbs.modal.confirm-remove]]', (ok) => {
					if (!ok) {
						return;
					}

					const id = ev.target.closest('[data-id]').getAttribute('data-id');
					const path = ev.target.closest('[data-path]').getAttribute('data-path');
					api.del(\\\`/topics/\\\${id}/thumbs\\\`, {
						path: path,
					}).then(() => {
						Thumbs.modal.open(payload);
						composer.updateThumbCount(uuid, \\\$(\\\`[component=\"composer\"][data-uuid=\"\\\${uuid}\"]\\\`));
					}).catch(alerts.error);
				});
			}
		});
	};

	Thumbs.modal.handleSort = ({ modal, numThumbs }) => {
		if (numThumbs > 1) {
			const selectorEl = modal.find('.topic-thumbs-modal');
			selectorEl.sortable({
				items: '[data-id]',
			});
			selectorEl.on('sortupdate', Thumbs.modal.handleSortChange);
		}
	};

	Thumbs.modal.handleSortChange = (ev, ui) => {
		const items = ui.item.get(0).parentNode.querySelectorAll('[data-id]');
		Array.from(items).forEach((el, order) => {
			const id = el.getAttribute('data-id');
			let path = el.getAttribute('data-path');
			path = path.replace(new RegExp(\\\`^\\\${config.upload_url}\\\`), '');

			api.put(\\\`/topics/\\\${id}/thumbs/order\\\`, { path, order }).catch(alerts.error);
		});
	};

	return Thumbs;
});
ENDOFFILE"

echo ""
echo "5. Verify the file was updated:"
echo "---"
docker exec guaptalk_app head -n 5 /usr/src/app/public/src/modules/topicThumbs.js

echo ""
echo "6. Now rebuilding..."
docker exec guaptalk_app ./nodebb build

echo ""
echo "=== Diagnosis complete ==="