Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EE88C01
	for <loongarch@lists.linux.dev>; Fri, 27 Oct 2023 06:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OwOvHlwg"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2800229592aso1001307a91.2
        for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 23:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698386489; x=1698991289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWzFDBlrCucXbuh5gH/vQd/Yt8pKHvjRpmiR9c5r4z8=;
        b=OwOvHlwgNU/1yHFY1V7l+tQeZfw9Vmu/jQaNO+dTzeUDzS8SX5PineBSArihBMSma2
         uY60oEOlEWWdR1m1zil7VYM1ejsnByjByqNgDg82zGUocrAfqAkATVudWVbB/AKFy5nL
         YNscvMJdu2JYeEsHT9HZEKGSMgrR4Ivv6PVGYND0JtlvE+1LpAaa4mFrpC4oGS6It06G
         5fSJhgGBiHTGXopXIK/z4ADNVtyyuNAasKiI783WV3tXtuXlTrkbBf2HeF2a13ox1G5d
         mv93HPVstVEdslDuImFrTbmggoArEuokvs0UYfqZv2io7qfkFp4gPBfdpW3qzGThbjtS
         gtWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698386489; x=1698991289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWzFDBlrCucXbuh5gH/vQd/Yt8pKHvjRpmiR9c5r4z8=;
        b=l5M9ptuGqhrVrp4cAYQMwkeRWHFJNQajdy0GLZqKgg5JoZ8dLqGh2U3aRGyvVh+qJJ
         dsVWwZiUjew+qXe6jF1nXakPUY7zW7G1CSRxeA+GJKappcd7Qu5UHTdVtUYd+Yy46EWY
         gjPxABp2l4D+rgX2mGDChiEWCCxWqPPc+Pn8/E+uaUnm+XzdRZBYVFoE588znYhC66Va
         PyzibU2xQRBNL4Ubb96F+IxpRIMkvO+QJLDq51AfRyToZDoJWeqrDETlMms5Ib5EKGLT
         f0I7Ksa67Avs9bI3gpmtdB1A52u1JWs6g3W9jpBikDwUwzkqGDqT4SmmFTFE8XnJg8/z
         vy5g==
X-Gm-Message-State: AOJu0Yz/38NWJivoVnotRI51UGlvYYR9kM5g3gNPaeJjvnm+EPgC/QkY
	5+6cMEnS1rs2P9OLtdy3hpYzNFQThN/1sg==
X-Google-Smtp-Source: AGHT+IEgaSgxsA8ckgC4SVIe+CC8eYEBsm/X0UUFfamFblf24Hb9Jb0oZED6z29P/GkbWh4L7jz1Mw==
X-Received: by 2002:a17:90a:6f03:b0:27d:6b5:9e07 with SMTP id d3-20020a17090a6f0300b0027d06b59e07mr1649997pjk.1.1698386488891;
        Thu, 26 Oct 2023 23:01:28 -0700 (PDT)
Received: from ubuntu.. ([43.132.98.47])
        by smtp.googlemail.com with ESMTPSA id z2-20020a17090a1fc200b00277337818afsm1113667pjz.0.2023.10.26.23.01.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 23:01:28 -0700 (PDT)
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
Subject: [PATCH bpf-next 7/8] LoongArch: BPF: Support signed mod instructions
Date: Thu, 26 Oct 2023 18:43:36 +0000
Message-Id: <20231026184337.563801-8-hengqi.chen@gmail.com>
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

Add support for signed mod instructions.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 7c0d129b82a4..169ff8b3915e 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -588,20 +588,36 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	/* dst = dst % src */
 	case BPF_ALU | BPF_MOD | BPF_X:
 	case BPF_ALU64 | BPF_MOD | BPF_X:
-		emit_zext_32(ctx, dst, is32);
-		move_reg(ctx, t1, src);
-		emit_zext_32(ctx, t1, is32);
-		emit_insn(ctx, moddu, dst, dst, t1);
-		emit_zext_32(ctx, dst, is32);
+		if (!off) {
+			emit_zext_32(ctx, dst, is32);
+			move_reg(ctx, t1, src);
+			emit_zext_32(ctx, t1, is32);
+			emit_insn(ctx, moddu, dst, dst, t1);
+			emit_zext_32(ctx, dst, is32);
+		} else {
+			emit_sext_32(ctx, dst, is32);
+			move_reg(ctx, t1, src);
+			emit_sext_32(ctx, t1, is32);
+			emit_insn(ctx, modd, dst, dst, t1);
+			emit_sext_32(ctx, dst, is32);
+		}
 		break;
 
 	/* dst = dst % imm */
 	case BPF_ALU | BPF_MOD | BPF_K:
 	case BPF_ALU64 | BPF_MOD | BPF_K:
-		move_imm(ctx, t1, imm, is32);
-		emit_zext_32(ctx, dst, is32);
-		emit_insn(ctx, moddu, dst, dst, t1);
-		emit_zext_32(ctx, dst, is32);
+		if (!off) {
+			move_imm(ctx, t1, imm, is32);
+			emit_zext_32(ctx, dst, is32);
+			emit_insn(ctx, moddu, dst, dst, t1);
+			emit_zext_32(ctx, dst, is32);
+		} else {
+			move_imm(ctx, t1, imm, false);
+			emit_sext_32(ctx, t1, is32);
+			emit_sext_32(ctx, dst, is32);
+			emit_insn(ctx, modd, dst, dst, t1);
+			emit_sext_32(ctx, dst, is32);
+		}
 		break;
 
 	/* dst = -dst */
-- 
2.34.1

