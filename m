Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E98C176ABE
	for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 15:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719328701; cv=none; b=iz/rVZAVoVyFpL4QrVyIcR/gCn+jP5vPfYSo1OU+ViqLU7gDVLXZr0Npv9rRVoByAJCLRP0eNWNXd7FuzLlPtgwe9IGctsiJiylX2sOlJc5d5l5fmy8HTegnq3jiCYEXYVcMYYY2OFrBiO8umKHl0kHQxKjvdy/bQi8i1gstbJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719328701; c=relaxed/simple;
	bh=//afb4HxqkZE9JBDAwKV2hS2+zyYoD+WoU6vmKwfyiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KHuzEBokjzBC+/v3edCvZAZ2/XVZ+KbHP6vaQOOgpE16X3xWKufCkvV55kDsHWADV+6IYqkSHABTu0ekcYvpe6XCdiHGaSY5h502n/xeNuWgqYz0h9GutBW8aH0UlpahlR7KRPGC/oLgQhaAkCFYH9lG2xq6NzqZXNqjqnTmQEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YRBPZOjK; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YRBPZOjK"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-57cd26347d3so6247383a12.1
        for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 08:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719328697; x=1719933497; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d7K9/OAqcp9elU8MJpErul/3yisyVQlixbedGfcPQ8s=;
        b=YRBPZOjKCtjBrZT3I/YvKUcrZw1kKcYRNwMcsGQMZiaCRSmS0NYMM2QarB4lkqGu+n
         lGzip+Kw89EJNWft3ILJH0NHaF0FrkgZT0oE0cPmubIaGEL398cADwox+bWKdtEXF1iX
         S9KjknK2eHcf6RHrQAgAXEMF2s2CVuvjDOvZL05KFJDX342qNteOVVHUOrItVlBB+PlF
         tWzof+bpYgXFGAEIfomvNhj31z0Bx2e+7DqXv8gWWBMehHSDVUR97H3ok7KtgMXJuJAk
         pwAtGFNQaaaoVfjeCj6mRjrk5vADIT8bblxKwlPMwiACdWrCektngty1PPMRQHbBu44v
         QZmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719328697; x=1719933497;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d7K9/OAqcp9elU8MJpErul/3yisyVQlixbedGfcPQ8s=;
        b=qhi0o6OBkPgF/HCkv8blvU0N9wmk6Tc0Mi6sZIyssWNJcXb7tBeGGDPPaLg9cnihXq
         KvUcGhEGGOH7wznpUjBhkbmYpNnVXWEa4DoQ7mmtyoq0zGI56Hby5Zhn9FZKO6hkCktD
         R3JyNoDMjDBM427E4JejmqNozvD/nT466k0yY9QU8Sp1FdmQKeLTredsHtMuS2k9x0S1
         90d/zy2M3fgk01d0UbKTQxFKyojyBk7A3r6R27nKo+eA52r6DClrXV9KHrZYEt2R3KvO
         Y8V30ykjBqXHn45F6ZJ+3dWLKv0dGJnq4/WUz9vBbJ3/GNzvdssIWXLJ2lRh2HicKr6m
         lwpA==
X-Forwarded-Encrypted: i=1; AJvYcCVhx30SM8LTDVlx/C7eLex3sBmI7QwTBpQRopc0AcwSQjV3MC3ZH7NTmh+SlwhmxAyxtUV5H0TMjYZwZxw8XMnGXWK0p8ugZy0J
X-Gm-Message-State: AOJu0YxGABxQwgAKroOW+6mYhAsbFMX9VS3mot/H3WxWEnHk8uxfj80H
	TSD8NccuSWP9bS5rlTPRESg34XseWqbrpbP+iinVcSCZLGVDyE2E
