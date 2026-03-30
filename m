Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD3D3AF67A
	for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864141; cv=none; b=QHT2DQrbSQy3qAxWUwWc57ZowPgJSlCoLR7IqCs61cl3ADFjPhDUwPMDsFnjhrKnk9O6xuRORFpw7F48qEHkPi7gL/WFopQEt4HF1Cf2ce3aU3VijH7OMLhXJfVQUxqWo6BcomfTKMylcbYqMQ50z7Bn0XbhDmVQJv5cGpERo3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864141; c=relaxed/simple;
	bh=HeXNwKwYM29o+fqhMXbHgeU1wyBL/MZizFR5K0TzCZ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nD9GS/Xm3nJp7LQW0W/un6DvfN/f/Tia6FO60Byybr02b8SDnum9AfUKQAztzjZNXQwJnY+f29QuTd2sL743AhmxXdfKPzKB6hkFTw5ovp4H/8Vql5w7y7kw3BMV22z+FxpTaiwEgoShEDE8Cz1Z36HMZa2P3LhmrTLgh9thoMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space; spf=pass smtp.mailfrom=bytefly.space; dkim=pass (2048-bit key) header.d=bytefly-space.20230601.gappssmtp.com header.i=@bytefly-space.20230601.gappssmtp.com header.b=JuqsQH8V; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bytefly.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytefly.space
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytefly-space.20230601.gappssmtp.com header.i=@bytefly-space.20230601.gappssmtp.com header.b="JuqsQH8V"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82418b0178cso2036842b3a.1
        for <loongarch@lists.linux.dev>; Mon, 30 Mar 2026 02:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytefly-space.20230601.gappssmtp.com; s=20230601; t=1774864138; x=1775468938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnID34Go+g2KnNZbh0BK6ZRqYtzkBkjxAb6FB8NCtD0=;
        b=JuqsQH8V0VSb8zaO0G78p+2EsIB7HVQv6WdEijmgft9e103hxrSMbBq3pKuT49Wt8b
         kgOD22AF2hrR4vAdMm3lbk7BUdun/mml0/dQX/3RkqfiMZZ0h60EDzA883yVCUJSaVU0
         4OEZFtTxCdI8sX+nofFIi+aY1VB9fff2tMigN+lQk6bOGJ5Fg713fB6U6MB4O2HypP01
         O/Ysb+L6KTSq4FxyUnxg2EfY6RhpJ+PrCXFl7CC6oVKz4NtlGF3ZZ2GDs4jysyaCHxBq
         OI6p72Fazh5Hn80fIYOegNMQw16GMmhGaZCxzovdZi/XX9x+LNF6nRkKn2t34Wi8lTYz
         aEWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774864138; x=1775468938;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnID34Go+g2KnNZbh0BK6ZRqYtzkBkjxAb6FB8NCtD0=;
        b=VvQXdS+ulwOC5Nlk76IRx848eBoF1y5ENgPInM4K984izPZFyh1P0swDjrNR5SsKiJ
         q8NUVTSA5VJWIIQBKav4x1z6REvfzqPgppajp3eZIHK0KobseAeHrEcFfKfNQAV7vbJS
         q1PyPUMOQM7fbF4BPIe8MUWm8hP+xINJgqUlxBrbmGOu2kxu5rlIWjqwrYb6s/+8jdA6
         YCc/4zuyutozNcAYhj5ElH5mDWjGOGRC2/TdSBIc8BnlnN8vdPPvDLY1bE5TvrowWUuZ
         mAbI5lICsyT5qFPtQ8NerKZmRBJ3ZnuCAPWsqFcU5Zf1PYItZ+fB9iY4gE5ADRljYNhb
         lA8A==
X-Gm-Message-State: AOJu0YzgaSbk69ea5z5qxHRB9sSZUxQgp7tCqNtfDocNYVNwSc+V+10/
	Csy2FsEd7F3XsFCc55wwdo33/DACrzQMDR+/dRTCmRFU6q5PLwfUSaVd6epuHYx5GvA=
X-Gm-Gg: ATEYQzxwZ9qc0mAOwRQr/wiZvyuk3yKx5PYW4tuedBs7Wcbpg3IGL/gIeN4vUslf3Wn
	oq0sS4D+pfb1Z7lOzmd294uHQtkkdA9UhgaRuMe3URoHfxtQzOUS4qy35si7oSx6ACmIdL7sZ9q
	rq/no/j3mgzbKSndz1Pv2pHNQ/MLKp1Eco2bpp1/9ydA6BnCxW7J6vLUPDPJ1qxPuswKB03t9nu
	vorDb1D+F6zYph5PnERbUkwR5yUGO1dQxE92Eh9u9Qj5wY1JEJQVubUR/pvep/V91kMJtk/RpXV
	YkxiEE3flSEnJUjNJGzqB1DOv7o4eamIyNJwM8qvO0W/gQ6zeRaqKHl0USfAWOGnbZ+rIev9Krs
	e9+Rw5Coqcf8kKle5QuDJLG20pa3KY118hsgAclEr8Tj5bI0B157hSzDVAlVCM3J2fvE0I1Y/Pd
	MSzrIZJvUpKIqD9FY2nxKyYg==
X-Received: by 2002:a05:6a00:1bc8:b0:827:32de:d197 with SMTP id d2e1a72fcca58-82c95ee606cmr10315928b3a.40.1774864138373;
        Mon, 30 Mar 2026 02:48:58 -0700 (PDT)
Received: from bytednace ([2400:8902:e002:dee4:4f47:94b4:9ada:f58c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85fcb84sm6401991b3a.49.2026.03.30.02.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:48:58 -0700 (PDT)
From: Lisa Robinson <lisa@bytefly.space>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lisa Robinson <lisa@bytefly.space>
Subject: [PATCH] LoongArch: Align FPU register state to 32 bytes
Date: Mon, 30 Mar 2026 17:48:45 +0800
Message-ID: <20260330094845.39-1-lisa@bytefly.space>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move fpr to the beginning of struct loongarch_fpu so it is naturally
aligned to FPU_ALIGN (32 bytes), improving 256-bit SIMD (LASX) context
switch performance.

Signed-off-by: Lisa Robinson <lisa@bytefly.space>
---
 arch/loongarch/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/processor.h b/arch/loongarch/include/asm/processor.h
index c3bc44b5f5b3..ce8b953f8c79 100644
--- a/arch/loongarch/include/asm/processor.h
+++ b/arch/loongarch/include/asm/processor.h
@@ -80,10 +80,10 @@ BUILD_FPR_ACCESS(32)
 BUILD_FPR_ACCESS(64)
 
 struct loongarch_fpu {
+	union fpureg	fpr[NUM_FPU_REGS];
 	uint64_t	fcc;	/* 8x8 */
 	uint32_t	fcsr;
 	uint32_t	ftop;
-	union fpureg	fpr[NUM_FPU_REGS];
 };
 
 struct loongarch_lbt {
-- 
2.53.0

