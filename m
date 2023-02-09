Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2517D627
	for <loongarch@lists.linux.dev>; Thu,  9 Feb 2023 03:24:31 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id ge7-20020a17090b0e0700b002312568942cso2482043pjb.3
        for <loongarch@lists.linux.dev>; Wed, 08 Feb 2023 19:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0k4116z+FnKSgcNKXbUlpcxBAngwPA0Oou26zqioifg=;
        b=HTuOSyeF0u9WynHKbqrdk80adG2jyTJ75oyfVIYtld2I1Jvj58m1hkDmNjx3GQMOPs
         mOHANoqBu3etAUjQHELKc0eJwSsawtkE3CjUX7MFT4FgkCLgf5+LlvpAAzu4mMLl7O0C
         cJT13sQA40NMpy+gCsAJsWM6Y0EI/0jc/wryE83JbAuttljaQVdDdIjn86+lr0nMbQiW
         qRbEQ+EVFtCLzyQBRbZrANTjaVEmiJRteaX63YS3zA3XC5nAE6GHDD2CMbGy00ghQhWj
         H0hhyXlXF3giIDYue35TKSf7oaDb2HhJBmNUN3rDxkv2gKJNyJTlSJJIbrP+xCNP5W6X
         HUtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0k4116z+FnKSgcNKXbUlpcxBAngwPA0Oou26zqioifg=;
        b=G8ctoCFZvts04tAELf6QhDKQ4mg1iAJjS9HYRtp0KWwJ6igFLa6/mKRJOLgdCnhn/G
         2EV+7TOVqvcduYgic3yS2WJ1yjBANGpIsvdaoqijbFK/0kH0pKos1CRNIvuRgi77Dxtz
         oa9ID346g1+HHHAuB1vAQXhGVzj0dxMBtUeW4105z2AL4UrHoEVo0PcxtJmZB8lknluo
         UTXKPS0x6Y0KarDmrwd8R35TvOXJLLuVCC2S/rTit2ZZu5s12g5fLTThwcyr3mvKLID6
         QABXXZvnZ/Gy3SccBnbfhhDIGnzLQfxsssytVifgJ0ZUZyajpf0fpfU3Trvb+a1x6jF4
         WS6w==
X-Gm-Message-State: AO0yUKXPi4aTrN45CI6cJsScSpwwvP/+HSGf9PD37gWOr2urJQwiYDig
	HBko3uot6esIHUnPvsdPwVc=
X-Google-Smtp-Source: AK7set/0+u/D8v8msRR4LnK2jLZDeI8z/6+tA97Oe+gs2LS1scm4li7z5ZKg8+aVx2zvKk5Y9ccnfw==
X-Received: by 2002:a17:902:eccf:b0:198:ee1c:77b6 with SMTP id a15-20020a170902eccf00b00198ee1c77b6mr12351342plh.26.1675913070854;
        Wed, 08 Feb 2023 19:24:30 -0800 (PST)
Received: from localhost.localdomain ([112.20.108.204])
        by smtp.gmail.com with ESMTPSA id p5-20020a170902eac500b00192820d00d0sm216086pld.120.2023.02.08.19.24.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Feb 2023 19:24:30 -0800 (PST)
From: chris.chenfeiyang@gmail.com
X-Google-Original-From: chenfeiyang@loongson.cn
To: w@1wt.eu,
	paulmck@kernel.org
Cc: Feiyang Chen <chenfeiyang@loongson.cn>,
	arnd@arndb.de,
	chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com,
	chris.chenfeiyang@gmail.com,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] tools/nolibc: Add statx() and make stat() rely on statx() if necessary
Date: Thu,  9 Feb 2023 11:24:13 +0800
Message-Id: <f60027664200d6d1f0ed6c7b87915a223afb982f.1675907639.git.chenfeiyang@loongson.cn>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1675907639.git.chenfeiyang@loongson.cn>
References: <cover.1675907639.git.chenfeiyang@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Feiyang Chen <chenfeiyang@loongson.cn>

LoongArch and RISC-V 32-bit only have statx(). ARC, Hexagon, Nios2 and
OpenRISC have statx() and stat64() but not stat() or newstat(). Add
statx() and make stat() rely on statx() if necessary to make them happy.
We may just use statx() for all architectures in the future.

Signed-off-by: Feiyang Chen <chenfeiyang@loongson.cn>
---
 tools/include/nolibc/sys.h | 56 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index c4818a9c8823..70c30d457952 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -20,6 +20,7 @@
 #include <linux/time.h>
 #include <linux/auxvec.h>
 #include <linux/fcntl.h> // for O_* and AT_*
+#include <linux/stat.h>  // for statx()
 
 #include "arch.h"
 #include "errno.h"
@@ -1048,12 +1049,66 @@ pid_t setsid(void)
 	return ret;
 }
 
+#if defined(__NR_statx)
+/*
+ * int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf);
+ */
+
+static __attribute__((unused))
+int sys_statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
+{
+	return my_syscall5(__NR_statx, fd, path, flags, mask, buf);
+}
+
+static __attribute__((unused))
+int statx(int fd, const char *path, int flags, unsigned int mask, struct statx *buf)
+{
+	int ret = sys_statx(fd, path, flags, mask, buf);
+
+	if (ret < 0) {
+		SET_ERRNO(-ret);
+		ret = -1;
+	}
+	return ret;
+}
+#endif
 
 /*
  * int stat(const char *path, struct stat *buf);
  * Warning: the struct stat's layout is arch-dependent.
  */
 
+#if defined(__NR_statx) && !defined(__NR_newfstatat) && !defined(__NR_stat)
+/*
+ * Maybe we can just use statx() when available for all architectures?
+ */
+static __attribute__((unused))
+int sys_stat(const char *path, struct stat *buf)
+{
+	struct statx statx;
+	long ret;
+
+	ret = sys_statx(AT_FDCWD, path, AT_NO_AUTOMOUNT, STATX_BASIC_STATS, &statx);
+	buf->st_dev     = ((statx.stx_dev_minor & 0xff)
+			  | (statx.stx_dev_major << 8)
+			  | ((statx.stx_dev_minor & ~0xff) << 12));
+	buf->st_ino     = statx.stx_ino;
+	buf->st_mode    = statx.stx_mode;
+	buf->st_nlink   = statx.stx_nlink;
+	buf->st_uid     = statx.stx_uid;
+	buf->st_gid     = statx.stx_gid;
+	buf->st_rdev    = ((statx.stx_rdev_minor & 0xff)
+			  | (statx.stx_rdev_major << 8)
+			  | ((statx.stx_rdev_minor & ~0xff) << 12));
+	buf->st_size    = statx.stx_size;
+	buf->st_blksize = statx.stx_blksize;
+	buf->st_blocks  = statx.stx_blocks;
+	buf->st_atime   = statx.stx_atime.tv_sec;
+	buf->st_mtime   = statx.stx_mtime.tv_sec;
+	buf->st_ctime   = statx.stx_ctime.tv_sec;
+	return ret;
+}
+#else
 static __attribute__((unused))
 int sys_stat(const char *path, struct stat *buf)
 {
@@ -1083,6 +1138,7 @@ int sys_stat(const char *path, struct stat *buf)
 	buf->st_ctime   = stat.st_ctime;
 	return ret;
 }
+#endif
 
 static __attribute__((unused))
 int stat(const char *path, struct stat *buf)
-- 
2.39.0

