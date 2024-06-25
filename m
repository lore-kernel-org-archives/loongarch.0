Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1985116D9B5
	for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 14:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719324992; cv=none; b=MDuHg422FP0RdlKZI6yNlNB8Jc56Feb4LjP3EoXHT0nCWklRSzfxfDQG8l1RcneXELGAbWM7L5Rg3hTx8tCAhafVJ+rz7S6LDyfDbVnX+/qNh5075IzQHZPvZ6kR18pjCWbOkH7lbLhE21SUoPzMZHWRiTcyy4CfM4gv+ArCuLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719324992; c=relaxed/simple;
	bh=xtx+rik6uFoGmkuS+8tWAviD3+bYuderKym6eq6WVk8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=asOrfb7Zpcvdt3yUtB5AsWk6T8WQjkNMuR3M2Ox/ryTlixPmh5U2cFu3hPHyxCQSHVNX1SpfMHZdv3VNw27ksX+wEDH4+AGjFZYmnoJKT2QyI2iXkfpyZHmBKIXk69EFRPpyj7vlkFezY/vDJ134neMIeNCWxle+ZwdMDOsPZUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gKCOxDzt; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gKCOxDzt"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a724598cfe3so377943066b.1
        for <loongarch@lists.linux.dev>; Tue, 25 Jun 2024 07:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719324987; x=1719929787; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UueIcfEBB+sTw8Da4EHrqDDA6zoe//kf6xowUDRXxM4=;
        b=gKCOxDztqByfY1jlK/xMtqy5g3fNFLgavefll/6XbFscHIfdmXcu0p4A3CTiqogumX
         cy8kIfFHMHA/r0jCU9zOetU9EeIUfkox4Q97ovdBPgMzc05sXEjP+htIaXMY6hR2LGmJ
         euwwJoV2mOiE0oeRsSY8ZtwyoX8njmRZ6SSaGbvgFnD3AXXeTK0OHjFLUVq3OP3gGyow
         1qigrqTTo/1Lm3G0P+qeNeKsRJwrG0su0ccV/hJIloxHcO/7J/AczZwKVi6ALw9Jde7E
         1KX+TQvR6/jC8jL6AK9Iaux3sAZDRZ+Parj92RbgbOg9/BOeOl5sGyHWWLV292rYThqZ
         haXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719324987; x=1719929787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UueIcfEBB+sTw8Da4EHrqDDA6zoe//kf6xowUDRXxM4=;
        b=sV6GJbJPt25D2sAp3FPIC48UQZkB8moJqIe7yKpqXe1KOVUD4dmvQ15KDX2ZklskTk
         gnZSkJilKsuyyqkkCn1VGxT4Ea09GVn60MJkl/dsHDlmfRXcuq2GwkE9MpQG7jWVT57I
         s3gIwvDbpd+jIWDbnh6JlKreOTR6DfL/S85S6IG5AvRKZvI5UIT8IECD0bKDWjjqeUsD
         4VUOCUrwafaMvhpNpCQR/ii9rnJMKQWtx7Pj7zCdtR9T+IqvDbBah4fSxxvwiTVFeHF/
         ODl0UJyPp6NCNcZohKTybPaX+qC3HsidUci1UpdRKwKJkOntmnMEyK5vWl8TGAqOZbja
         MK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUi0nztX+7xhahmR63RzEgsxvUiI9R4LNkeU26v0EU3A/45aQ6gp93lSO+kAXA7kxrWJP6eFOkYxVi3SH1kDKFmFW9SiycPrYMR
X-Gm-Message-State: AOJu0YzInMo2H3Q4Cuev2psNOXukqC4c/te+RrEjDxMlik/RboeCi2AG
	0Env02F2SEfJJfcPOFahwBpv2Qg+bEtIQ60eDDirWCSwksegsDVx
X-Google-Smtp-Source: AGHT+IHyA3C7f0akc1PTU2Nv2Jzlwg/+RN1NlHaJr2fR0Xd3DwDz3CVE3sjnYANSyRnzAAt9+tn50g==
X-Received: by 2002:a17:906:46cd:b0:a6f:ddb3:bf2b with SMTP id a640c23a62f3a-a7245bf6786mr606179066b.41.1719324987145;
        Tue, 25 Jun 2024 07:16:27 -0700 (PDT)
