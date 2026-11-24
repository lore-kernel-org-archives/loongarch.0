Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795496688;
	b=HYhLHssJwYtZIWj9iWrjBMAckicqX6FCgfKzGjfYedjFaeizRAcpgDII8rdIvLd5vKyT
	 bQRk++udd24lefNgkgXJVWI/AbnSMo5A+8RjNBTZJmOvzMeF3V2ih5GNxGgAD32MJUVIQ
	 hK6/TvoYVu29du8Je+Zi1hLgt/y5JRgysAtCRcrzmDIclXSVAjatEFoGLb3ibQbV1TmqX
	 Uk/dIuqpfvaEDqb1MO7Lwt+dZWRbh+Fzka4ohqir/M/uNZ8a1YcTn1ALUXYT/OpIVm+pU
	 ysyW9qzbq5006YPfm+WJBiitI5ixX4IQGch7S6OZBWaaVldYrSg6zWz4VC/mqJSjXHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795496688;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-CM-SenderInfo:X-Coremail-Antispam;
	bh=S9siEsISEhUmobrHfk43GWP8sT+YJJExitvIuJS0LwQ=;
	b=nNVBAb0bqzjNdeqGlwLlnKU7cU4NTA4fQ4V89sy4MsCtN0BxkSATzXLh/bQoG9259wxE
	 DMOzdXM99M5CWo30ylPOuheyVRL1wOb59tEQXwejUYmEHN3QZ2Rtl1Csjs2hNEU/cwqTS
	 2aIKZlWvoO14rweNFaqfRk9aiB43M3IKud3oS1rXAmdJXo5dBd7NJmk+VPEtPnu0n9yvI
	 q/fDoczIm2BqjE6oS7/y8ZYC2bqz/vNI3+X0ClCE7XfpBefBud0smMVXGtSdTiQkKyRvn
	 /5yLq8ntbYnvRoGKBUVEMvhC5hZKagtRapMEPNTOCM6rlwVmzRMTjUA2ilmfY+ENB9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1F94606A321
	for <loongarch@lists.linux.dev>; Tue, 24 Nov 2026 05:04:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F94606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxS_DmGgVrgHUiAA--.32708S3;
	Tue, 24 Nov 2026 13:04:38 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxNs3lGgVr3_82AA--.30298S2;
	Tue, 24 Nov 2026 13:04:38 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] LoongArch: BPF: Add support for UHMUL and SHMUL
Date: Tue, 24 Nov 2026 13:04:37 +0800
Message-ID: <20261124050437.392-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qMiowJCxNs3lGgVr3_82AA--.30298S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7uFy3uw1rtw17XF47CF1kCrX_yoW5JFy3pr
	ZFkrn5Crs5XFySqF9rJwsrur43tan3Cry2qF1ayayfJrW3Xa45XF18KwnrKFZ3JaykXFsY
	gr429rn8uFy3J3gCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUkYb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27w
	Aqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE
	14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8j-e5UUUUU==

Implement JIT lowering for UHMUL and SHMUL on LoongArch by utilizing
hardware multiplication instructions MULH.{DU,D} and enabling support
via bpf_jit_supports_hmul().

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
Not tested yet, just RFC.

 arch/loongarch/include/asm/inst.h |  2 ++
 arch/loongarch/net/bpf_jit.c      | 24 ++++++++++++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index e061f966f7d1..fd6b39d5f0d0 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -777,6 +777,8 @@ DEF_EMIT_REG3_FORMAT(subw, subw_op)
 DEF_EMIT_REG3_FORMAT(subd, subd_op)
 DEF_EMIT_REG3_FORMAT(mulw, mulw_op)
 DEF_EMIT_REG3_FORMAT(muld, muld_op)
+DEF_EMIT_REG3_FORMAT(mulhd, mulhd_op)
+DEF_EMIT_REG3_FORMAT(mulhdu, mulhdu_op)
 DEF_EMIT_REG3_FORMAT(divw, divw_op)
 DEF_EMIT_REG3_FORMAT(divd, divd_op)
 DEF_EMIT_REG3_FORMAT(modw, modw_op)
diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 567729921d6d..b12da3e422c6 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -683,6 +683,21 @@ static int add_exception_handler(const struct bpf_insn *insn,
 	return 0;
 }
 
+static void emit_various_muld(struct jit_ctx *ctx, u8 dst, u8 src, s16 off)
+{
+	switch (off) {
+	case BPF_UHMUL:
+		emit_insn(ctx, mulhdu, dst, dst, src);
+		break;
+	case BPF_SHMUL:
+		emit_insn(ctx, mulhd, dst, dst, src);
+		break;
+	default:
+		emit_insn(ctx, muld, dst, dst, src);
+		break;
+	}
+}
+
 static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool extra_pass)
 {
 	u8 tm = -1;
@@ -804,7 +819,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 		emit_insn(ctx, mulw, dst, dst, src);
 		break;
 	case BPF_ALU64 | BPF_MUL | BPF_X:
-		emit_insn(ctx, muld, dst, dst, src);
+		emit_various_muld(ctx, dst, src, off);
 		break;
 
 	/* dst = dst * imm */
@@ -814,7 +829,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 		break;
 	case BPF_ALU64 | BPF_MUL | BPF_K:
 		move_imm(ctx, t1, imm);
-		emit_insn(ctx, muld, dst, dst, t1);
+		emit_various_muld(ctx, dst, t1, off);
 		break;
 
 	/* dst = dst / src */
@@ -2571,3 +2586,8 @@ bool bpf_jit_supports_callx(void)
 {
 	return true;
 }
+
+bool bpf_jit_supports_hmul(void)
+{
+	return true;
+}
-- 
2.42.0

