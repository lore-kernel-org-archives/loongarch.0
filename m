Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A8AFBE53
	for <loongarch@lists.linux.dev>; Fri,  9 Jun 2023 09:07:23 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Bxa+rI64Jkm_wAAA--.2995S3;
	Fri, 09 Jun 2023 17:07:20 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxVeTG64JkiHMKAA--.31757S2;
	Fri, 09 Jun 2023 17:07:19 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kselftest@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v5] selftests/clone3: Fix broken test under !CONFIG_TIME_NS
Date: Fri,  9 Jun 2023 17:07:05 +0800
Message-Id: <1686301625-9477-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID:AQAAf8DxVeTG64JkiHMKAA--.31757S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Kw48Jry3JF4kZryDJF1rXwc_yoW5JFyrpF
	yxZw1DKFWFgF17tFyDZ3yqgFyrCF1kXrW8XF47Z34UAr1fXr97Xr4xKa48JryUKrWFvrWF
	yFyfGF4xWr1UXagCm3ZEXasCq-sJn29KB7ZKAUJUUUU5529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcVc_UUUUU
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

v5:
  -- Rebase on the next branch of shuah/linux-kselftest.git
     to avoid potential merge conflicts due to changes in the link:
     https://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux-kselftest.git/commit/?h=next&id=f8424c54d041
  -- Update the commit message and send it as a single patch

Here is the v4 patch:
https://lore.kernel.org/loongarch/1685968410-5412-2-git-send-email-yangtiezhu@loongson.cn/

 tools/testing/selftests/clone3/clone3.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
index e60cf4d..1c61e3c 100644
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
 
 	/* Do a clone3() with exit signal (SIGCHLD) in flags */
 	test_clone3(SIGCHLD, 0, -EINVAL, CLONE3_ARGS_NO_TEST);
-- 
2.1.0