Received: from f.. (cst-prg-81-171.cust.vodafone.cz. [46.135.81.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7247ccb868sm299695566b.208.2024.06.25.07.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 07:16:26 -0700 (PDT)
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
Subject: [PATCH v2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
Date: Tue, 25 Jun 2024 16:16:18 +0200
Message-ID: <20240625141618.615247-1-mjguzik@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The newly used helper also checks for 0-sized buffers.

NULL paths with any flag value other than AT_EMPTY_PATH go the usual
route and end up with -EFAULT to retain compatibility (Rust is abusing
calls of the sort to detect availability of statx).

This avoids path lookup code, lockref management, memory allocation and
in case of NULL path userspace memory access (which can be quite
expensive with SMAP on x86_64).

statx(..., AT_EMPTY_PATH, ...) issued on Sapphire Rapids (ops/s):
stock:     4231237
0-check:   5944063 (+40%)
NULL path: 6601619 (+11%/+56%)

Signed-off-by: Mateusz Guzik <mjguzik@gmail.com>
---

Diffed against fs-next and assumes c050122bdbb4 ("fs: new helper
vfs_empty_path()") from vfs.empty.path is already applied.

WARNING: io_uring remains untested (modulo compilation). I presume
Jens has a handy way of making sure things still work. 

While the io_uring part can be added at a later date, but I'm trying to
avoid a scenario where someone has code which works with the NULL path
and breaks when moving to io_uring. I am not going to argue about it
however, worst case changes to io_uring can be trivially dropped and
someone(tm) can add their own variant whenever they see fit.

v2:
- support glibc passing AT_NO_AUTOMOUNT | AT_EMPTY_PATH
- tidy up some commentary
- drop the fdget_raw CLASS addition as it is already present in newer
  trees

 fs/internal.h    |   2 +
 fs/stat.c        | 106 +++++++++++++++++++++++++++++++++++------------
 io_uring/statx.c |  21 ++++++----
 3 files changed, 93 insertions(+), 36 deletions(-)

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
index 5039c34a385d..8114eed25d93 100644
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
@@ -700,8 +738,22 @@ SYSCALL_DEFINE5(statx,
 		struct statx __user *, buffer)
 {
 	int ret;
+	unsigned lflags;
 	struct filename *name;
 
+	/*
+	 * Short-circuit handling of NULL and "" paths.
+	 *
+	 * For a NULL path we require and accept only the AT_EMPTY_PATH flag.
+	 *
+	 * However, glibc on 32-bit architectures implements fstatat as statx
+	 * with the "" pathname and AT_NO_AUTOMOUNT | AT_EMPTY_PATH flags.
+	 * Supporting this results in the uglification below.
+	 */
+	lflags = flags & ~AT_NO_AUTOMOUNT;
+	if (lflags == AT_EMPTY_PATH && vfs_empty_path(dfd, filename))
+		return do_statx_fd(dfd, lflags, mask, buffer);
+
 	name = getname_flags(filename, getname_statx_lookup_flags(flags));
 	ret = do_statx(dfd, name, flags, mask, buffer);
 	putname(name);
diff --git a/io_uring/statx.c b/io_uring/statx.c
index f7f9b202eec0..a7216058b05b 100644
--- a/io_uring/statx.c
+++ b/io_uring/statx.c
@@ -23,6 +23,7 @@ struct io_statx {
 int io_statx_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 {
 	struct io_statx *sx = io_kiocb_to_cmd(req, struct io_statx);
+	struct filename *filename;
 	const char __user *path;
 
 	if (sqe->buf_index || sqe->splice_fd_in)
@@ -36,14 +37,13 @@ int io_statx_prep(struct io_kiocb *req, const struct io_uring_sqe *sqe)
 	sx->buffer = u64_to_user_ptr(READ_ONCE(sqe->addr2));
 	sx->flags = READ_ONCE(sqe->statx_flags);
 
-	sx->filename = getname_flags(path,
-				     getname_statx_lookup_flags(sx->flags));
-
-	if (IS_ERR(sx->filename)) {
-		int ret = PTR_ERR(sx->filename);
-
-		sx->filename = NULL;
-		return ret;
+	sx->filename = NULL;
+	if (!(sx->flags == AT_EMPTY_PATH && vfs_empty_path(sx->dfd, path))) {
+		filename = getname_flags(path,
+					 getname_statx_lookup_flags(sx->flags));
+		if (IS_ERR(filename))
+			return PTR_ERR(filename);
+		sx->filename = filename;
 	}
 
 	req->flags |= REQ_F_NEED_CLEANUP;
@@ -58,7 +58,10 @@ int io_statx(struct io_kiocb *req, unsigned int issue_flags)
 
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

