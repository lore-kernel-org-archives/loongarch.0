Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC2F10E7
	for <loongarch@lists.linux.dev>; Sun, 12 Feb 2023 03:52:59 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id d8so9249051plr.10
        for <loongarch@lists.linux.dev>; Sat, 11 Feb 2023 19:52:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hA3IP0EbHRoML81/juFYStllsBM72tyAWPCxGp78Zw=;
        b=b3OB5PiJ1CXthmneNF/B9Wj2k4dwIrxhOSGQvSfxodeWP3/0sAn3wTh957DzP2T7V1
         0ivg7lf7yfWNKpjpc50dDcXJ/xuqsXxTxb2rLOYSUig+LtZWBc8WWs6n5yDoMD1HMGjC
         ohindg499u5UWix7AGserjKVxDcOcjWgPshN5OEEBkb2iBQXmdXYN6HMHtE6NrCefYu5
         VHd/XVW5Nn7bgEyOXuJYCX4cv8mGumwGyWtwdOi91VceUB8qd43M1U2xFDqZ8jwCuxyy
         MClSDaaW1STM2uR01dnftvXaAIU/xoRGx//LsGEm36RVKGBJjePPC4Sp8RNtZCydaBwI
         h5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hA3IP0EbHRoML81/juFYStllsBM72tyAWPCxGp78Zw=;
        b=gfDQEA5shLFTYzxyAxRGksebhCTCBnOnfEQlVSjxidiU0pNP5voefTb8OLiBrkBw2u
         ypVyMflLtFSLsoZ+Tqbu96bhvJEuO2PYsZU5eLJH9zC6uz8bFmiU5Vp1oIo8V6nmC8+4
         cm0nxmNw2JVfLzbnoP8p6gOgo8HrRwUxBD2q20mFAU/kYBVUMORkd9bym4NZww/4Jf/b
         lCXAXSvUhonny3xDp8/7pmEjQze0s5m2XaBK7a9fpIGRehpimo/aa5oFoULaIjBhiKio
         vnr9eVqKrFMEvEls68m6L/g8FjKNtKadtdAN6d7NCiZDIpYc5CVE9mCKHKezMHuu9t0H
         UY2w==
X-Gm-Message-State: AO0yUKWgbB4TQG8LSxoRYU7N6h6+YDWWs81w45XAW1/1DuDP4WlK3QuL
	mr9d+BTiYPyrRFET3GfHVUA=
X-Google-Smtp-Source: AK7set/A1OcyJ2w19fBpsJRXWqZ4xbxNpu62Z9iwsaKHIgOI3LaasCYkYwOKGsY2P7362uHMki0AuA==
X-Received: by 2002:a05:6a20:6990:b0:b8:a17c:75e4 with SMTP id t16-20020a056a20699000b000b8a17c75e4mr22766775pzk.48.1676173979232;
        Sat, 11 Feb 2023 19:52:59 -0800 (PST)
Received: from localhost.localdomain ([43.132.141.9])
        by smtp.gmail.com with ESMTPSA id s1-20020a63dc01000000b004fab4455748sm5055399pgg.75.2023.02.11.19.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 19:52:58 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: bpf@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: hengqi.chen@gmail.com
Subject: [PATCH 1/2] LoongArch: BPF: Treat function address as 64-bit value
Date: Sun, 12 Feb 2023 11:52:35 +0800
Message-Id: <20230212035236.1436532-2-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230212035236.1436532-1-hengqi.chen@gmail.com>
References: <20230212035236.1436532-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Let's always use 4 instructions for function address in JIT.
So that the instruction sequences don't change between the first
pass and the extra pass for function calls.

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index c4b1947ebf76..2d952110be72 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -446,6 +446,27 @@ static int add_exception_handler(const struct bpf_insn *insn,
 	return 0;
 }
 
+static inline void emit_addr_move(struct jit_ctx *ctx, enum loongarch_gpr rd, u64 addr)
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
 static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool extra_pass)
 {
 	u8 tm = -1;
@@ -841,7 +862,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 		if (ret < 0)
 			return ret;
 
-		move_imm(ctx, t1, func_addr, is32);
+		emit_addr_move(ctx, t1, func_addr);
 		emit_insn(ctx, jirl, t1, LOONGARCH_GPR_RA, 0);
 		move_reg(ctx, regmap[BPF_REG_0], LOONGARCH_GPR_A0);
 		break;
-- 
2.31.1

