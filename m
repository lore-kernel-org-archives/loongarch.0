Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411B417A5BE
	for <loongarch@lists.linux.dev>; Tue, 21 Jan 2025 07:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737443260; cv=none; b=GafaO/oOxKhusNwnu9oxTQtEi5xPcwt5oua/+ovSDf3/rN88jgaSdXYsgzfB3ZZ2pa6r6SvdLwDYqjweN5ChPFq9jILT/fTqMlZihsIMdsxVzAANGdpnsUBcRBSYb9AnhcfCkcb/DaqxYil7scQtlrVYdz0esG74X7M6gCv+fAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737443260; c=relaxed/simple;
	bh=SxMPAZ3+T0CfKfNEp9gx7u//ccbET2Fo5a3BWrR/gxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X0VuFXha2m0qt/e3e+sIrYudY8ecSZE0TqMW034vD1i8WdVekzL+sURJA3NHAS7It5anFul159k6HysSMd8K32dRIbDvJrxGvsnsXorpTVLeCofd+DDhxMRE3sYeX6JRzqCR2JC2cpZhoGpap6mh2K0/oZ1gWlG7eXiMD78Iqu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8DxGeFtR49nRKlmAA--.4051S3;
	Tue, 21 Jan 2025 15:06:21 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMCxYMZqR49nzawpAA--.24913S3;
	Tue, 21 Jan 2025 15:06:20 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] LoongArch: Change 8 to 14 for LOONGARCH_MAX_{BRP,WRP}
Date: Tue, 21 Jan 2025 15:06:16 +0800
Message-ID: <20250121070617.3214-2-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250121070617.3214-1-yangtiezhu@loongson.cn>
References: <20250121070617.3214-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowMCxYMZqR49nzawpAA--.24913S3
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW3Gry5uFWxKFykury7WFyDArc_yoWxKF1xpr
	1UCFWrGrWUtFyxKa1IqF1Y9r4UXFZ7ursIvw1FvwsFkF4DA3y8Xw1qgryfJFy5Aan5XFyS
	kw1kA3ySva4UJwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ36c02F40EFcxC0VAKzVAqx4xG6I80ewCIccxYrVCFb4Uv73VFW2AGmfu7
	bjvjm3AaLaJ3UjIYCTnIWjp_UUUYo7kC6x804xWl14x267AKxVWUJVW8JwAFc2x0x2IEx4
	CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64kIII0Yj41l84x0
	c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2
	IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280
	aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa02
	0Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1l
	Yx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkvb40E47
	kJMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF
	7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxV
	WUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07b7
	zVbUUUUU=

The maximum number of load/store watchpoints and fetch instruction
watchpoints is 14 each according to LoongArch Reference Manual, so
change 8 to 14 for the related code.

Link: https://loongson.github.io/LoongArch-Documentation/LoongArch-Vol1-EN.html#control-and-status-registers-related-to-watchpoints
Fixes: edffa33c7bb5 ("LoongArch: Add hardware breakpoints/watchpoints support")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/include/asm/hw_breakpoint.h |  4 +-
 arch/loongarch/include/asm/loongarch.h     | 60 ++++++++++++++++++++++
 arch/loongarch/kernel/hw_breakpoint.c      | 16 +++++-
 3 files changed, 76 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/include/asm/hw_breakpoint.h b/arch/loongarch/include/asm/hw_breakpoint.h
