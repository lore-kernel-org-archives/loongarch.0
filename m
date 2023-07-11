Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7F6182A1
	for <loongarch@lists.linux.dev>; Tue, 11 Jul 2023 09:57:13 +0000 (UTC)
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxRvF4J61kAXYDAA--.10243S3;
	Tue, 11 Jul 2023 17:57:12 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bx3yN2J61kzH4oAA--.9186S3;
	Tue, 11 Jul 2023 17:57:11 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-kselftest@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	loongson-kernel@lists.loongnix.cn
Subject: [PATCH v2 1/2] selftests/vDSO: Add support for LoongArch
Date: Tue, 11 Jul 2023 17:57:04 +0800
Message-Id: <1689069425-17414-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1689069425-17414-1-git-send-email-yangtiezhu@loongson.cn>
References: <1689069425-17414-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID:AQAAf8Bx3yN2J61kzH4oAA--.9186S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7Wr48CF1fuF4kXw1DAr1UArc_yoW8JF48pa
	n7G3s8Kw4xK3Waq3WfJ3s8Ww4YkrZxAFW8tr43W3y3Zr15Awn7Xrs7KFWagFW2939Yqrs5
	Ar1Igw4a9F48J3XCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU9Yb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVWxJr0_GcWln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIev
	Ja73UjIFyTuYvjxU466zUUUUU
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>

There exist the following errors when build vDSO selftests on LoongArch:

  # make headers && cd tools/testing/selftests/vDSO && make
  ...
  error: 'VDSO_VERSION' undeclared (first use in this function)
  ...
  error: 'VDSO_NAMES' undeclared (first use in this function)

We can see that VDSO_VERSION should be LINUX_5.10 and VDSO_NAMES should
be 1 for LoongArch in arch/loongarch/vdso/vdso.lds.S, add them to support
LoongArch.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/testing/selftests/vDSO/vdso_config.h | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vDSO/vdso_config.h b/tools/testing/selftests/vDSO/vdso_config.h
index cdfed40..7b543e7 100644
--- a/tools/testing/selftests/vDSO/vdso_config.h
+++ b/tools/testing/selftests/vDSO/vdso_config.h
@@ -53,15 +53,19 @@
 #if __riscv_xlen == 32
 #define VDSO_32BIT		1
 #endif
+#elif defined(__loongarch__)
+#define VDSO_VERSION		6
+#define VDSO_NAMES		1
 #endif
 
-static const char *versions[6] = {
+static const char *versions[7] = {
 	"LINUX_2.6",
 	"LINUX_2.6.15",
 	"LINUX_2.6.29",
 	"LINUX_2.6.39",
 	"LINUX_4",
 	"LINUX_4.15",
+	"LINUX_5.10"
 };
 
 static const char *names[2][6] = {
-- 
2.1.0

