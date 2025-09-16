Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0672230EF80
	for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 12:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758025525; cv=none; b=GnfEsBOVHCD+c8g9b1FCBnCCyY/Ewq9Zhn8BDBXpNFXbLw8ybEQp96LeaiifnkzBA+mbbPtF7WlYUfrNPl9qcz+GpgmOJ+FOJ+spJ4e+YtF8trLatQI3HzPlLI7ALW47XRMq7ov86kwn3cFmRWWodx7dixnW1njsLOzEV+L8YCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758025525; c=relaxed/simple;
	bh=biYVcZsr6avenyL+S5XwG0aYxE0pUuqhJ7XB6H97Aa4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PocqbIkUrQck9qPQpySYhqqT7aEZDMjodtTaEh/UPv6ujRWMCa8F0FL9r5AyRRO8/3eAdQGMEaAJWpn5hZut4XrZ5qnhUkjPe1D0ZCvbSembbrpw1rQ6q9N7n+dSrK67L7Q6DmHkrhB5FQ1uUm4Jn1iIk03iThrKJBGtOYqjaKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8Cxf9MtV8lo+_EKAA--.23267S3;
	Tue, 16 Sep 2025 20:25:17 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowJCxXMEsV8lo4VSZAA--.42297S4;
	Tue, 16 Sep 2025 20:25:17 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: WANG Rui <wangrui@loongson.cn>,
	rust-for-linux@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] objtool/LoongArch: Mark types based on break immediate code
Date: Tue, 16 Sep 2025 20:25:15 +0800
Message-ID: <20250916122516.21013-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250916122516.21013-1-yangtiezhu@loongson.cn>
References: <20250916122516.21013-1-yangtiezhu@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxXMEsV8lo4VSZAA--.42297S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uF1DXF45CFyUtr4rur45Arc_yoW8GrWfpr
	s8ur9Fgr4UWF1fAwn7J3yUXas8JrZ3WrWIgF1Sg34Ikr9aq3s8Xr1UKFnFkFs7K3yFga48
	XFnxZr17uF4YywcCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk0b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx1l5I
	8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv67AK
	xVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Gr0_Xr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

If the break immediate code is 0, it should mark the type
as INSN_TRAP. If the break immediate code is 1, it should
mark the type as INSN_BUG.

While at it, format the code style and add the code comment
for nop.

Suggested-by: WANG Rui <wangrui@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 tools/objtool/arch/loongarch/decode.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/objtool/arch/loongarch/decode.c b/tools/objtool/arch/loongarch/decode.c
index 707f339b1840..2e555c4060c5 100644
--- a/tools/objtool/arch/loongarch/decode.c
+++ b/tools/objtool/arch/loongarch/decode.c
@@ -331,10 +331,16 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
 	if (decode_insn_reg3_fomat(inst, insn))
 		return 0;
 
-	if (inst.word == 0)
+	if (inst.word == 0) {
+		/* andi $zero, $zero, 0x0 */
 		insn->type = INSN_NOP;
-	else if (inst.reg0i15_format.opcode == break_op) {
-		/* break */
+	} else if (inst.reg0i15_format.opcode == break_op &&
+		   inst.reg0i15_format.immediate == 0x0) {
+		/* break 0x0 */
+		insn->type = INSN_TRAP;
+	} else if (inst.reg0i15_format.opcode == break_op &&
+		   inst.reg0i15_format.immediate == 0x1) {
+		/* break 0x1 */
 		insn->type = INSN_BUG;
 	} else if (inst.reg2_format.opcode == ertn_op) {
 		/* ertn */
-- 
2.42.0

