Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD5F883C
	for <loongarch@lists.linux.dev>; Fri, 27 Oct 2023 06:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EOJQ3VJk"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6b89ab5ddb7so1696113b3a.0
        for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 23:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698386483; x=1698991283; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCu11tyAMn6bcFBf0dU4cUbsZOD9OVnoAoPidBrK0dw=;
        b=EOJQ3VJkhmxTzWEmeA33HXD1Vwn4U37IVVVJufvk/zBvuHCK7WZcGz5rNPr+MqxcUy
         jDSdKhTpW7i9HjrUlK4lalmD+uUPrIlKTULuf4CUEXcz5Y7Hb7TiY7jiIuUpUjA0s5lP
         eWDuy8OHSa82odtUAqx1Ctqde8h1y0XqWKBJ8ze8DCN9j0ms6B1f/37yd6Aq5sxmeyr6
         ileneq9M6BZIjjbWHCUnjEohB0fvmCIiuF+ADmRVbzoYt2tqXkRGqVAecAhWAW5Vgpjn
         ktqu01b/6hc3l0s9tuhvWsGqySw6GTegk0G1Z9hbhHs8ReTy9ergNEAjalHmArDZqEXf
         0rmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698386483; x=1698991283;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mCu11tyAMn6bcFBf0dU4cUbsZOD9OVnoAoPidBrK0dw=;
        b=JQX3Bdq5IZSleJD6ZW2dQH+Hk0sfLiBYGJcaoRWghjVLfhfNKvM6Pvkk6JV8FEOaUp
         rd7697GzKhOAL9U4vqVUdF2c81Dj/mpSwOv5GroTpSgE4z36GYcCfm/6wkzPjUrX/fs+
         jE+WpcjZU7YkIOJq2ZVkJybPelzRcU+tlDA2jiCzvTzlyipniC781BDElo6Thb2MsWo5
         4jU4evQdYa4+4wAp2Oz6LP0kERY5zLE8XIIBonVgH6LvpoQskHioNetsjSj/ywrZOiIC
         NrI9vxtzY9ID8NsagtI+FiWFUvRfuC/RNp1AuWmow+1kyiyoGFEEs6Sb34ngMJClta4t
         se9g==
X-Gm-Message-State: AOJu0YwotrnoBIvJwBiyLvyuTR9TJSZWvg/oAzmDcTpCrfsy67j+G1Lt
	S+E9rbYtXLomOyaCGtCOR9PgKr2pGKid1g==
X-Google-Smtp-Source: AGHT+IGuUIL1PqYppXFOJIf0V5ue/O92A5XTGr2JcoGCzUOopOcu/Wji5+fvUJ6YofnaZyw3jB9wpA==
X-Received: by 2002:a05:6a21:198:b0:140:3aa:e2ce with SMTP id le24-20020a056a21019800b0014003aae2cemr2636338pzb.42.1698386482807;
        Thu, 26 Oct 2023 23:01:22 -0700 (PDT)
Received: from ubuntu.. ([43.132.98.47])
        by smtp.googlemail.com with ESMTPSA id z2-20020a17090a1fc200b00277337818afsm1113667pjz.0.2023.10.26.23.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 23:01:22 -0700 (PDT)
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
Subject: [PATCH bpf-next 5/8] LoongArch: BPF: Support 32-bit offset jmp instructions
Date: Thu, 26 Oct 2023 18:43:34 +0000
Message-Id: <20231026184337.563801-6-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231026184337.563801-1-hengqi.chen@gmail.com>
References: <20231026184337.563801-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add support for 32-bit offset jmp instruction. Currently,
we use b instruction which supports range within ±128MB
for such jumps. This should be large enough for BPF progs.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index a8be6d4b058c..050fcf233a34 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -848,7 +848,11 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 
 	/* PC += off */
 	case BPF_JMP | BPF_JA:
-		jmp_offset = bpf2la_offset(i, off, ctx);
+	case BPF_JMP32 | BPF_JA:
+		if (BPF_CLASS(code) == BPF_JMP)
+			jmp_offset = bpf2la_offset(i, off, ctx);
+		else
+			jmp_offset = bpf2la_offset(i, imm, ctx);
 		if (emit_uncond_jmp(ctx, jmp_offset) < 0)
 			goto toofar;
 		break;
-- 
2.34.1

