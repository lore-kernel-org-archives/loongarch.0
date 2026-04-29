Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C69F3F65EC
	for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 12:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777464225; cv=none; b=SvZEUiiE3VXgahRnnx5Eprwmoa9y3+4EGx+V2VksRbukJf+rY2YMGEGyc1MChDw064mvLiWdhZ1ZYMmjw87OHu4m7cc9kzF4XxulyasQIH5VNtR76ToOlhhsSjbNIn41R+KLcQiCiWZ4ukUW6+QoW6+YzPFIlAJFpd8/eZd+1Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777464225; c=relaxed/simple;
	bh=0HbWEFap/x2oXNG2YyKXf3ucWF6UibURcORpeo/4CBA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkCuU0P5SqTW26GA94OPqQkfhrfNKtfsMurcoP65X6VzOnpmya8+5kZvsDe5nQ20E3IVp9AW93YLtJuLfEitaFWHZqgYKkFjHkpyUQZj9TdCz8GhhcGKBQp+wHzabGF5UhV83pijJVhMRfYukcmfG+HRVl8IoRa1yB/sd6kXE0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc; spf=pass smtp.mailfrom=hev.cc; dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b=i3fHxx0T; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hev.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hev.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hev-cc.20251104.gappssmtp.com header.i=@hev-cc.20251104.gappssmtp.com header.b="i3fHxx0T"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-824c9da9928so6060135b3a.3
        for <loongarch@lists.linux.dev>; Wed, 29 Apr 2026 05:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hev-cc.20251104.gappssmtp.com; s=20251104; t=1777464223; x=1778069023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZSqUPVvVHrJHdl2goTYBViyTH/4ppdxe03roQ8yBtI=;
        b=i3fHxx0TqveBMjMlh9JF8eGkemmXc1nHwqtIwAdp2/sn9hxGQiomsmF9VOg5Xvc2gS
         aTeBdnfWvC3Vl1Tv5m8J4mKZWpn8YquyefqlrFeqDKbP16FqfGxK0EyQilmHNZcoS9Zn
         ZiAB/70FWewu5P058XwVYFz8rR0+yMvxiqK2ybhQqraf8RNJ6hU4mW+X/NssV77wa7Qr
         T5zm2ie5gJfPc/Axqy87fA2X+s12Ue0d4UxpTYe4fDqYM/ZquUx0Gj0y5cFzdS5HjFQz
         O6hIfe+Ac/tSGfVtRbXS60Ovybk/7OfNZK/A3tWogQ6kLVHr1tXVXT+fzS58hC+fS3hN
         7E/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777464223; x=1778069023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pZSqUPVvVHrJHdl2goTYBViyTH/4ppdxe03roQ8yBtI=;
        b=ZWqACThKhw2ltB7LsVEIRSn1aRO8fVsOP9Aks8wYz3lW7e64VsfBvwypOL0PyfsUCo
         +CoaETvIzIdBVWcWaCtnTvmFBSsWG3BsSWlSyxVVvlmCMo9luulzXIBMqrm68QtXgn90
         6gP5/et7JIWJtIpvnDZ6bY6wi6ugQ5+DVdTTISwbEinS7kjpC9yJID32pxrIy8vAF0/J
         O2K7HTxvuhm/I15bx+cc6GMbULPLZSCCPAK40Imiz9ePimX/tVbuSRBhOar4giikjzFN
         5QBmbpe7I73GGa4qFbehGOmDNq+4AWa9DR1GG5WFJL6BnT7yDE1oC6RRs2vSPB1C/Mee
         r6sQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WVTQHVK6XxEipSCAd4KAs34oYTTF4y8BzjqqbNFQySIxZ54jrcKZ5RTvWlc50CFUrgbJGU7pC5LM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFdif5/d5vi7p5SLmksv7+yubObgXZmamAu1D0GSUC2Zz7S1i/
	6NMOpmsOXf7cokr53dEJIbCVqTqWAqpdHWVf7zJw6hzmwGbsRhtx34/ALhySjPaGq1E=
X-Gm-Gg: AeBDievzMxKU3v/vognqYE0s+GVmrRsQMQrrF0v4lfRwNM4joVDXdUycLi/ycPC2ani
	MeK50r6zJXbEYu9vUVhlk+6cJOcomDSgUyhorgMebnik56L0JHEjryzZSUH2cq568ptoalphC+f
	Dh5RxGhOetvZ7CEGZ3VsGK3++HI6zvxn03OGBGCqYaiGyUJommx5EwVj0R8FMAqHh8TCGOe1kVC
	h91b6htGC1v+BbNH9U+241x3dnl4CiNSqr7CkrX0mmSEAf7OxvNQjdIFAhrSUkTEx5pwMsjO2eD
	viTilDWZwZFzzakvab5ktSVJuayHaS5X6aCbcTyEca/UCrEz1wL5NDTxhW83i2AIg1rE/WfO+lE
	lccI6B96rYg8Ps/Hi/+WeXd4WPRuyhlmF9gYIz+fwa3G7JVnHHPZYcMAhmHkzGVwSiuw9eHCjB1
	FELLYAMZZpQyIecvNuIPoCGXVV31ZZ
X-Received: by 2002:a05:6a00:9092:b0:82d:556b:7a01 with SMTP id d2e1a72fcca58-834ddb05a5dmr7285440b3a.16.1777464222678;
        Wed, 29 Apr 2026 05:03:42 -0700 (PDT)
Received: from localhost ([2400:8902:e002:de33:3dbd:69cf:4a22:309])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed5efaaasm2016493b3a.27.2026.04.29.05.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 05:03:42 -0700 (PDT)
From: WANG Rui <r@hev.cc>
To: Huacai Chen <chenhuacai@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>
Cc: WANG Xuerui <kernel@xen0n.name>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Haiyong Sun <sunhaiyong@loongson.cn>,
	Lisa Robinson <lisa@bytefly.space>,
	loongarch@lists.linux.dev,
	linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	WANG Rui <r@hev.cc>
Subject: [PATCH v4 2/3] LoongArch: Skip relocation-time KASLR if it has already been applied
Date: Wed, 29 Apr 2026 20:02:59 +0800
Message-ID: <20260429120300.1786210-3-r@hev.cc>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260429120300.1786210-1-r@hev.cc>
References: <20260429120300.1786210-1-r@hev.cc>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the kernel is relocated during early boot, a randomized load
address may already have been selected and applied. In this case,
performing KASLR again in relocate.c is unnecessary.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: WANG Rui <r@hev.cc>
---
 arch/loongarch/kernel/relocate.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/loongarch/kernel/relocate.c b/arch/loongarch/kernel/relocate.c
index 16f6a9b39659..c36604a81d08 100644
--- a/arch/loongarch/kernel/relocate.c
+++ b/arch/loongarch/kernel/relocate.c
@@ -139,6 +139,10 @@ static inline __init bool kaslr_disabled(void)
 	char *str;
 	const char *builtin_cmdline = CONFIG_CMDLINE;
 
+	/* KASLR is performed during early boot. */
+	if (kaslr_offset())
+		return true;
+
 	str = strstr(builtin_cmdline, "nokaslr");
 	if (str == builtin_cmdline || (str > builtin_cmdline && *(str - 1) == ' ')) {
 		pr_info(KASLR_DISABLED_MESSAGE, "\'nokaslr\'", "built-in");
-- 
2.54.0