X-Google-Smtp-Source: AGHT+IFl+RYMWk0teCpgl2p3EYIq4/8ncn6vdi2jZWyA1BmPD0hU+ICE3+vCaRKmxQGQDKJwaeV9Gg==
X-Received: by 2002:a50:8a93:0:b0:57c:8262:6409 with SMTP id 4fb4d7f45d1cf-57d4bd69fe5mr4976694a12.14.1719328697148;
        Tue, 25 Jun 2024 08:18:17 -0700 (PDT)
Received: from f.. (cst-prg-81-171.cust.vodafone.cz. [46.135.81.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3056301bsm6055217a12.89.2024.06.25.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 08:18:16 -0700 (PDT)
From: Mateusz Guzik <mjguzik@gmail.com>
To: brauner@kernel.org
Cc: viro@zeniv.linux.org.uk,
	jack@suse.cz,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	io-uring@vger.kernel.org,
	axboe@kernel.dk,
	torvalds@linux-foundation.org,
	xry111@xry111.site,
	loongarch@lists.linux.dev,
	Mateusz Guzik <mjguzik@gmail.com>
Subject: [PATCH v3] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
Date: Tue, 25 Jun 2024 17:18:06 +0200
Message-ID: <20240625151807.620812-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The newly used helper also checks for empty ("") paths.

NULL paths with any flag value other than AT_EMPTY_PATH go the usual
route and end up with -EFAULT to retain compatibility (Rust is abusing
calls of the sort to detect availability of statx).

This avoids path lookup code, lockref management, memory allocation and
in case of NULL path userspace memory access (which can be quite
expensive with SMAP on x86_64).

Benchmarked with statx(..., AT_EMPTY_PATH, ...) running on Sapphire
Rapids, with the "" path for the first two cases and NULL for the last
one.

Results in ops/s:
stock:     4231237
pre-check: 5944063 (+40%)
NULL path: 6601619 (+11%/+56%)

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---

Diffed against fs-next and assumes c050122bdbb4 ("fs: new helper
vfs_empty_path()") from vfs.empty.path is already applied.

WARNING: io_uring remains untested (modulo compilation). I presume
Jens has a handy way of making sure things still work. 

While the io_uring part can be added at a later date, I'm trying to
avoid a scenario where someone has code which works with the NULL path
and breaks when moving to io_uring. I am not going to argue about it ,
worst case changes to io_uring can be trivially dropped and someone(tm)
can add their own variant whenever they see fit.

v3:
- also support AT_STATX* flags for NULL and ""

v2:
- support glibc passing AT_NO_AUTOMOUNT | AT_EMPTY_PATH
- tidy up some commentary
- drop the fdget_raw CLASS addition as it is already present in newer
  trees

 fs/internal.h    |   2 +
 fs/stat.c        | 107 +++++++++++++++++++++++++++++++++++------------
 io_uring/statx.c |  22 ++++++----
 3 files changed, 96 insertions(+), 35 deletions(-)

diff --git a/fs/internal.h b/fs/internal.h
index 84f371193f74..1d820018e6dc 100644
--- a/fs/internal.h
+++ b/fs/internal.h
@@ -247,6 +247,8 @@ extern const struct dentry_operations ns_dentry_operations;
 int getname_statx_lookup_flags(int flags);
 int do_statx(int dfd, struct filename *filename, unsigned int flags,
 	     unsigned int mask, struct statx __user *buffer);
+int do_statx_fd(int fd, unsigned int flags, unsigned int mask,
+		struct statx __user *buffer);
 
 /*
  * fs/splice.c:
diff --git a/fs/stat.c b/fs/stat.c
index 5039c34a385d..3778e605eac8 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -214,6 +214,43 @@ int getname_statx_lookup_flags(int flags)
 	return lookup_flags;
 }
 
+static int vfs_statx_path(struct path *path, int flags, struct kstat *stat,
+			  u32 request_mask)
+{
+	int error = vfs_getattr(path, stat, request_mask, flags);
+
+	if (request_mask & STATX_MNT_ID_UNIQUE) {
+		stat->mnt_id = real_mount(path->mnt)->mnt_id_unique;
+		stat->result_mask |= STATX_MNT_ID_UNIQUE;
+	} else {
+		stat->mnt_id = real_mount(path->mnt)->mnt_id;
+		stat->result_mask |= STATX_MNT_ID;
+	}
+
+	if (path->mnt->mnt_root == path->dentry)
+		stat->attributes |= STATX_ATTR_MOUNT_ROOT;
+	stat->attributes_mask |= STATX_ATTR_MOUNT_ROOT;
+
+	/* Handle STATX_DIOALIGN for block devices. */
+	if (request_mask & STATX_DIOALIGN) {
+		struct inode *inode = d_backing_inode(path->dentry);
+
+		if (S_ISBLK(inode->i_mode))
+			bdev_statx_dioalign(inode, stat);
+	}
+
+	return error;
+}
+
+static int vfs_statx_fd(int fd, int flags, struct kstat *stat,
+			  u32 request_mask)
+{
+	CLASS(fd_raw, f)(fd);
+	if (!f.file)
+		return -EBADF;
+	return vfs_statx_path(&f.file->f_path, flags, stat, request_mask);
+}
+
 /**
  * vfs_statx - Get basic and extra attributes by filename
  * @dfd: A file descriptor representing the base dir for a relative filename
@@ -243,36 +280,13 @@ static int vfs_statx(int dfd, struct filename *filename, int flags,
 retry:
 	error = filename_lookup(dfd, filename, lookup_flags, &path, NULL);
 	if (error)
-		goto out;
-
-	error = vfs_getattr(&path, stat, request_mask, flags);
-
-	if (request_mask & STATX_MNT_ID_UNIQUE) {
-		stat->mnt_id = real_mount(path.mnt)->mnt_id_unique;
-		stat->result_mask |= STATX_MNT_ID_UNIQUE;
-	} else {
-		stat->mnt_id = real_mount(path.mnt)->mnt_id;
-		stat->result_mask |= STATX_MNT_ID;
-	}
-
-	if (path.mnt->mnt_root == path.dentry)
-		stat->attributes |= STATX_ATTR_MOUNT_ROOT;
-	stat->attributes_mask |= STATX_ATTR_MOUNT_ROOT;
-
-	/* Handle STATX_DIOALIGN for block devices. */
-	if (request_mask & STATX_DIOALIGN) {
-		struct inode *inode = d_backing_inode(path.dentry);
-
-		if (S_ISBLK(inode->i_mode))
-			bdev_statx_dioalign(inode, stat);
-	}
-
+		return error;
+	error = vfs_statx_path(&path, flags, stat, request_mask);
 	path_put(&path);
 	if (retry_estale(error, lookup_flags)) {
 		lookup_flags |= LOOKUP_REVAL;
 		goto retry;
 	}
-out:
 	return error;
 }
 
@@ -683,16 +697,40 @@ int do_statx(int dfd, struct filename *filename, unsigned int flags,
 	return cp_statx(&stat, buffer);
 }
 
+int do_statx_fd(int fd, unsigned int flags, unsigned int mask,
+	     struct statx __user *buffer)
+{
+	struct kstat stat;
+	int error;
+
+	if (mask & STATX__RESERVED)
+		return -EINVAL;
+	if ((flags & AT_STATX_SYNC_TYPE) == AT_STATX_SYNC_TYPE)
+		return -EINVAL;
+
+	/* STATX_CHANGE_COOKIE is kernel-only for now. Ignore requests
+	 * from userland.
+	 */
+	mask &= ~STATX_CHANGE_COOKIE;
+
+	error = vfs_statx_fd(fd, flags, &stat, mask);
+	if (error)
+		return error;
+
+	return cp_statx(&stat, buffer);
+}
+
 /**
  * sys_statx - System call to get enhanced stats
  * @dfd: Base directory to pathwalk from *or* fd to stat.
- * @filename: File to stat or "" with AT_EMPTY_PATH
+ * @filename: File to stat or either NULL or "" with AT_EMPTY_PATH
  * @flags: AT_* flags to control pathwalk.
  * @mask: Parts of statx struct actually required.
  * @buffer: Result buffer.
  *
  * Note that fstat() can be emulated by setting dfd to the fd of interest,
- * supplying "" as the filename and setting AT_EMPTY_PATH in the flags.
+ * supplying "" (or preferably NULL) as the filename and setting AT_EMPTY_PATH
+ * in the flags.
  */
 SYSCALL_DEFINE5(statx,
 		int, dfd, const char __user *, filename, unsigned, flags,
@@ -700,8 +738,23 @@ SYSCALL_DEFINE5(statx,
 		struct statx __user *, buffer)
 {
 	int ret;
+	unsigned lflags;
 	struct filename *name;
 
+	/*
+	 * Short-circuit handling of NULL and "" paths.
+	 *
+	 * For a NULL path we require and accept only the AT_EMPTY_PATH flag
+	 * (possibly |'d with AT_STATX flags).
+	 *
+	 * However, glibc on 32-bit architectures implements fstatat as statx
+	 * with the "" pathname and AT_NO_AUTOMOUNT | AT_EMPTY_PATH flags.
+	 * Supporting this results in the uglification below.
+	 */
+	lflags = flags & ~(AT_NO_AUTOMOUNT | AT_STATX_SYNC_TYPE);
+	if (lflags == AT_EMPTY_PATH && vfs_empty_path(dfd, filename))
+		return do_statx_fd(dfd, flags & ~AT_NO_AUTOMOUNT, mask, buffer);
+
 	name = getname_flags(filename, getname_statx_lookup_flags(flags));
 	ret = do_statx(dfd, name, flags, mask, buffer);
 	putname(name);
diff --git a/io_uring/statx.c b/io_uring/statx.c
index f7f9b202eec0..2b27af51fc12 100644
--- a/io_uring/statx.c
+++ b/io_uring/statx.c
@@ -23,6 +23,7 @@ struct io_statx {
 int io_statx_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
 	struct io_statx *sx = io_kiocb_to_cmd(req, struct io_statx);
+	struct filename *filename;
 	const char __user *path;
 
 	if (sqe->buf_index || sqe->splice_fd_in)
@@ -36,14 +37,16 @@ int io_statx_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	sx->buffer = u64_to_user_ptr(READ_ONCE(sqe->addr2));
 	sx->flags = READ_ONCE(sqe->statx_flags);
 
-	sx->filename = getname_flags(path,
-				     getname_statx_lookup_flags(sx->flags));
-
-	if (IS_ERR(sx->filename)) {
-		int ret = PTR_ERR(sx->filename);
-
+	if ((sx->flags & (AT_EMPTY_PATH | AT_STATX_SYNC_TYPE)) ==
+	    (AT_EMPTY_PATH | AT_STATX_SYNC_TYPE) &&
+	    vfs_empty_path(sx->dfd, path)) {
 		sx->filename = NULL;
-		return ret;
+	} else {
+		filename = getname_flags(path,
+					 getname_statx_lookup_flags(sx->flags));
+		if (IS_ERR(filename))
+			return PTR_ERR(filename);
+		sx->filename = filename;
 	}
 
 	req->flags |= REQ_F_NEED_CLEANUP;
@@ -58,7 +61,10 @@ int io_statx(struct io_kiocb *req, unsigned int issue_flags)
 
 	WARN_ON_ONCE(issue_flags & IO_URING_F_NONBLOCK);
 
-	ret = do_statx(sx->dfd, sx->filename, sx->flags, sx->mask, sx->buffer);
+	if (sx->filename == NULL)
+		ret = do_statx_fd(sx->dfd, sx->flags, sx->mask, sx->buffer);
+	else
+		ret = do_statx(sx->dfd, sx->filename, sx->flags, sx->mask, sx->buffer);
 	io_req_set_res(req, ret, 0);
 	return IOU_OK;
 }
-- 
2.43.0

