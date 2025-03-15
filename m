Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF0D518A6DF
	for <loongarch@lists.linux.dev>; Sat, 15 Mar 2025 08:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742025811; cv=none; b=qZ4y7utALFrOR53qvsr42lFyp2cfXDcEspzNwAyx/pOLLRk6JGnLrx6hi9vjGMgoBqEJHUsdPSpOA5vJy+mLFBWT6pC7Ah6G5Ys/Yru0CcJm6Ofj/Zn8111gw+VBCTd9oj0+ALiqIpmLQaGUYoZwMxCpISgzgv8LPT3BdH5OQys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742025811; c=relaxed/simple;
	bh=cK7X+ekj65GDPa3Y3otbIX2aFl4VQDsKw9VVrWlksIA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=k2EG+Ae/bfJDXnkgPMicPPH6+CkHyxG/MqaDVBERvu6r14VZEO1YX3ZwpnaV7Bvyy+jR8eYdZl4JHXK0JSrGDZ4kKX51/mt6ECgK/eW2RnOK8shM/CVyDkmGxsGnx5jRq3jPHvRRm3p1sHlDIo9D5zrDqNxB8iphzjnc5lh+8gM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ip0QArJv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ip0QArJv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2239c066347so58629075ad.2
        for <loongarch@lists.linux.dev>; Sat, 15 Mar 2025 01:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742025809; x=1742630609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MsBMohK1J5AZoR8f2vnP4yTF9NYNvX08pUGvJRqOXzk=;
        b=ip0QArJvqMPwBumQXUBskgp9jV7vGgI9bawOElD9Bs4tUkwlmIPBOc7iceCaSSjLY+
         Dm4bCQVskPWONRB3J/U+ARxZzg//zXYdeofWdJPEYYgo5wCLb8cNSqF5xq7kCI0lI24Z
         htCyLnlAqM7b+pOSebspBJJ3jz3dqm41G4IGnUOa+8Ai5s3giwGGDn/kYBbLsrC6fAmd
         aiQLAhMZS4Qa+q6ERoZoufI50ZwWEF3eng2ZvOyTgJNkXY/1GEgMeOiRxGBwDggF8Jmg
         nVmolOydLUvyBEcPKyAECpQCjPKpk9AlUOtFBkvKmquTF920/XUbtXya1SK4PNIjB6il
         fZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742025809; x=1742630609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MsBMohK1J5AZoR8f2vnP4yTF9NYNvX08pUGvJRqOXzk=;
        b=KBAfidVeRX7+Ih6rweEHie1MdtS+X02sURWt0P3rZO4odMqPiwYzaPqfCc1gEkHaby
         Fw6lGlpxPg7LeaE+8SuRDYktVHcwj9G/a9kCsKJfbPcx9pnOPUnSM2cKQObyshFRzIKh
         BxhsV3bN6k1sMehhtWdSn1nYQjpyQH0doIPDSlMNdJDUxw6MKzA+xzEH2zq9DdPL7Noe
         1vngFsLGV7s4G2DMXqDqRoTn12417f3v4229I6+3NEcv3KVeOsOQF/bVHoVudB617Jt0
         45bgBq63mHzX7O+80msI9uJRfiwTbM59G0R1+bEOU0xUVxA1X1IjehN3pwdt/3xdEH+z
         pgjg==
X-Gm-Message-State: AOJu0Yy1ofD9J8ckBbnliKuw0GUiH0qlvAGXRT/+7AkuSwkY3wNa1yvN
	ZWGueoCRLW9G1LUgl27bC4aGOh9JQcV++JJi1A1/30wyrtXXYaNPBEvHCKN6
