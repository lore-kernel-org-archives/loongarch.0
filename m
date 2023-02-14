Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6C62569
	for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 15:26:46 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id bd35so5390874pfb.6
        for <loongarch@lists.linux.dev>; Tue, 14 Feb 2023 07:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vTX2F2TrplX3EhIegiab/3E+IwCv8ZrrolJOY/X43qI=;
        b=cVBk39aHq03A7S4pjaSi9XwIDsVx3qTb3qzFJn2KvBXcqjs0zuREdv/SGmq5/yDq7w
         kuyAPoL2/rXQtr9IC2n/gztkvHBjERvbg4s1xAJwtbn0Mqb9zcRbrOlkWSCCK4a5VNsz
         mKDPbr0IVMgu4/Tf9lVcKJmomkOjlNnpzcrwu3EY0j/hfpMzNceqE78hSXFAVj4+t+Ig
         UEvT49IzIN9yrK9LL/5ny+3Q9ltDYp4fp2qz/lEsozizZiO04+egopaq0gArba1MxtSt
         VaNFV4H6moYXI54sY3djmPd1RK+bpuCSJ0XzVUXxlmE33KXf0IoKOy76lk8WoPLtESh3
         ydOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vTX2F2TrplX3EhIegiab/3E+IwCv8ZrrolJOY/X43qI=;
        b=0cKwGL0ZIeRjIsqb2HnEDRjAnZr+7ycYuIwi/QsF2oyCrAKWAbB6KktoAQOhbHv+jl
         g8uJhmoIffBbasDflEfxm0gRKbYerIOmFbKIkIeL5PNXkhAWp7/iCzOyyajzTgKsjfys
         MrloFLTA5LinQt9spY02If2BJo3UblR3wecgzzc09qALdk21pzlbWTDYIjYDCSS6gEVg
         VUMPDvikosMlmscOYYQDbIVUtC6i2nHIr3vaKhsJ4UsbIrD9be4xlhLuOELSZhKxqDFd
         xjQNrBOaA9NEoM78eT34iSEcmpkXeiTnNt4aOmXMoYako0HAnoHI5XXAT1rVazP3t3j1
         AJ4A==
X-Gm-Message-State: AO0yUKWgcmWyuPSIXiu5qc5TdBIZuIZ1MnONjoaAdZh4XpRC6TFE7sTE
	p3NBcKXA48hwQYb6l3n4MVo=
X-Google-Smtp-Source: AK7set/tDKzzBEnN43HEgzoCe5LIepdUP8bXEDO8AG49ol8YYY7wy25/WjsRd4CCUMrEeYgg2yWmzw==
X-Received: by 2002:a62:30c4:0:b0:590:921d:5740 with SMTP id w187-20020a6230c4000000b00590921d5740mr1795217pfw.13.1676388405969;
        Tue, 14 Feb 2023 07:26:45 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.8])
        by smtp.gmail.com with ESMTPSA id d17-20020aa78151000000b005810a54fdefsm9951938pfn.114.2023.02.14.07.26.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 07:26:45 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: bpf@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: hengqi.chen@gmail.com
Subject: [PATCH v2] LoongArch: BPF: Use 4 instructions for function address in JIT
Date: Tue, 14 Feb 2023 15:26:33 +0000
Message-Id: <20230214152633.2265699-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch fixes the following issue of function calls in JIT, like:

  [   29.346981] multi-func JIT bug 105 != 103

The issus can be reproduced by running the "inline simple bpf_loop call"
verifier test.

This is because we are emiting 2-4 instructions for 64-bit immediate moves.
During the first pass of JIT, the placeholder address is zero, emiting two
instructions for it. In the extra pass, the function address is in XKVRANGE,
emiting four instructions for it. This change the instruction index in
JIT context. Let's always use 4 instructions for function address in JIT.
So that the instruction sequences don't change between the first pass and
the extra pass for function calls.

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c |  2 +-
 arch/loongarch/net/bpf_jit.h | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index c4b1947ebf76..288003a9f0ca 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -841,7 +841,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 		if (ret < 0)
 			return ret;

-		move_imm(ctx, t1, func_addr, is32);
+		move_addr(ctx, t1, func_addr);
 		emit_insn(ctx, jirl, t1, LOONGARCH_GPR_RA, 0);
 		move_reg(ctx, regmap[BPF_REG_0], LOONGARCH_GPR_A0);
 		break;
diff --git a/arch/loongarch/net/bpf_jit.h b/arch/loongarch/net/bpf_jit.h
index ca708024fdd3..c335dc4eed37 100644
--- a/arch/loongarch/net/bpf_jit.h
+++ b/arch/loongarch/net/bpf_jit.h
@@ -82,6 +82,27 @@ static inline void emit_sext_32(struct jit_ctx *ctx, enum loongarch_gpr reg, boo
 	emit_insn(ctx, addiw, reg, reg, 0);
 }

+static inline void move_addr(struct jit_ctx *ctx, enum loongarch_gpr rd, u64 addr)
+{
+	u64 imm_11_0, imm_31_12, imm_51_32, imm_63_52;
+
+	/* lu12iw rd, imm_31_12 */
+	imm_31_12 = (addr >> 12) & 0xfffff;
+	emit_insn(ctx, lu12iw, rd, imm_31_12);
+
+	/* ori rd, rd, imm_11_0 */
+	imm_11_0 = addr & 0xfff;
+	emit_insn(ctx, ori, rd, rd, imm_11_0);
+
+	/* lu32id rd, imm_51_32 */
+	imm_51_32 = (addr >> 32) & 0xfffff;
+	emit_insn(ctx, lu32id, rd, imm_51_32);
+
+	/* lu52id rd, rd, imm_63_52 */
+	imm_63_52 = (addr >> 52) & 0xfff;
+	emit_insn(ctx, lu52id, rd, rd, imm_63_52);
+}
+
 static inline void move_imm(struct jit_ctx *ctx, enum loongarch_gpr rd, long imm, bool is32)
 {
 	long imm_11_0, imm_31_12, imm_51_32, imm_63_52, imm_51_0, imm_51_31;
--
2.31.1
