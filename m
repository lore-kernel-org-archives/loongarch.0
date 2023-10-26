Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A59379DE
	for <loongarch@lists.linux.dev>; Fri, 27 Oct 2023 06:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RelA7yx+"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-27cfb8442f9so1425261a91.2
        for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 23:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698386486; x=1698991286; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXv9dn4i8m4RUIoprh3jAeTLejyEjZe30vXJvAEpPQI=;
        b=RelA7yx+IcoDPN9wR8h+tVsMYWPIGgdQlrmhW0FQyrO+mDHmnb0CyMX4EAO16qfrAl
         YfmXVOjlNYs3PlgBgeE9E8uveSkAHUwsxl3GBS1rg8BgOpxnwIn19ASzqX9AbH/WkZIW
         t/TFnuVeQweRYpB3ZZ0EW0pzjrJ+PkardOfkq+p/pNiz0pkb/aUIgqXnZ1WFCv+znQoT
         hM3NdEjS8MHhMB3XhwWQym2QWt25i1P91lHUFLBLcDsPNTLu94Zbk+9rjUpOMcqpE94c
         pdlUTSuTf1/74a7TPhT564Ay07+pslf2EVruUp+Fcahs2PQmO1ttr/J48cAB7P5Us/og
         SbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698386486; x=1698991286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXv9dn4i8m4RUIoprh3jAeTLejyEjZe30vXJvAEpPQI=;
        b=ZHoY+7r21PbPONCu1GGLId6GMOrdlEVnVa06hmO318LxAVrQcl7D2Z62BcWbOP6Vex
         th5AxXJ1l0RiPALHb4EVTicLK2lmCaxW6HBntwv3CZWR9EHVFsI6oq441QDqKRc+ETKQ
         lIQYf41gYS+2NnkHPgVX4+BE4/ewzFN6BBXdqTNagGf/n/FyDHRhGdwv7wNIrNBuvn00
         3ZxMivAAtRfoycQcJ1pC0Iza3yF7uhmqpkPFHpZXko/7idsuTzODbeXEgiQqb0JQw+MI
         Lp7gLdvsxfB5Ss+ZpONA3hkbv5WBNNgs5NrBXUOL9cmNpsDPsllg15ihRBE0UbSxMSIC
         IX1w==
X-Gm-Message-State: AOJu0Ywgh5LZAzNDOGDvNHIB3JxE2mEs2PgTfv1RsDHwbf01cyL05mxK
	kztQRmWWyiKTQhdYZyE0qP/wWPAmx4Io/g==
X-Google-Smtp-Source: AGHT+IFiVPAOA9+35Jg4JjLI0IlKVNR+C1+6tE2tw5V9YMxPmaqIL13TxeO8q1y4Gjwqe7cV/wMzxQ==
X-Received: by 2002:a17:90a:ad91:b0:27d:b9d:bd6f with SMTP id s17-20020a17090aad9100b0027d0b9dbd6fmr1567936pjq.45.1698386485857;
        Thu, 26 Oct 2023 23:01:25 -0700 (PDT)
Received: from ubuntu.. ([43.132.98.47])
        by smtp.googlemail.com with ESMTPSA id z2-20020a17090a1fc200b00277337818afsm1113667pjz.0.2023.10.26.23.01.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 23:01:25 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	yangtiezhu@loongson.cn,
	hengqi.chen@gmail.com
Subject: [PATCH bpf-next 6/8] LoongArch: BPF: Support signed div instructions
Date: Thu, 26 Oct 2023 18:43:35 +0000
Message-Id: <20231026184337.563801-7-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026184337.563801-1-hengqi.chen@gmail.com>
References: <20231026184337.563801-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for signed div instructions.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 050fcf233a34..7c0d129b82a4 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -553,20 +553,36 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	/* dst = dst / src */
 	case BPF_ALU | BPF_DIV | BPF_X:
 	case BPF_ALU64 | BPF_DIV | BPF_X:
-		emit_zext_32(ctx, dst, is32);
-		move_reg(ctx, t1, src);
-		emit_zext_32(ctx, t1, is32);
-		emit_insn(ctx, divdu, dst, dst, t1);
-		emit_zext_32(ctx, dst, is32);
+		if (!off) {
+			emit_zext_32(ctx, dst, is32);
+			move_reg(ctx, t1, src);
+			emit_zext_32(ctx, t1, is32);
+			emit_insn(ctx, divdu, dst, dst, t1);
+			emit_zext_32(ctx, dst, is32);
+		} else {
+			emit_sext_32(ctx, dst, is32);
+			move_reg(ctx, t1, src);
+			emit_sext_32(ctx, t1, is32);
+			emit_insn(ctx, divd, dst, dst, t1);
+			emit_sext_32(ctx, dst, is32);
+		}
 		break;
 
 	/* dst = dst / imm */
 	case BPF_ALU | BPF_DIV | BPF_K:
 	case BPF_ALU64 | BPF_DIV | BPF_K:
-		move_imm(ctx, t1, imm, is32);
-		emit_zext_32(ctx, dst, is32);
-		emit_insn(ctx, divdu, dst, dst, t1);
-		emit_zext_32(ctx, dst, is32);
+		if (!off) {
+			move_imm(ctx, t1, imm, is32);
+			emit_zext_32(ctx, dst, is32);
+			emit_insn(ctx, divdu, dst, dst, t1);
+			emit_zext_32(ctx, dst, is32);
+		} else {
+			move_imm(ctx, t1, imm, false);
+			emit_sext_32(ctx, t1, is32);
+			emit_sext_32(ctx, dst, is32);
+			emit_insn(ctx, divd, dst, dst, t1);
+			emit_sext_32(ctx, dst, is32);
+		}
 		break;
 
 	/* dst = dst % src */
-- 
2.34.1

