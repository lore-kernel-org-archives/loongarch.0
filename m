Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739EA2DFA48
	for <loongarch@lists.linux.dev>; Fri,  7 Nov 2025 18:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762538780; cv=none; b=JCm03dla3LH5tI6+IOhzt/GIapcBovk/mmp0WTXUmCinm2sLcathQld/o5M69hk35anowRPqs+WAncxt2kAuFL7sW/RY77/fwdOw/MvhzkmVvRRSUuwPyoWDvEsizYyEmJSpEXbx0AcB0cL2yTG5mK1p90BNiTw4nT/Dzca3nD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762538780; c=relaxed/simple;
	bh=bXO08HsRuK2ScRN9CtJfzG/AzZSvuFwB4eE3T97HZ9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ARvzRC2mrSQXWabpzic1ih87K3vkhe1VBpe1zuQTsbgitsMtrAchV/s8nfsOUYDL167iTQ/VHisUSJg6BYcT3by630RqrT5LrWhHF/0xo8txw7iVzhZCXJCVXKr3OEljNShUKYvSZbqiE4PD8Q2SCQztjej8DlZj6nARjiWDkGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZkKLfx16; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZkKLfx16"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b6329b6e3b0so634118a12.1
        for <loongarch@lists.linux.dev>; Fri, 07 Nov 2025 10:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762538779; x=1763143579; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MfwD5o72GvI3Oi7do9Qhg/wh9m8XWbNc1QLnbh3PlwA=;
        b=ZkKLfx16SIF++jzLC3le+k5Ew/Fu+DkEGtmu9QnQDYJ3rlgmVY1q5U84aQDO/k8bM5
         JPxzrETtL81mBfHOS/M6+pjLGWju5HJdPb4bMWDuUTlYqcqGEGlfgE0a03cKmZhmAHSt
         O/6TfTLvLBVHrnOwWlCNUFA2cdxlgxxNOlSRoDDtHIcfI8lu6mHH/UPWwFrEvSjiLOfZ
         bD7FoXWvZh5ZAUsVB9AhefVG8Y5CZvLZJtbu3JeuJUKnZdWBZradvdKLyqpCrQmlf6uw
         TycKatiJ7sG/JJzgGAKUz3hFTU0wMP7dstiyNjM5Bwelzv/EVsmCVUWZIACfbYukNGJN
         abEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762538779; x=1763143579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MfwD5o72GvI3Oi7do9Qhg/wh9m8XWbNc1QLnbh3PlwA=;
        b=wMq0ABaIrUMILeK++Zq8/PqRIAfDMA1RiqoPTe6r2L741Ef9BCnrKzmezwgIRdiP1O
         ppJPP6w9/3iXm9K/R3xYJ5050eer1uLL3/qqmtb4gGkegar8zI55i9eHJzw9TGQ7iR0q
         K9KlHGLfBMzbYeL2rBQUtVMg8Fk1YfDvQ77v6vBYxXBtCbIJyiTx5WhkUONe8rkNsGWD
         r1t09qcbF+LUPK/ve0gdgnZxHiGIsROXUmqWUmGC4/TuwiIXEkV0pM++hRGRpaYweLWY
         XvJFzLI9YIh0vx+jttdPhsHdOcovZjQ8rDM+Z0nyK4hm1+c06scsKFcUYDfUNmnXpnVo
         v/Zw==
X-Forwarded-Encrypted: i=1; AJvYcCVxvALdeX/d64etoVwIYqkrWZlPIJdTBXsip3oNUsj3cnY8IM+TVQqfxkv9q2R/v6tFcMACjJ84TUE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzPv4ABBbcAyENVFyxJd3do8sZdSjvM1P3LkPMxmK9UySQBD0NA
	vQODpPDAhDbYTlL4q1AqqZnZfUdFe3PgCM60tTR4P5zMJiia3LLA4uew
X-Gm-Gg: ASbGncsmUSsW3P29nQ7RZUpC0KaDMIWZut66UUGLi5wweZx1ZN6zjzuNCysLFT1DMCj
	t0vAPLlVChf+byJ5cPwi/1I9bA/3li3yboEj63h6YSM/12S3CkP1Z+AobfR7ax4/DA85lMiVuZ7
	W6ZNP4Lu1E3EzhL9ERVY4GGDj/XEcC9bPVN9KIlh7TVQu60WsX4Rn/1jXZskM8DUWecgU2xz3GJ
	XT6QnsrJfAU4xdeSb7kUmNqS3MWeS9J/sLMg0lCZM8pesW+HVh7uL0/xAMelHsRRJjHDrJxWUHJ
	f3XnXdmCRV5zJL6yC5m9ePt+mYqX2GGVSzoY1idmKgVeHLe8TuYzt3fhpNwnrllCopQJywUM59M
	LP8KU4YemsuOQRXvHvngLETaxbVIIl1jvG2+seevYEBaLZB5ryShCFC8HEfFJsfrF8kQN9Lid7K
	1Sx3ysJ3ZqKBL9ZgtLQ01NG90ESKL8IStT
X-Google-Smtp-Source: AGHT+IGYsvRM3j8jIBPNh/tOz/jpy7JkvOUnVH0lWt7NtuZkUURJAGNXeQqSigiGcSls55h1u/VBUA==
X-Received: by 2002:a17:902:e80e:b0:24b:270e:56d4 with SMTP id d9443c01a7336-297e1d7667fmr4448295ad.4.1762538778577;
        Fri, 07 Nov 2025 10:06:18 -0800 (PST)
Received: from fedora (c-67-164-59-41.hsd1.ca.comcast.net. [67.164.59.41])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-296509683easm66131215ad.15.2025.11.07.10.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 10:06:18 -0800 (PST)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev
Cc: Huacai Chen <chenhuacai@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Subject: [PATCH] LoongArch: Remove __GFP_HIGHMEM masking
Date: Fri,  7 Nov 2025 10:06:01 -0800
Message-ID: <20251107180601.86483-1-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary __GFP_HIGHMEM masking, which was introduced with
commit 382739797f79 ("loongarch: convert various functions to use
ptdescs"). GFP_KERNEL doesn't contain __GFP_HIGHMEM.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
---
 arch/loongarch/include/asm/pgalloc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/pgalloc.h b/arch/loongarch/include/asm/pgalloc.h
index 1c63a9d9a6d3..08dcc698ec18 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -88,7 +88,7 @@ static inline pmd_t *pmd_alloc_one(struct mm_struct *mm, unsigned long address)
 static inline pud_t *pud_alloc_one(struct mm_struct *mm, unsigned long address)
 {
 	pud_t *pud;
-	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL & ~__GFP_HIGHMEM, 0);
+	struct ptdesc *ptdesc = pagetable_alloc(GFP_KERNEL, 0);
 
 	if (!ptdesc)
 		return NULL;
-- 
2.51.1

