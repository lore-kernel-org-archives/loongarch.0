Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5544E335BA
	for <loongarch@lists.linux.dev>; Tue, 25 Mar 2025 14:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742911876; cv=none; b=gKurSH/LkUzcgecUu/d8eotg+gkHxs/Ze3nsL19Fl3XopE/i3/up6qla/I3QeDUBbA3nedSMLlauSPIixkiTrjpzFdGq/TjcX7XxyDp9r3R5W2Wi0s2vPLrudUu4ttkrVR78lUsBIkJJIVqbUJ/FlMPCHz53KqB1cMXWiVACQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742911876; c=relaxed/simple;
	bh=m5Rf71rIgy5GkGGzXBi5Ik4Xt/g0V0ssPzWjnP0LN/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hZ9djAJibEo6UtgjH8YWNlMJetTHy0KwLTZxM79vc4C5gYWfGJ0NLo7Z9G47dbgDe0sD713l5BBgd/vriUI8fCllXKPiuzbdtCfhZcgfvWqOO26Jf43u5o4y2aelJ8qPoAkQz5ilMh3+HWpPBcJVM3JTheCR0STRkqkUm26F1g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gU4kbv2T; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gU4kbv2T"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so13040187a91.3
        for <loongarch@lists.linux.dev>; Tue, 25 Mar 2025 07:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742911873; x=1743516673; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oyT+32LK+A27PsW6quCOsG6ro+lQiaS6tL1T9+kWwRw=;
        b=gU4kbv2TAuHK+eXFZ3rYzWjibi6sqh6jXsHCnmYJH+5avLAmEs6ZiiInbEs1zbyMro
         +uWhRWhl09R9gQIyeSJ0YmRO5vJyJUwCTmSqJfQyB761sU46CrHwN7ueG/brzBu4f8yf
         bbujB7OZ2pl1RwR0n38p82wEe5UcU3NkBrLc309LnEKDSVqbFuULwcRmmk1EJkE7XMIO
         kvR/NEjIp4r9hv+nNeOq5m3AJ+HFRniOy49lqp61z8gz2HOM+0g4h6O7cOA2cZoKogH0
         3+sG4ZL4gpH9hm+yDy+dhDk0auxKhGymru+0P+LxQUpWejubLRR64F4INBQkAbzB2cFw
         TYvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911873; x=1743516673;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oyT+32LK+A27PsW6quCOsG6ro+lQiaS6tL1T9+kWwRw=;
        b=gFm7BBx5V5XJwHTOcp4QsBP4ny0Z9HRYkvkDzJT/hVuVg/GGEMBhXS2hKkoPLxRGU9
         IsHplr9dBE7i7PXF+JaFj5p7nyESHna08DCDPR6HSqyoImCcv7q/mgOM8+QmCeIbAKai
         7HyzfsAO4ahwqcVqCdNiBoix/gpOZX3dYu+5Lj7BLmPi/k3dZThMwPUR+qa203ce5HpH
         O3sF7l8LYjEtqqR4gMFaQWw5GmGzkx0dwUmsizgHM2DhniYMe6jkdPB5aZ1j5IOzkPXH
         bAhzvBQdTGOvmoyo45m7xgei+yEawigQSOaFFicSAQeKbmxk4UiPX8Zd4fLoOCzVaR2n
         4PcA==
X-Gm-Message-State: AOJu0YxE7t6WkVJzv6o//ecZ4pe8Fh/bAKbKzSd3B/B3ZBxgjfOwAlns
	7rJU/g9rluSuAvnQc+ufsHdZuglkajz9hm5JUgiEgDcS9z2AWD/yU2s6THXV
X-Gm-Gg: ASbGncuO092PvvKJwjrUNayibwhgqRsChmv2TjWcc14tlZ0++52AluwcZoGDs8t9xNn
	l6sL8MPo+XIxA/N0Ok8LhM/QJNvgbz1aOvOJNdGB15QXpxPzFLy3UCezRu0a1UCK7tY6PQQ7ahK
	Ft5KmCpCKOos+f+1LKyZtrt0RegTLW3uM/mJJ+wT1VZ5+8Q6Ug2uGWIZHobh3Z9zoT9wlASZAk0
	2ocYJpEEFuySUiKWYvixTw7r/6/4QG8L5rQF2tW26ybcFWt1pn6imSYxqLvp8SHIIrxEl/nPtDU
	3pLft4H17cb+EdxLCkXTRmOCGDLpmf8LpB4fZ/FxsAbc9DUqFO4XV2idpPLU0SClj/+zaoskL63
	IyjBS
X-Google-Smtp-Source: AGHT+IHKVKtahgG1m7Tdx6vHXjWe+CS9GOWBxJwwA8IFIs2F6eJ/pV/0atMx/qpIbWs2P/FAtiNZXw==
X-Received: by 2002:a17:90b:4a8d:b0:2ee:e945:5355 with SMTP id 98e67ed59e1d1-3030feb1386mr24995855a91.19.1742911873106;
        Tue, 25 Mar 2025 07:11:13 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.162])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-22780f4a670sm90556965ad.86.2025.03.25.07.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:11:12 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev,
	bpf@vger.kernel.org
Cc: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	john.fastabend@gmail.com,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH] LoongArch: BPF: Don't override subprog's return value
Date: Tue, 25 Mar 2025 14:10:46 +0000
Message-ID: <20250325141046.38347-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The verifier test `calls: div by 0 in subprog` triggers a panic at the
ld.bu instruction. The ld.bu insn is trying to load byte from memory
address returned by the subprog. The subprog actually set the correct
address at the a5 register (dedicated register for BPF return values).
But at commit 73c359d1d356 ("LoongArch: BPF: Sign-extend return values")
we also sign extended a5 to the a0 register (return value in LoongArch).
For function call insn, we later propagate the a0 register back to a5
register. This is right for native calls but wrong for bpf2bpf calls
which expect zero-extended return value in a5 register. So only move a0
to a5 for native calls (i.e. non-BPF_PSEUDO_CALL).

Fixes: 73c359d1d356 ("LoongArch: BPF: Sign-extend return values")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index a06bf89fed67..73ff1a657aa5 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -907,7 +907,9 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 
 		move_addr(ctx, t1, func_addr);
 		emit_insn(ctx, jirl, LOONGARCH_GPR_RA, t1, 0);
-		move_reg(ctx, regmap[BPF_REG_0], LOONGARCH_GPR_A0);
+
+		if (insn->src_reg != BPF_PSEUDO_CALL)
+			move_reg(ctx, regmap[BPF_REG_0], LOONGARCH_GPR_A0);
 		break;
 
 	/* tail call */
-- 
2.43.5

