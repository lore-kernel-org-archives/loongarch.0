Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA87E79DE
	for <loongarch@lists.linux.dev>; Fri, 27 Oct 2023 06:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EeVhJPJL"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-27d0a173e61so1443721a91.0
        for <loongarch@lists.linux.dev>; Thu, 26 Oct 2023 23:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698386470; x=1698991270; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XOAetODyKAZtmGq4juMfnsuGXFtx5PudQ3Ii+cytJu4=;
        b=EeVhJPJLztgSzNhu/9chYqpKWFCKCfBmi8h1SfXT4fHig9VsxCVAtMgHpLBILdyIxM
         iwi8HWpI9/9/74gBX4LkSUUrGUsxC4xnOU2SUqlsfy/flP06E9O3uXNTcyZ7REqfkzj/
         SNY3iPhIq42uBTFzlaQnt0GCWLlEGzYhAYZQICSv5chz4CNj9KA4YhK15VoCTK7+zNt3
         CRTGdECsa6O3GSnJjS1lgVfohdO/HVHIP40sKJB3pp4S2YwU1XQVPht1DxXUC//Gq2ep
         5NtBQVvPR9SNrf+yA5BWU5jnkqjEACxdubqg7ojna6JaxgbYiB5ZWIGYA2scvy7BOSxE
         8FBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698386470; x=1698991270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XOAetODyKAZtmGq4juMfnsuGXFtx5PudQ3Ii+cytJu4=;
        b=e40r6KbT2OUm5wZrt6Dyu+34+xZG5Ld4FBiyD0wct848oqnDNCFsFwU9C7xFEYYxvD
         06pLGdopfRBS1HC/YMnWINdCXyS9y+0NkwDH66M41e3y54eCc1jukFiBMij/SfOiMoMD
         jZJNtbhvgw03INz2MvvN5ZvOIZDPcakbGnHlIHcVCYNyoAXD5wkoQmSPyV10F/B/Nsgi
         8Bzoj8SmDYg5gCVWql4WA0xAUJvqi8LgPuM05ZQqG0ziq8vX/RQ1o4GtX04Z2CVPbKiL
         q3LrnO4G/aXubwKTEqpWYd/jXu3VUmR4Y8lSnZvrVFIPRJk2N1rSOeoFZr18jFQdD55/
         B72w==
X-Gm-Message-State: AOJu0YywfB5OCHyU6JK7VAf3aeb/8tcbxfH+gf48dwETO2VRxCMUQwwe
	gexRb94anPAO9JZ3/phob3c+/FICj5V4Yw==
X-Google-Smtp-Source: AGHT+IFKkk/FmkDvRFb2t82GndS2qIQ4DB43yNCvuipJTQpVhZ7laCMccD98YMenu6lbOguM6Rr73Q==
X-Received: by 2002:a17:90a:2d83:b0:27d:2abc:f9c1 with SMTP id p3-20020a17090a2d8300b0027d2abcf9c1mr1598389pjd.20.1698386469984;
        Thu, 26 Oct 2023 23:01:09 -0700 (PDT)
Received: from ubuntu.. ([43.132.98.47])
        by smtp.googlemail.com with ESMTPSA id z2-20020a17090a1fc200b00277337818afsm1113667pjz.0.2023.10.26.23.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 23:01:09 -0700 (PDT)
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
Subject: [PATCH bpf-next 1/8] LoongArch: Add more instruction opcodes and emit_* helpers
Date: Thu, 26 Oct 2023 18:43:30 +0000
Message-Id: <20231026184337.563801-2-hengqi.chen@gmail.com>
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

This patch adds more instruction opcodes and their corresponding
emit_* helpers which will be used in later patches.

Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/include/asm/inst.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index 71e1ed4165c8..5350ae9ee380 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -65,6 +65,8 @@ enum reg2_op {
 	revbd_op	= 0x0f,
 	revh2w_op	= 0x10,
 	revhd_op	= 0x11,
+	extwh_op	= 0x16,
+	extwb_op	= 0x17,
 };
 
 enum reg2i5_op {
@@ -556,6 +558,8 @@ static inline void emit_##NAME(union loongarch_instruction *insn,	\
 DEF_EMIT_REG2_FORMAT(revb2h, revb2h_op)
 DEF_EMIT_REG2_FORMAT(revb2w, revb2w_op)
 DEF_EMIT_REG2_FORMAT(revbd, revbd_op)
+DEF_EMIT_REG2_FORMAT(extwh, extwh_op)
+DEF_EMIT_REG2_FORMAT(extwb, extwb_op)
 
 #define DEF_EMIT_REG2I5_FORMAT(NAME, OP)				\
 static inline void emit_##NAME(union loongarch_instruction *insn,	\
@@ -607,6 +611,9 @@ DEF_EMIT_REG2I12_FORMAT(lu52id, lu52id_op)
 DEF_EMIT_REG2I12_FORMAT(andi, andi_op)
 DEF_EMIT_REG2I12_FORMAT(ori, ori_op)
 DEF_EMIT_REG2I12_FORMAT(xori, xori_op)
+DEF_EMIT_REG2I12_FORMAT(ldb, ldb_op)
+DEF_EMIT_REG2I12_FORMAT(ldh, ldh_op)
+DEF_EMIT_REG2I12_FORMAT(ldw, ldw_op)
 DEF_EMIT_REG2I12_FORMAT(ldbu, ldbu_op)
 DEF_EMIT_REG2I12_FORMAT(ldhu, ldhu_op)
 DEF_EMIT_REG2I12_FORMAT(ldwu, ldwu_op)
@@ -685,9 +692,12 @@ static inline void emit_##NAME(union loongarch_instruction *insn,	\
 	insn->reg3_format.rk = rk;					\
 }
 
+DEF_EMIT_REG3_FORMAT(addw, addw_op)
 DEF_EMIT_REG3_FORMAT(addd, addd_op)
 DEF_EMIT_REG3_FORMAT(subd, subd_op)
 DEF_EMIT_REG3_FORMAT(muld, muld_op)
+DEF_EMIT_REG3_FORMAT(divd, divd_op)
+DEF_EMIT_REG3_FORMAT(modd, modd_op)
 DEF_EMIT_REG3_FORMAT(divdu, divdu_op)
 DEF_EMIT_REG3_FORMAT(moddu, moddu_op)
 DEF_EMIT_REG3_FORMAT(and, and_op)
@@ -699,6 +709,9 @@ DEF_EMIT_REG3_FORMAT(srlw, srlw_op)
 DEF_EMIT_REG3_FORMAT(srld, srld_op)
 DEF_EMIT_REG3_FORMAT(sraw, sraw_op)
 DEF_EMIT_REG3_FORMAT(srad, srad_op)
+DEF_EMIT_REG3_FORMAT(ldxb, ldxb_op)
+DEF_EMIT_REG3_FORMAT(ldxh, ldxh_op)
+DEF_EMIT_REG3_FORMAT(ldxw, ldxw_op)
 DEF_EMIT_REG3_FORMAT(ldxbu, ldxbu_op)
 DEF_EMIT_REG3_FORMAT(ldxhu, ldxhu_op)
 DEF_EMIT_REG3_FORMAT(ldxwu, ldxwu_op)
-- 
2.34.1

