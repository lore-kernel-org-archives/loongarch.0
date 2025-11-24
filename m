Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DF3E571
	for <loongarch@lists.linux.dev>; Mon, 24 Nov 2025 05:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763963822; cv=none; b=S5E4EkvAiK99yDCdjR69i/cOwxuUpLJbbWC/pGd0tAHDHm3Y9yzljKEcUtIovl3MXzHg8Cm804IzEZwy6SBIpDRM6/blaNK+VzxAh/+ARWrzV5XRPcM6fXsb63j+1+2wJdhv0GieRMse4ey4mn9uHv/aZhVpecA0hg2OACQAwzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763963822; c=relaxed/simple;
	bh=X+5SGCJNsgCB4MFlueFjisWbWWsg8XfX90qXEThT3l4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DkbjNsYhZiRYEW5s0vx3H+hmeXQX77BU7GVdsnGien3iR2ePda37sNo8RQsIjeDlg25KS2I21LXai3GGmiopuixv3FkEo9h8h19GpIMXix7S5Z8R298AtLpcRk2WyNEI06Bw9CMx8bZ/F2TKn5GTYZuab5+s7UGIwZn2HUgVCyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vqu5gONT; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vqu5gONT"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-297e239baecso36996695ad.1
        for <loongarch@lists.linux.dev>; Sun, 23 Nov 2025 21:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763963820; x=1764568620; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kaVFil5bJDpKlpVPuhYEQv75UBUYaykofpCDl+Dvivc=;
        b=Vqu5gONTG+U+pqOd6LVZspqt4rCFxLq6IdLi44uj/R2DFsV8dK6tq8b/C5Xk3vKSqj
         Em77xIh8rhEIEnf2HgGCXhMktcymxkFDi8AgoA7i/9mQNJBn0TSgsgZQZI6bNIKy1KoV
         8L2hq5s7CoMYEva2sHHOrz/2MnD8RBRGTAVpMCIPfdsCFyhHkifHNGiukQU81Amq8dBr
         DjwEy2SnnDz03d3hyzSOPJN7ooX7whcjamVpC6w//LcGU+8hdK4RCCLS/vVcoq/mu5i0
         xw7NS4wiUuTf4o5/lkZ4gZFGh8wi/bS045Tj/47KVJWf6nm/hqE07467XLFhvPc3Fz/T
         T5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763963820; x=1764568620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kaVFil5bJDpKlpVPuhYEQv75UBUYaykofpCDl+Dvivc=;
        b=QPGtPC/4D50OV6t1K7yjTBbjgqCeZobJauMQZa3P/IPHCkxPHO55sMTchZunn0M6Zb
         tWa2hLQXX/Pfv5qE24siljWSTbEmebyaTCvCcUH9nTo8ZawltHv0/BPG3PbrN1aSCSGV
         +aO1Jpk4LZPjDCPx+w5Le/QMYnVPvvL+AtWelJqBsZ1GuDKAVy1B1HMKJ9lwyJPxyfG+
         Wc1ZkfbQtTxy7ZOiA51isIb7yVy5dt9FH8ZfSEH/0AQe7BiNG4ynihoeNaPg6oR2o3us
         unIHsikHWIvVMSnDC8a4QI9CASwVrHAHlQo/OqOjOboyBausaIaZq1J3oPBqqYiECkrj
         +i0w==
X-Gm-Message-State: AOJu0YxFnW8dzZX0Q1XoFsNCWGyF28VzP0GUZh1Z9STsY29EAAn2h78D
	x4Q2OJ1GAm26z+cgNAFEulbvPB0y1zEg9xMg30mZC7APE2ku23cmOmoP
X-Gm-Gg: ASbGncsx0ByqFs5reoIAGG2ChpZxZ8sXZUajpL5AlBHDfu09E7Yzy+KV4hE0DGmkDcr
	2BSX4AS2UiARMWgOl0WYWHtspm3SNxpmy0RNtnFFec7HG9rnl49DSWRZtWPDB8GTE8dncgouRnx
	HpWcIdlekTPy/ZBizjD30aQOlULi5mvHsEmsbIxmPCZyfsgZIuf0Zb6Z4pPdzjqXxfM8UattF2a
	d3pSGCwhpP0CclTjw/2q7oJK4CxQpdFwl2Abm3TTr/ZGdZfQacFDAuf2g1OPbbQt6xKTHRzHAPR
	Hs3aSdHY+KLlljY2j6DfkXkCisGylmmQcwjNH8c98MlLlu0PHcqnSFFHUkQ7/p1JkWbzqw5b9UL
	BSz3A+38PYmVuL/tLYqNUZZoiCKxLbUsG8G7Dm7jFNkl2fv+fa4IEgcItTysfVh0WS6t6UfVV/I
	lY6417vUYGQ5dFUDjtt2wjs3krzCA6
X-Google-Smtp-Source: AGHT+IHROxIWyPyAajMNR4lLFT4YYLkignmF+W9P6ECBFMC5Bdkh5uKyKJAYuZZ1x4vSgMM9ZMUc/Q==
X-Received: by 2002:a17:903:1104:b0:267:8b4f:df36 with SMTP id d9443c01a7336-29b5e3d8043mr162311565ad.29.1763963820267;
        Sun, 23 Nov 2025 21:57:00 -0800 (PST)
Received: from devbox.. ([43.132.141.30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b106094sm124881785ad.10.2025.11.23.21.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 21:56:59 -0800 (PST)
From: Hengqi Chen <hengqi.chen@gmail.com>
To: chenhuacai@kernel.org,
	yangtiezhu@loongson.cn,
	vincent.mc.li@gmail.com
Cc: loongarch@lists.linux.dev,
	Hengqi Chen <hengqi.chen@gmail.com>
Subject: [PATCH 2/5] LoongArch: BPF: Zero-extend bpf_tail_call() index
Date: Mon, 24 Nov 2025 05:56:39 +0000
Message-ID: <20251124055642.1591-3-hengqi.chen@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251124055642.1591-1-hengqi.chen@gmail.com>
References: <20251124055642.1591-1-hengqi.chen@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bpf_tail_call() index should be treated as u32 value.
Let's zero-extend it to avoid calling wrong BPF progs.
See similar fixes for x86 ([0]) and arm64 ([1]) for more
details.

  [0]: https://github.com/torvalds/linux/commit/90caccdd8cc0215705f18b92771b449b01e2474a
  [1]: https://github.com/torvalds/linux/commit/16338a9b3ac30740d49f5dfed81bac0ffa53b9c7

Fixes: 5dc615520c4d ("LoongArch: Add BPF JIT support")
Signed-off-by: Hengqi Chen <hengqi.chen@gmail.com>
---
 arch/loongarch/net/bpf_jit.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/loongarch/net/bpf_jit.c b/arch/loongarch/net/bpf_jit.c
index c67631303841..4be8515197ce 100644
--- a/arch/loongarch/net/bpf_jit.c
+++ b/arch/loongarch/net/bpf_jit.c
@@ -280,6 +280,8 @@ static int emit_bpf_tail_call(struct jit_ctx *ctx, int insn)
 	 *	 goto out;
 	 */
 	tc_ninsn = insn ? ctx->offset[insn+1] - ctx->offset[insn] : ctx->offset[0];
+	emit_zext_32(ctx, a2, true);
+
 	off = offsetof(struct bpf_array, map.max_entries);
 	emit_insn(ctx, ldwu, t1, a1, off);
 	/* bgeu $a2, $t1, jmp_offset */
-- 
2.43.5

