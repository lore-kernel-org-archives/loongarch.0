Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4971107
	for <loongarch@lists.linux.dev>; Thu, 29 Sep 2022 09:15:40 +0000 (UTC)
Received: from loongson-pc.loongson.cn (unknown [10.20.42.32])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxT+A6YjVjBbUjAA--.3282S2;
	Thu, 29 Sep 2022 17:15:38 +0800 (CST)
From: Jianmin Lv <lvjianmin@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: [PATCH V4] LoongArch: Fix cpu name after s3/s4
Date: Thu, 29 Sep 2022 17:15:38 +0800
Message-Id: <20220929091538.9104-1-lvjianmin@loongson.cn>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxT+A6YjVjBbUjAA--.3282S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JrW8Gw45uFWUZw43CrWfZrb_yoWfJFX_Ga
	n293ZrGFn3Ga40va4DWa48Ww45Aa18XFyav3y7ArZxCr43Cw15JrsrKw15AryayF1rWrZ8
	uw4SganF9F4jyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAYjsxI4VWkKwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4
	kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_
	Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI
	0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l42xK82IY
	6x8ErcxFaVAv8VW5Wr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUqs2-DUUUU
X-CM-SenderInfo: 5oymxthqpl0qxorr0wxvrqhubq/

Don't overwrite the CPU name on coming back from S3/S4 if
it is already initialized.

Signed-off-by: Jianmin Lv <lvjianmin@loongson.cn>

diff --git a/arch/loongarch/kernel/cpu-probe.c b/arch/loongarch/kernel/cpu-probe.c
index 529ab8f44ec6..255a09876ef2 100644
--- a/arch/loongarch/kernel/cpu-probe.c
+++ b/arch/loongarch/kernel/cpu-probe.c
@@ -187,7 +187,9 @@ static inline void cpu_probe_loongson(struct cpuinfo_loongarch *c, unsigned int
 	uint64_t *vendor = (void *)(&cpu_full_name[VENDOR_OFFSET]);
 	uint64_t *cpuname = (void *)(&cpu_full_name[CPUNAME_OFFSET]);
 
-	__cpu_full_name[cpu] = cpu_full_name;
+	if (!__cpu_full_name[cpu])
+		__cpu_full_name[cpu] = cpu_full_name;
+
 	*vendor = iocsr_read64(LOONGARCH_IOCSR_VENDOR);
 	*cpuname = iocsr_read64(LOONGARCH_IOCSR_CPUNAME);
 
-- 
2.31.1

