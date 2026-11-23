Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=114.242.206.163
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795408757;
	b=0Zr1QAZN6Uupk7TP75wQLtJPm8ug3yfJS5gigc0YTdJ3Ib+ESRIXH+z0VjuKcHoOLZHn
	 uBv5VD/fvojxR+qgaqrfWd53maOMuQnGht5M0gsYGieX88Av0cD1+GATia2w2SAShQVvg
	 +1WOy4HzN7JY6YWaALZoSzGXb2+GZ25jPkAQJaE4vzZZY/hMV1xr1GsBqG8k0LENSNpKg
	 u51V0zFt7unsH0yvMwuPKFaod8gy6YqZtlQBiygpdKeASW9/z8MCNlq4RUKCUCfOKKjNN
	 pr85ENmvnj2aWrZlGT4YFyAMmMz5dEtpDpq3atqq8O9HIFQSh4jUBQD1GpamxX76plw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795408757;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-CM-SenderInfo:
	 X-Coremail-Antispam;
	bh=ZpBqNDeMQl4YytbtlYqAfP/xkPPhADrTeLTX5f7dp8k=;
	b=3ue07+cBoHApAsL5kSHPNuSTYCgrvEOdAa+G1CdFFflEFDy01nedGlJCehUv+uTY/uw8
	 CLRa5icBNS5wFj/VeuxRFApmRzJdiJzKQi47UZTAHuJ3fM/8/ypJNUtyAWNPwEPuR0emg
	 II5i1m92kCRp2XQPCx2941JvgeVMOlAKBHlPfQXLVWkF5Lte97N54IVui9j4UCcT8HOdw
	 fLrXj3+s0SUfwxFL4bo2FB3JBGDjSF5ziOw6j7kF8MTPV0HYZBkO0BOVq5Huy93BQJLva
	 6PvwGAZGkoA8tV4QtLtMLjhDeanIVSwzEys9c52BY/rJL/qD//DGsgGj0rDccRD9fzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=loongson.cn;
	spf=pass smtp.mailfrom=loongson.cn;
	arc=none smtp.remote-ip=114.242.206.163
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64A72606A330
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 04:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A72606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [123.138.236.242])
	by gateway (Coremail) with SMTP id _____8AxntJywwNrEx0iAA--.31590S3;
	Mon, 23 Nov 2026 12:39:14 +0800 (CST)
Received: from linux.localdomain (unknown [123.138.236.242])
	by front1 (Coremail) with SMTP id qMiowJCxPs9rwwNra8s2AA--.43419S4;
	Mon, 23 Nov 2026 12:39:13 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Huacai Chen <chenhuacai@kernel.org>,
	Hengqi Chen <hengqi.chen@gmail.com>
Cc: loongarch@lists.linux.dev,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/4] LoongArch: BPF: Add support for instructions array
Date: Mon, 23 Nov 2026 12:39:05 +0800
Message-ID: <20261123043907.20225-3-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20261123043907.20225-1-yangtiezhu@loongson.cn>
References: <20261123043907.20225-1-yangtiezhu@loongson.cn>
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
X-CM-TRANSID:qMiowJCxPs9rwwNra8s2AA--.43419S4
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WF45Zr4kZryktryDWF1fKrX_yoW8Gw1rpa
	sxCF9xAr4DWr4UGFnrJay5uryfta1DWrW3X398urWFgF90qr4kJayFkwn09an5Jrs5Ar1k
	Ww4FkrnIga4kAacCm3ZEXasCq-sJn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUk2b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6xACxx
	1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1q6rW5McIj6I8E87Iv
	67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU

Add support for the instructions array map type in the LoongArch
JIT by calling bpf_prog_update_insn_ptrs() with the offsets that
map xlated_offset to the jited_offset in the final image.

LoongArch JIT already has this offset array which was being used
for bpf_prog_fill_jited_linfo() and can be used directly for the
function bpf_prog_update_insn_ptrs().

This is similar to commit 84b1c40d5b4d ("bpf: arm64: Add support
for instructions array").

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/loongarch/net/bpf_jit.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 873b2b146f02..415b945bf818 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -2401,6 +2401,13 @@ struct bpf_prog *bpf_int_jit_compile(struct bpf_verifier_env *env, struct bpf_pr
 		for (i = 0; i <= prog->len; i++)
 			ctx.offset[i] *= LOONGARCH_INSN_SIZE;
 		bpf_prog_fill_jited_linfo(prog, ctx.offset + 1);
+		/*
+		 * The bpf_prog_update_insn_ptrs function expects offsets to
+		 * point to the first byte of the jitted instruction (unlike
+		 * the bpf_prog_fill_jited_linfo above, which, for historical
+		 * reasons, expects to point to the next instruction)
+		 */
+		bpf_prog_update_insn_ptrs(prog, ctx.offset, ctx.ro_image);
 
 out_offset:
 		kvfree(ctx.offset);
-- 
2.42.0