index d78330916bd1..13b2462f3d8c 100644
--- a/arch/loongarch/include/asm/hw_breakpoint.h
+++ b/arch/loongarch/include/asm/hw_breakpoint.h
@@ -38,8 +38,8 @@ struct arch_hw_breakpoint {
  * Limits.
  * Changing these will require modifications to the register accessors.
  */
-#define LOONGARCH_MAX_BRP		8
-#define LOONGARCH_MAX_WRP		8
+#define LOONGARCH_MAX_BRP		14
+#define LOONGARCH_MAX_WRP		14
 
 /* Virtual debug register bases. */
 #define CSR_CFG_ADDR	0
diff --git a/arch/loongarch/include/asm/loongarch.h b/arch/loongarch/include/asm/loongarch.h
index 64ad277e096e..aaa4ad6b8594 100644
--- a/arch/loongarch/include/asm/loongarch.h
+++ b/arch/loongarch/include/asm/loongarch.h
@@ -959,6 +959,36 @@
 #define LOONGARCH_CSR_DB7CTRL		0x34a	/* data breakpoint 7 control */
 #define LOONGARCH_CSR_DB7ASID		0x34b	/* data breakpoint 7 asid */
 
+#define LOONGARCH_CSR_DB8ADDR		0x350	/* data breakpoint 8 address */
+#define LOONGARCH_CSR_DB8MASK		0x351	/* data breakpoint 8 mask */
+#define LOONGARCH_CSR_DB8CTRL		0x352	/* data breakpoint 8 control */
+#define LOONGARCH_CSR_DB8ASID		0x353	/* data breakpoint 8 asid */
+
+#define LOONGARCH_CSR_DB9ADDR		0x358	/* data breakpoint 9 address */
+#define LOONGARCH_CSR_DB9MASK		0x359	/* data breakpoint 9 mask */
+#define LOONGARCH_CSR_DB9CTRL		0x35a	/* data breakpoint 9 control */
+#define LOONGARCH_CSR_DB9ASID		0x35b	/* data breakpoint 9 asid */
+
+#define LOONGARCH_CSR_DB10ADDR		0x360	/* data breakpoint 10 address */
+#define LOONGARCH_CSR_DB10MASK		0x361	/* data breakpoint 10 mask */
+#define LOONGARCH_CSR_DB10CTRL		0x362	/* data breakpoint 10 control */
+#define LOONGARCH_CSR_DB10ASID		0x363	/* data breakpoint 10 asid */
+
+#define LOONGARCH_CSR_DB11ADDR		0x368	/* data breakpoint 11 address */
+#define LOONGARCH_CSR_DB11MASK		0x369	/* data breakpoint 11 mask */
+#define LOONGARCH_CSR_DB11CTRL		0x36a	/* data breakpoint 11 control */
+#define LOONGARCH_CSR_DB11ASID		0x36b	/* data breakpoint 11 asid */
+
+#define LOONGARCH_CSR_DB12ADDR		0x370	/* data breakpoint 12 address */
+#define LOONGARCH_CSR_DB12MASK		0x371	/* data breakpoint 12 mask */
+#define LOONGARCH_CSR_DB12CTRL		0x372	/* data breakpoint 12 control */
+#define LOONGARCH_CSR_DB12ASID		0x373	/* data breakpoint 12 asid */
+
+#define LOONGARCH_CSR_DB13ADDR		0x378	/* data breakpoint 13 address */
+#define LOONGARCH_CSR_DB13MASK		0x379	/* data breakpoint 13 mask */
+#define LOONGARCH_CSR_DB13CTRL		0x37a	/* data breakpoint 13 control */
+#define LOONGARCH_CSR_DB13ASID		0x37b	/* data breakpoint 13 asid */
+
 #define LOONGARCH_CSR_FWPC		0x380	/* instruction breakpoint config */
 #define LOONGARCH_CSR_FWPS		0x381	/* instruction breakpoint status */
 
@@ -1002,6 +1032,36 @@
 #define LOONGARCH_CSR_IB7CTRL		0x3ca	/* inst breakpoint 7 control */
 #define LOONGARCH_CSR_IB7ASID		0x3cb	/* inst breakpoint 7 asid */
 
+#define LOONGARCH_CSR_IB8ADDR		0x3d0	/* inst breakpoint 8 address */
+#define LOONGARCH_CSR_IB8MASK		0x3d1	/* inst breakpoint 8 mask */
+#define LOONGARCH_CSR_IB8CTRL		0x3d2	/* inst breakpoint 8 control */
+#define LOONGARCH_CSR_IB8ASID		0x3d3	/* inst breakpoint 8 asid */
+
+#define LOONGARCH_CSR_IB9ADDR		0x3d8	/* inst breakpoint 9 address */
+#define LOONGARCH_CSR_IB9MASK		0x3d9	/* inst breakpoint 9 mask */
+#define LOONGARCH_CSR_IB9CTRL		0x3da	/* inst breakpoint 9 control */
+#define LOONGARCH_CSR_IB9ASID		0x3db	/* inst breakpoint 9 asid */
+
+#define LOONGARCH_CSR_IB10ADDR		0x3e0	/* inst breakpoint 10 address */
+#define LOONGARCH_CSR_IB10MASK		0x3e1	/* inst breakpoint 10 mask */
+#define LOONGARCH_CSR_IB10CTRL		0x3e2	/* inst breakpoint 10 control */
+#define LOONGARCH_CSR_IB10ASID		0x3e3	/* inst breakpoint 10 asid */
+
+#define LOONGARCH_CSR_IB11ADDR		0x3e8	/* inst breakpoint 11 address */
+#define LOONGARCH_CSR_IB11MASK		0x3e9	/* inst breakpoint 11 mask */
+#define LOONGARCH_CSR_IB11CTRL		0x3ea	/* inst breakpoint 11 control */
+#define LOONGARCH_CSR_IB11ASID		0x3eb	/* inst breakpoint 11 asid */
+
+#define LOONGARCH_CSR_IB12ADDR		0x3f0	/* inst breakpoint 12 address */
+#define LOONGARCH_CSR_IB12MASK		0x3f1	/* inst breakpoint 12 mask */
+#define LOONGARCH_CSR_IB12CTRL		0x3f2	/* inst breakpoint 12 control */
+#define LOONGARCH_CSR_IB12ASID		0x3f3	/* inst breakpoint 12 asid */
+
+#define LOONGARCH_CSR_IB13ADDR		0x3f8	/* inst breakpoint 13 address */
+#define LOONGARCH_CSR_IB13MASK		0x3f9	/* inst breakpoint 13 mask */
+#define LOONGARCH_CSR_IB13CTRL		0x3fa	/* inst breakpoint 13 control */
+#define LOONGARCH_CSR_IB13ASID		0x3fb	/* inst breakpoint 13 asid */
+
 #define LOONGARCH_CSR_DEBUG		0x500	/* debug config */
 #define LOONGARCH_CSR_DERA		0x501	/* debug era */
 #define LOONGARCH_CSR_DESAVE		0x502	/* debug save */
diff --git a/arch/loongarch/kernel/hw_breakpoint.c b/arch/loongarch/kernel/hw_breakpoint.c
index a6e4b605bfa8..c35f9bf38033 100644
--- a/arch/loongarch/kernel/hw_breakpoint.c
+++ b/arch/loongarch/kernel/hw_breakpoint.c
@@ -51,7 +51,13 @@ int hw_breakpoint_slots(int type)
 	READ_WB_REG_CASE(OFF, 4, REG, T, VAL);		\
 	READ_WB_REG_CASE(OFF, 5, REG, T, VAL);		\
 	READ_WB_REG_CASE(OFF, 6, REG, T, VAL);		\
-	READ_WB_REG_CASE(OFF, 7, REG, T, VAL);
+	READ_WB_REG_CASE(OFF, 7, REG, T, VAL);		\
+	READ_WB_REG_CASE(OFF, 8, REG, T, VAL);		\
+	READ_WB_REG_CASE(OFF, 9, REG, T, VAL);		\
+	READ_WB_REG_CASE(OFF, 10, REG, T, VAL);		\
+	READ_WB_REG_CASE(OFF, 11, REG, T, VAL);		\
+	READ_WB_REG_CASE(OFF, 12, REG, T, VAL);		\
+	READ_WB_REG_CASE(OFF, 13, REG, T, VAL);
 
 #define GEN_WRITE_WB_REG_CASES(OFF, REG, T, VAL)	\
 	WRITE_WB_REG_CASE(OFF, 0, REG, T, VAL);		\
@@ -61,7 +67,13 @@ int hw_breakpoint_slots(int type)
 	WRITE_WB_REG_CASE(OFF, 4, REG, T, VAL);		\
 	WRITE_WB_REG_CASE(OFF, 5, REG, T, VAL);		\
 	WRITE_WB_REG_CASE(OFF, 6, REG, T, VAL);		\
-	WRITE_WB_REG_CASE(OFF, 7, REG, T, VAL);
+	WRITE_WB_REG_CASE(OFF, 7, REG, T, VAL);		\
+	WRITE_WB_REG_CASE(OFF, 8, REG, T, VAL);		\
+	WRITE_WB_REG_CASE(OFF, 9, REG, T, VAL);		\
+	WRITE_WB_REG_CASE(OFF, 10, REG, T, VAL);	\
+	WRITE_WB_REG_CASE(OFF, 11, REG, T, VAL);	\
+	WRITE_WB_REG_CASE(OFF, 12, REG, T, VAL);	\
+	WRITE_WB_REG_CASE(OFF, 13, REG, T, VAL);
 
 static u64 read_wb_reg(int reg, int n, int t)
 {
-- 
2.42.0

