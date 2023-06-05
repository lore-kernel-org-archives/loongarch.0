Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48FE96ABA
	for <loongarch@lists.linux.dev>; Mon,  5 Jun 2023 12:33:42 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Axe_Il1n1kzRUAAA--.539S3;
	Mon, 05 Jun 2023 20:33:41 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8BxNeQk1n1ktncAAA--.1930S3;
	Mon, 05 Jun 2023 20:33:41 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v4 1/2] selftests/clone3: Fix broken test under !CONFIG_TIME_NS
Date: Mon,  5 Jun 2023 20:33:29 +0800
Message-Id: <1685968410-5412-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1685968410-5412-1-git-send-email-yangtiezhu@loongson.cn>
References: <1685968410-5412-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8BxNeQk1n1ktncAAA--.1930S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoWxGr1DJFWfCrWrZrW7WryDJwc_yoW5GF18pF
	yI9wnFkFWFgr17KFZrZ34qgrW5KF1kXrW0qF4xu34jyr1Sgry8Jr4xKa40yr13Kr40vrZY
	vayxGF4fZr1UX3gCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUBIb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
	xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
	jxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw2
	0EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
	67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8HKZJUUUUU==
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

When execute the following command to test clone3 on LoongArch:

  # cd tools/testing/selftests/clone3 && make && ./clone3

we can see the following error info:

  # [5719] Trying clone3() with flags 0x80 (size 0)
  # Invalid argument - Failed to create new process
  # [5719] clone3() with flags says: -22 expected 0
  not ok 18 [5719] Result (-22) is different than expected (0)

This is because if CONFIG_TIME_NS is not set, but the flag
CLONE_NEWTIME (0x80) is used to clone a time namespace, it
will return -EINVAL in copy_time_ns().

Here is the related code in include/linux/time_namespace.h:

  #ifdef CONFIG_TIME_NS
  ...
  struct time_namespace *copy_time_ns(unsigned long flags,
				      struct user_namespace *user_ns,
				      struct time_namespace *old_ns);
  ...
  #else
  ...
  static inline
  struct time_namespace *copy_time_ns(unsigned long flags,
				      struct user_namespace *user_ns,
				      struct time_namespace *old_ns)
  {
	  if (flags & CLONE_NEWTIME)
		  return ERR_PTR(-EINVAL);

	  return old_ns;
  }
  ...
  #endif

Here is the complete call stack:

  clone3()
    kernel_clone()
      copy_process()
        copy_namespaces()
          create_new_namespaces()
            copy_time_ns()
              clone_time_ns()

If kernel does not support CONFIG_TIME_NS, /proc/self/ns/time
will be not exist, and then we should skip clone3() test with
CLONE_NEWTIME.

With this patch under !CONFIG_TIME_NS:

  # cd tools/testing/selftests/clone3 && make && ./clone3
  ...
  # Time namespaces are not supported
  ok 18 # SKIP Skipping clone3() with CLONE_NEWTIME
  # Totals: pass:17 fail:0 xfail:0 xpass:0 skip:1 error:0

Fixes: 515bddf0ec41 ("selftests/clone3: test clone3 with CLONE_NEWTIME")
Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/clone3/clone3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
index e495f89..c721f8a 100644
--- a/tools/testing/selftests/clone3/clone3.c
+++ b/tools/testing/selftests/clone3/clone3.c
@@ -196,7 +196,12 @@ int main(int argc, char *argv[])
 			CLONE3_ARGS_NO_TEST);
 
 	/* Do a clone3() in a new time namespace */
-	test_clone3(CLONE_NEWTIME, 0, 0, CLONE3_ARGS_NO_TEST);
+	if (access("/proc/self/ns/time", F_OK) == 0) {
+		test_clone3(CLONE_NEWTIME, 0, 0, CLONE3_ARGS_NO_TEST);
+	} else {
+		ksft_print_msg("Time namespaces are not supported\n");
+		ksft_test_result_skip("Skipping clone3() with CLONE_NEWTIME\n");
+	}
 
 	ksft_finished();
 }
-- 
2.1.0

