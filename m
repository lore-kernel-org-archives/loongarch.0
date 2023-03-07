Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EA7420EE
	for <loongarch@lists.linux.dev>; Tue,  7 Mar 2023 07:59:10 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8AxrtrN7gZkUUQJAA--.206S3;
	Tue, 07 Mar 2023 15:59:09 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTL7K7gZkSsRNAA--.4529S2;
	Tue, 07 Mar 2023 15:59:07 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v3 RESEND] checksyscalls: Ignore fstat to silence build warning on LoongArch
Date: Tue,  7 Mar 2023 15:59:00 +0800
Message-Id: <1678175940-20872-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8BxTL7K7gZkSsRNAA--.4529S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoW7KF47Aw4DtF4kGrWfGw4DJwb_yoW8GF47p3
	WSya40qr95GF18uw1293W3try7Awn3ArnrGFy5urs8AFZ8tan5tr9ava98GrnFvayxKa45
	WrWkua47XFyqgFDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
	qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
	b7AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
	1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
	wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
	x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS
	0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0V
	AKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC20s
	026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
	JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14
	v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xva
	j40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8JV
	W8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8vApUUUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

fstat is replaced by statx on the new architecture, so an exception
is added to the checksyscalls script to silence the following build
warning on LoongArch:

  CALL    scripts/checksyscalls.sh
<stdin>:569:2: warning: #warning syscall fstat not implemented [-Wcpp]

Suggested-by: WANG Xuerui <kernel@xen0n.name>
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

This warning still exists when build 6.3-rc1, it looks like
not so good, just resend the patch (2022-08-30):

https://lore.kernel.org/lkml/1661830021-8643-1-git-send-email-yangtiezhu@loongson.cn/

 scripts/checksyscalls.sh | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index f33e61a..1e5d2ee 100755
--- a/scripts/checksyscalls.sh
+++ b/scripts/checksyscalls.sh
@@ -114,7 +114,6 @@ cat << EOF
 #define __IGNORE_truncate
 #define __IGNORE_stat
 #define __IGNORE_lstat
-#define __IGNORE_fstat
 #define __IGNORE_fcntl
 #define __IGNORE_fadvise64
 #define __IGNORE_newfstatat
@@ -255,6 +254,9 @@ cat << EOF
 /* 64-bit ports never needed these, and new 32-bit ports can use statx */
 #define __IGNORE_fstat64
 #define __IGNORE_fstatat64
+
+/* Newer ports are not required to provide fstat in favor of statx */
+#define __IGNORE_fstat
 EOF
 }
 
-- 
2.1.0

