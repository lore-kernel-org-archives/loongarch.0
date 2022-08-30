Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9194A36A
	for <loongarch@lists.linux.dev>; Tue, 30 Aug 2022 02:50:03 +0000 (UTC)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxnmvZeg1jUSwMAA--.40278S2;
	Tue, 30 Aug 2022 10:50:01 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Arnd Bergmann <arnd@arndb.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] checksyscalls: Ignore fstat to silence build warning on LoongArch
Date: Tue, 30 Aug 2022 10:50:00 +0800
Message-Id: <1661827800-8463-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8BxnmvZeg1jUSwMAA--.40278S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF47Aw4DtF4kGrWfGw4DJwb_yoW8JFyrp3
	WSka4jqrykGF18uw1293W8try7uw1rZF17GFy5urs8ZFn8Ka1ktrySvFZ8GrnFq3yIga4U
	WFWkZ34xXFyUuFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkFb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
	C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gr1l42xK
	82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
	C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
	MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
	IF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E
	87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOa9fUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
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

Hi Xuerui and Arnd,

Thank you for your reviews and suggestions.

v2:
  -- Change scripts/checksyscalls.sh
  -- Modify patch subject and commit message

 scripts/checksyscalls.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checksyscalls.sh b/scripts/checksyscalls.sh
index f33e61a..c0a093c 100755
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
@@ -253,6 +252,7 @@ cat << EOF
 #define __IGNORE_vserver
 
 /* 64-bit ports never needed these, and new 32-bit ports can use statx */
+#define __IGNORE_fstat
 #define __IGNORE_fstat64
 #define __IGNORE_fstatat64
 EOF
-- 
2.1.0

