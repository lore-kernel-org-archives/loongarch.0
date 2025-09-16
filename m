Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56E9335BAC
	for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 14:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758034658; cv=none; b=PD6qglwej+ZXG3SVsinIXdor0tIJKbbW9x43tUn+pJJsCMVr85flhpvfzIDqxeKzn1obiQxWt/yw9JvARBLwYdgRyA/foa8PpID5XZx69GrAkjb5FJBhiGrKlAzG/QUkVFvHj3XSFFy0Mf7++0GNsZG0+Tiq+XfnYNW9mlGzxSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758034658; c=relaxed/simple;
	bh=8palloZvosHrIgHRGThUtWJIYbk78Nd31FUAB6PjsBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cBjgHKnTopJ0X/AmLv4IvvOYphvY21Zb3eUohuBB3NVaQscHf6+gvsOK26ziE9VA/ysYwhPAhUzhuTVOe/bsVJ+IOTahrTuBnzq+2mgqmeF63jrnNodggzZTGGFxZzc8X93YNe2Pda6pBQnzkIVy1sepq7kHKQyKhNUPJVnudPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZO0Q+VPU; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZO0Q+VPU"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-261682fdfceso28209965ad.1
        for <loongarch@lists.linux.dev>; Tue, 16 Sep 2025 07:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758034655; x=1758639455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BhPFazCfoeMydP8mh5h0YOREkSkQ/yfL4yFrVQbtIJk=;
        b=ZO0Q+VPU3vldcxatKQvhFg+6sB3XnTPuOe03gskz1j2+gcKGzNsgTQzzZ0XB7ynelr
         V/0zRCuer+5sAUj1SYAhjwuuADhQ1Sbcfveebf+vYMSkCz7w8qL7RTwY1QyTrM9+BbyE
         n3VKxa60NUae24ohJuIyMpBm/NpFgB0g7ByEO5tEGtkh0q1wf1eNeq9hD7E3VXG7OkV9
         jNLVqFl0lgEV22YUQw0qi8s511BFLfZ3gSuxcUkSN9E3LPVFkqw36IILvypnqW+UFBxy
         KBgSnOpsAQplNUZjB5f0RkTCW/rA85V+3TyAUyIkfau5irpP4Y7KXH0S8cPDy3qTT/bc
         K/Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758034655; x=1758639455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BhPFazCfoeMydP8mh5h0YOREkSkQ/yfL4yFrVQbtIJk=;
        b=IbK3Dt2cD0qVX9feX6YpnhGU9d386DZW5hPam5LwzxCTgYohEP8cdxWuHgv5FyQQZL
         7iTUi+K0gLqvYcYCLBZ66YRqKFcBi/zXOuKlTzthP3y9s56G2+qBAMW0pf/BZoTvAQio
         K4f7EU2cdsKJsJzGASM3U9hZaOSYjXePQbYkQGKx+sbWROeG+BuQHmAmapTLXSCfu6mi
         TlothCLKuk97ECxs0d26cjGkFMc571Tfsy9mfcjaCPnljbHvtnVoW990mGxoizfcLUwZ
         1Ymsm+hFmAXX7RXf7BIUKpGXd4nZsH5djfCX1Qt4pCER6ADc7o3s5SNspC71RoMS26mG
         o1Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWiyRs96tpvJ6XSfQoODl8dweikq8E7V1Bk30hNHDJLCqBXXPuMwyAutAKvQD9Lg92aOvfVylmgG28=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdCUJ0Kk7MhMJs9G3SpjVfI8JAdAuDvFcG65dWmOhnwZ40wHq6
	pNe8YcYW/XRop5nQ8/0fmB3HTKwjeLbea1ysOHPGSqzjgViOoJJJp6GA
X-Gm-Gg: ASbGncta6uphGSjYJBvuTKuQQz2wrG5m28BlsYc5sJ9OUYQx087BEzgS2FAm3aNn2v6
	mvI/xyTvaTiyZpguRfeW4Y63QtqODmAcczdvTsjcW7XUa3s2HpVEc/JAmXoPFvNTC/OZBe2tOxA
	xlO1uDrXxukpL5eIEeQg3jBVSPW3sZQm0NV8YZdPs/0n/kvMzqEESgVhvCu069iEI4G1kQ7B3Pl
	U6agN3MhL3ALdngoOPPy/MqvvOrX/ZYXEka6/dd4wXTUGvuRzU1U8mIjNnSQHi8ZZtciWsoaTs9
	G//BWf4H1gV0Rdg5+Mm7eVwREcdryYNbXJvA1QrTljnUpjWzkoiENRVpFuZVaERbcOZk1KWRUBA
	GoWy7W3aFupPXJyK13nd5tNY=
X-Google-Smtp-Source: AGHT+IE70dT64itvjVNcN+FspZAaHywtKEf5DdHLD2RGP4yJ8tS/2lNgczMINmrv9xvEqDqg18WQaw==
X-Received: by 2002:a17:902:c945:b0:267:c172:971a with SMTP id d9443c01a7336-267d15d7bb4mr43532905ad.18.1758034655035;
        Tue, 16 Sep 2025 07:57:35 -0700 (PDT)
Received: from lgs.. ([2408:8417:e00:1e5d:6d43:6fc3:26a2:6645])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267a5b097f6sm48728095ad.11.2025.09.16.07.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 07:57:34 -0700 (PDT)
From: lgs201920130244@gmail.com
To: Huacai Chen <chenhuacai@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Nam Cao <namcao@kernel.org>,
	Xi Ruoyao <xry111@xry111.site>,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Guangshuo Li <202321181@mail.sdu.edu.cn>,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: vDSO: check kcalloc() result in init_vdso
Date: Tue, 16 Sep 2025 22:57:10 +0800
Message-ID: <20250916145710.2994663-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guangshuo Li <202321181@mail.sdu.edu.cn>

Add a NULL-pointer check after the kcalloc() call in init_vdso(). If
allocation fails, return -ENOMEM to prevent a possible dereference of
vdso_info.code_mapping.pages when it is NULL.

Fixes: 2ed119aef60d ("LoongArch: Set correct size for vDSO code mapping")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <202321181@mail.sdu.edu.cn>
---
 arch/loongarch/kernel/vdso.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 10cf1608c7b3..da7a7922fb24 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -53,7 +53,8 @@ static int __init init_vdso(void)
 	vdso_info.size = PAGE_ALIGN(vdso_end - vdso_start);
 	vdso_info.code_mapping.pages =
 		kcalloc(vdso_info.size / PAGE_SIZE, sizeof(struct page *), GFP_KERNEL);
-
+	if (!vdso_info.code_mapping.pages)
+		return -ENOMEM;
 	pfn = __phys_to_pfn(__pa_symbol(vdso_info.vdso));
 	for (i = 0; i < vdso_info.size / PAGE_SIZE; i++)
 		vdso_info.code_mapping.pages[i] = pfn_to_page(pfn + i);
-- 
2.43.0