X-Gm-Gg: ASbGncszFfM+Q1lcn+Ipf14C1HIUe0idg2rQ5a/jHUeOGqrCccXi3VRHiD+Y4NonfF0
	2pScVSjNtzEXNCcy9Z2ekDk6L6FMyLcadYkszLGkkpBpAw4k/ITqh3Y05XyLVPIvl5WzG5ZvFIJ
	rsldNE7/jCr+qKl97ChMKp5/+XO4V44Gh1/jGmPe8UddaKppHelvBBP8rdVpHNiB+12PC7TD+RZ
	J9tj/gmXa/BT5ybSgQq/z0CHyzEgt5BHsPKOSLHp3xLcehK6pEaNzg/BxvhA0FtFIcKvms3GNCn
	4zluzWO+KL5PRjROkWBdD6SqbPBReSjpwVbeL1XRlc8s19bQcIZf7bFcov++6ikU6QRMKdE54Jf
	eGTbWbQ==
X-Google-Smtp-Source: AGHT+IEHVcuvOSaQ9YBO8ax6PXV3hpfu6w1q13nBl2BZtcvzWwDaa3+1um1+XUscvYqwwvNKOrpVZA==
X-Received: by 2002:a05:6a20:9148:b0:1f1:b69:9bdd with SMTP id adf61e73a8af0-1f5c1311632mr6046505637.37.1742025808748;
        Sat, 15 Mar 2025 01:03:28 -0700 (PDT)
Received: from localhost.localdomain ([14.116.239.34])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-af56ea7bd01sm3190508a12.61.2025.03.15.01.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Mar 2025 01:03:28 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev,
	bpf@vger.kernel.org
Cc: yangtiezhu@loongson.cn,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Vincent Li <vincent.mc.li@gmail.com>
Subject: [PATCH] LoongArch: BPF: Fix off by one error in build_prologue()
Date: Sat, 15 Mar 2025 08:03:20 +0000
Message-ID: <20250315080320.4193821-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vincent reported that running BPF progs with tailcalls on LoongArch
causes kernel hard lockup. Debugging the issues shows that the JITed
image missing a jirl instruction at the end of the epilogue.

There are two passes in JIT compile, the first pass set the flags and
the second pass generates JIT code based on those flags. With BPF progs
mixing bpf2bpf and tailcalls, build_prologue() generates N insns in the
first pass and then generates N+1 insns in the second pass. This makes
epilogue_offset off by one and we will jump to some unexpected insn and
cause lockup. Fix this by inserting a nop insn.

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Fixes: bb035ef0cc91 ("LoongArch: BPF: Support mixing bpf2bpf and tailcalls")
Reported-by: Vincent Li <vincent.mc.li@gmail.com>
Closes: https://lore.kernel.org/loongarch/CAK3+h2w6WESdBN3UCr3WKHByD7D6Q_Ve1EDAjotVrnx6Or_c8g@mail.gmail.com/
Closes: https://lore.kernel.org/bpf/CAK3+h2woEjG_N=-XzqEGaAeCmgu2eTCUc7p6bP4u8Q+DFHm-7g@mail.gmail.com/
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/include/asm/inst.h | 5 +++++
 arch/loongarch/net/bpf_jit.c      | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/loongarch/include/asm/inst.h b/arch/loongarch/include/asm/inst.h
index 3089785ca97e..d61b356170fe 100644
--- a/arch/loongarch/include/asm/inst.h
+++ b/arch/loongarch/include/asm/inst.h
@@ -695,6 +695,11 @@ static inline void emit_jirl(union loongarch_instruction *insn,
 	insn->reg2i16_format.rj = rj;
 }
 
+static inline void emit_nop(union loongarch_instruction *insn)
+{
+	insn->word = INSN_NOP;
+}
+
 #define DEF_EMIT_REG2BSTRD_FORMAT(NAME, OP)				\
 static inline void emit_##NAME(union loongarch_instruction *insn,	\
 			       enum loongarch_gpr rd,			\
diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index ea357a3edc09..2346c0b55043 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -142,6 +142,8 @@ static void build_prologue(struct jit_ctx *ctx)
 	 */
 	if (seen_tail_call(ctx) && seen_call(ctx))
 		move_reg(ctx, TCC_SAVED, REG_TCC);
+	else
+		emit_insn(ctx, nop);
 
 	ctx->stack_size = stack_adjust;
 }
-- 
2.43.5

