Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 919EE7C
	for <loongarch@lists.linux.dev>; Thu, 13 Jul 2023 03:05:22 +0000 (UTC)
Received: from loongson.cn (unknown [117.82.195.59])
	by gateway (Coremail) with SMTP id _____8DxqOrwaa9k0UEEAA--.2365S3;
	Thu, 13 Jul 2023 11:05:20 +0800 (CST)
Received: from localhost.localdomain (unknown [117.82.195.59])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8CxriPuaa9kSZ4rAA--.16906S2;
	Thu, 13 Jul 2023 11:05:20 +0800 (CST)
From: WANG Rui <wangrui@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: Jun Yi <yijun@loongson.cn>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WANG Rui <wangrui@loongson.cn>,
	stable@vger.kernel.org,
	Weihao Li <liweihao@loongson.cn>
Subject: [PATCH] LoongArch: Fix return value underflow in exception path
Date: Thu, 13 Jul 2023 11:04:53 +0800
Message-ID: <20230713030453.7404-1-wangrui@loongson.cn>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8CxriPuaa9kSZ4rAA--.16906S2
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7CrWxZFW3KFW3tw45Gw47WrX_yoW8Zw4fpr
	y7Arn7KF48WFyfZa4YvF9YqrWrXF47Ww17uF4xAryrGa4DZFn5uryrGasxXFs0q395Xr10
	qr1rKF4rCF48JwbCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkFb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv
	67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jUsqXUUUUU=

This patch fixes an underflow issue in the return value within the
exception path, specifically at .Llt8 when the remaining length is less
than 8 bytes.

Cc: stable@vger.kernel.org
Fixes: 8941e93ca590 ("LoongArch: Optimize memory ops (memset/memcpy/memmove)")
Reported-by: Weihao Li <liweihao@loongson.cn>
Signed-off-by: WANG Rui <wangrui@loongson.cn>
---
 arch/loongarch/lib/clear_user.S | 3 ++-
 arch/loongarch/lib/copy_user.S  | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/lib/clear_user.S b/arch/loongarch/lib/clear_user.S
index fd1d62b244f2..9dcf71719387 100644
--- a/arch/loongarch/lib/clear_user.S
+++ b/arch/loongarch/lib/clear_user.S
@@ -108,6 +108,7 @@ SYM_FUNC_START(__clear_user_fast)
 	addi.d	a3, a2, -8
 	bgeu	a0, a3, .Llt8
 15:	st.d	zero, a0, 0
+	addi.d	a0, a0, 8
 
 .Llt8:
 16:	st.d	zero, a2, -8
@@ -188,7 +189,7 @@ SYM_FUNC_START(__clear_user_fast)
 	_asm_extable 13b, .L_fixup_handle_0
 	_asm_extable 14b, .L_fixup_handle_1
 	_asm_extable 15b, .L_fixup_handle_0
-	_asm_extable 16b, .L_fixup_handle_1
+	_asm_extable 16b, .L_fixup_handle_0
 	_asm_extable 17b, .L_fixup_handle_s0
 	_asm_extable 18b, .L_fixup_handle_s0
 	_asm_extable 19b, .L_fixup_handle_s0
diff --git a/arch/loongarch/lib/copy_user.S b/arch/loongarch/lib/copy_user.S
index b21f6d5d38f5..fecd08cad702 100644
--- a/arch/loongarch/lib/copy_user.S
+++ b/arch/loongarch/lib/copy_user.S
@@ -136,6 +136,7 @@ SYM_FUNC_START(__copy_user_fast)
 	bgeu	a1, a4, .Llt8
 30:	ld.d	t0, a1, 0
 31:	st.d	t0, a0, 0
+	addi.d	a0, a0, 8
 
 .Llt8:
 32:	ld.d	t0, a3, -8
@@ -246,7 +247,7 @@ SYM_FUNC_START(__copy_user_fast)
 	_asm_extable 30b, .L_fixup_handle_0
 	_asm_extable 31b, .L_fixup_handle_0
 	_asm_extable 32b, .L_fixup_handle_0
-	_asm_extable 33b, .L_fixup_handle_1
+	_asm_extable 33b, .L_fixup_handle_0
 	_asm_extable 34b, .L_fixup_handle_s0
 	_asm_extable 35b, .L_fixup_handle_s0
 	_asm_extable 36b, .L_fixup_handle_s0
-- 
2.41.0

