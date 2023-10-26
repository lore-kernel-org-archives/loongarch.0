Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A2E79DC
	for <loongarch@lists.linux.dev>; Fri, 27 Oct 2023 06:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dyquWv3G"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5b93ddb10b8so356337a12.0
        for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 23:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698386477; x=1698991277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ju1+333w2vHRlYpxQccqOWvW/oF44n6WKsFZFqcRgwI=;
        b=dyquWv3G5dawbtkHs2aclMD75fvZzSYpT0a+1TJCZBIUtd71yK1M5PRE1/BR7FeD4R
         dwHQDFXVurZSqzHnOr/E6aGCvye1TiPPHh4V13eKPYQQF+c+8IiqsZ+HTIOD+ZyNiC0n
         OQcX5zrSazGDZfSxulDndDy0y/8pS+0HiWSoGJXLkUKo4gIOQymCgaF5rD0H0Krb1sha
         FitmbGS3o1CusjzP/iFW8/DaQ5H0ofGqVerKGKVBbCyRYI6J0gW9+MEm3U3MPRjwX3vQ
         HxvEu1H6VGVQJCe/uXXhzYe+JtysJ71SOwYdvXRDg7BFLo3pydtHi9fkEij3pr8BxVE9
         K/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698386477; x=1698991277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ju1+333w2vHRlYpxQccqOWvW/oF44n6WKsFZFqcRgwI=;
        b=ZpX6q55Fs7NPqBJOWomg3QNsKv7lzexA5eXCr6wcawaxT+MHaOcLstmDfcmNvnRiwB
         jT76dEA9gDbvi8uMSW1wdIUav7b1EJe6bvP0htxzOKMtrlrIdyhVaCETYEkf1arR7Joc
         roqtcsjz3c2iN6NWwCZUVKi4jC5tkr3y4A8ddUkLa1UNLyXCdJFGMV4L+oiLUqsfhWkJ
         LkjtadiLhD4bUZkuw/siH/XThG+bMaLerX2IBrJms8iftBm+QOYJ2tF6Ibjs5WNbxbmf
         TGqKxv9TKPmazpjGcfXxim6njrV3XL5yq453kWgLtiKW9oxbdxgIVvxJkvWwvPQa3f//
         ETWQ==
X-Gm-Message-State: AOJu0YzRRcJ7J2ocdtZiCMWwDbo8alfu3JTxAFEAhNukfb7EF2UpvCEj
	ucBJUo/pr8yMxdR7YysRtkQDuyY7Matcag==
X-Google-Smtp-Source: AGHT+IEi6zWufaoGL7LwP/y41ik7Gw7wqoxmlOg6OH5y2xkeUU5UrPt5OnGZ+hsmY71N8RdwgRsZQw==
X-Received: by 2002:a17:90a:be0e:b0:27d:2ce9:d6d5 with SMTP id a14-20020a17090abe0e00b0027d2ce9d6d5mr2390073pjs.12.1698386476634;
        Thu, 26 Oct 2023 23:01:16 -0700 (PDT)
Received: from ubuntu.. ([43.132.98.47])
        by smtp.googlemail.com with ESMTPSA id z2-20020a17090a1fc200b00277337818afsm1113667pjz.0.2023.10.26.23.01.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 23:01:16 -0700 (PDT)
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
Subject: [PATCH bpf-next 3/8] LoongArch: BPF: Support sign-extension mov instructions
Date: Thu, 26 Oct 2023 18:43:32 +0000
Message-Id: <20231026184337.563801-4-hengqi.chen@gmail.com>
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

Add support for sign-extension mov instructions.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index 0c2bbca527ef..ac9edf02675c 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -472,8 +472,23 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	/* dst = src */
 	case BPF_ALU | BPF_MOV | BPF_X:
 	case BPF_ALU64 | BPF_MOV | BPF_X:
-		move_reg(ctx, dst, src);
-		emit_zext_32(ctx, dst, is32);
+		switch (off) {
+		case 0:
+			move_reg(ctx, dst, src);
+			emit_zext_32(ctx, dst, is32);
+			break;
+		case 8:
+			move_reg(ctx, t1, src);
+			emit_insn(ctx, extwb, dst, t1);
+			break;
+		case 16:
+			move_reg(ctx, t1, src);
+			emit_insn(ctx, extwh, dst, t1);
+			break;
+		case 32:
+			emit_insn(ctx, addw, dst, src, LOONGARCH_GPR_ZERO);
+			break;
+		}
 		break;
 
 	/* dst = imm */
-- 
2.34.1

