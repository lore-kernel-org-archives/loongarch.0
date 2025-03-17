Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9892638DEC
	for <loongarch@lists.linux.dev>; Mon, 17 Mar 2025 01:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742176692; cv=none; b=i6+VmWob9ux5ToWXUqqjJdFq3kPLJw1ii9W7opq3+Zj29iu3gmKFQzQys2aSjWEZeD8BOXsidiZLoDBjntIl5nNE8SrYd1woMfOFOUzebC2xjex304teeg08yEw7pu2ub9epF+CfNw+oB/XImVAkGStw22FzEDgVlVbdDALuKTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742176692; c=relaxed/simple;
	bh=a4JdCD3BsEmNOHBRufM3YOkdQanMwoOybstzT8e9gd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LFgrvGGZjVUuYBLGTCa5w35wZekP4LmFp38sLnHIbvbiKRqbewqD9QUCvIl+wdEAkFhqDaaLe5QqOZbWz/uG71eI8+/B682MvGzwFUBJGFSbYuxSznKM/6kwCpPgVnvD91yRepN35UC3KdP+QQXOgT+fm/swTfXcnTBXe4QzhmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5bl4i+m; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5bl4i+m"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-225fbdfc17dso14387535ad.3
        for <loongarch@lists.linux.dev>; Sun, 16 Mar 2025 18:58:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742176690; x=1742781490; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wr+PZ9C3ll2NSSQdspls9bOCus20ykgzWKM9RCRpL9o=;
        b=E5bl4i+m9VxxzI6ziePy0obxI+GknavaUj7n2G7nQQ0cfNQGum5Y8JCwLkiShyOsFL
         khTd8j5WtPqp05lVLwEtend2j1m+tUXuFCQSIy4n//SCLYIomG3jbW0nhI1E6wMvfZJD
         4pvks2sEWZi+GN8m7g13yRNiuYUR5THRMhhFgbaZm5QrtOWq96IhRu0kxYsxu3Mr3Wn4
         PQNQdEbAbUYoX2b/UMyErYNP4OlTZ3+tCbzivppmYdZduJpv9O+g6RZ1EpsHfzUiGyzA
         NbNPI6cNQmPfzPjpXmmMva9bnnIoz58WkAuZDQoEpUnb+9JDRqwSMD2etfY5nGxZN1vR
         c3tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742176690; x=1742781490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wr+PZ9C3ll2NSSQdspls9bOCus20ykgzWKM9RCRpL9o=;
        b=R3mDubkAnAkBKFcAZWMqrQ6Galttu4zhO+VneAs+ZgtAxvDr89LkV37FtsMi5uygGP
         z/032098a3R6LN2QlKsfe8C5QBqD12pkQppm4BXitSaziIKU4QrDuMWHpacs6yt/w7CX
         I0wtyFY5JGksUUyj3ha4U5993I5PwcEc1R1QUpRjfdy7DfQ8CMMb/Cfw/5bzWXZgm/IU
         PdcDJwa13s8vFIeV/SjodrbGbExGUTb+9EPodcXcWzxdFt4HgSJlj7m0M/FHyX1RecKb
         O16FvOI8/2bjLulo9m/zJAjE9yIineyYgXrvURDDOpGx4RkPyUEzVWMd9uaYAHtoDqUU
         ny/A==
X-Gm-Message-State: AOJu0YzBNDvLAwCt+t/VzCPi4TvJrbpavT6nzDOXUU/rtRZrDUOOnGoV
	OLl2d3qLohVteZ08ycw2vtn72rctey2eOZ/8nJc+bl5bOVgOWfJzQnNJ4O1b
X-Gm-Gg: ASbGncuT9aq7grVNR33sfTlqZZg7MU1WcpH9+VTZgME85pirV7kxYFqgCU1t/mrcUCM
	oWihjb097bzJndTWv8tFC/pzKnxf6GtErKL8hAyqVSGuf5Sh0qjHP1nd9eNw+1FIeLdniTLvtLf
	zMGzIBdbiflOensXE6+buSpZSKbcy/E/xTDmg/H7avTUv8yZMZHNARFAcglwVPKXoihmpKEcfB2
	XkpXXZ2/qj2JhWdiiwsSHDs6OIrprBP3AbifffGy9mKU5wjUVHqannBcwDcL8klFIB2tTtcnoch
	EEvZmTTvNECTBP2nTQ87dzTqQaZxcw/Ao0OBnAA3BHf2JXSrYJhBiXpTl7W1bXRRXMYOimdHeYq
	FAQpM
X-Google-Smtp-Source: AGHT+IGy50NnLmPbc3/N3BdRHwVuZHsZX+6C1d9drBaxvMt697gIhy00T72iiF0t4DBhlnJtVf0mxw==
X-Received: by 2002:a17:902:c949:b0:223:5945:ffd5 with SMTP id d9443c01a7336-225e0af042bmr134345835ad.32.1742176690457;
        Sun, 16 Mar 2025 18:58:10 -0700 (PDT)
Received: from localhost.localdomain ([14.22.11.162])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-225c6bbe960sm63432075ad.200.2025.03.16.18.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 18:58:10 -0700 (PDT)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: loongarch@lists.linux.dev,
	bpf@vger.kernel.org
Cc: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	Hengqi Chen <hengqi.chen@gmail.com>,
	Vincent Li <vincent.mc.li@gmail.com>
Subject: [PATCH] LoongArch: BPF: Use move_addr() for BPF_PSEUDO_FUNC
Date: Mon, 17 Mar 2025 01:57:55 +0000
Message-ID: <20250317015755.2760716-1-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Vincent reported that running XDP synproxy program on LoongArch
results in the following error:
    JIT doesn't support bpf-to-bpf calls
With dmesg:
    multi-func JIT bug 1391 != 1390

The root cause is that verifier will refill the imm with the
correct addresses of bpf_calls for BPF_PSEUDO_FUNC instructions
and then run the last pass of JIT. So we generate different JIT
code for the same instruction in two passes (one for placeholder
and one for real address). Let's use move_addr() instead.

See commit 64f50f657572 ("LoongArch, bpf: Use 4 instructions for
 function address in JIT") for a similar fix.

Fixes: 69c087ba6225 ("bpf: Add bpf_for_each_map_elem() helper")
Fixes: bb035ef0cc91 ("LoongArch: BPF: Support mixing bpf2bpf and tailcalls")
Reported-by: Vincent Li <vincent.mc.li@gmail.com>
Closes: https://lore.kernel.org/loongarch/CAK3+h2yfM9FTNiXvEQBkvtuoJrvzmN4c_NZsFXqEk4Cj1tsBNA@mail.gmail.com/T/#u
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index ea357a3edc09..b25b0bb43428 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -930,7 +930,10 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx, bool ext
 	{
 		const u64 imm64 = (u64)(insn + 1)->imm << 32 | (u32)insn->imm;
 
-		move_imm(ctx, dst, imm64, is32);
+		if (bpf_pseudo_func(insn))
+			move_addr(ctx, dst, imm64);
+		else
+			move_imm(ctx, dst, imm64, is32);
 		return 1;
 	}
 
-- 
2.43.5

