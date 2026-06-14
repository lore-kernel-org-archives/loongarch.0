Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0D32D6E58
	for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 16:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781453756; cv=none; b=gWDvi+TeutUdqyalHnm1AbSFcMTTiNpb2Ea/eL+R2DhZ+CAqo+2opfeCtFm4+9ShaSijxkiY8LqHr3+urPdqMHHW09tn+Ii82HHbojpVz5vkbFnMmv6e7QQwm2LCapEi02bgVNZ+7rRCC9wGYyI1luOJKtfMMgNB6lGrZPNc2oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781453756; c=relaxed/simple;
	bh=9M8qcy3GHoRqZek9jrO88UWNLue8IWYXVgIGIjRr7DE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tClVqKO6ZlHXylGBkX5rUhHjjShe1hSEBIRJ8jT6gCvzkmDEE/LtFwcSBWL4924//8vAdR7oz7iPup8B8Iv3uPPXlsMokPRXNUpI4wFRcE4txh2o79wDCD4hFLNAcuM3dUvmPUvxYKh1DIkpaNnlt7YSlYwb2NRf7/vvJ89y9jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTpp3jwD; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTpp3jwD"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c40397e3caso23478785ad.2
        for <loongarch@lists.linux.dev>; Sun, 14 Jun 2026 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781453754; x=1782058554; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c2wi3fuynWN++wbFE7He/JKQQu5s6vMv8+4f6t6QhDY=;
        b=KTpp3jwDLhrtA4peosQZyezvuvNkj45NPHUtGw0vL8/XJkDXiqLtPQhxo566BWsb8D
         Abr74UYam3DLktY7pQTst+noHnLcFDRpBR1fU24ryHjL1743K9fThwLK3D6US7+KMb8K
         W4hwRL/9z4mIdiS2YZ2pWn4O5H/+lOQsFZjd+XRaE7+CrrGriYcLMX90VfVrMWAnTsYn
         ATWPfu4+5sev6F8Vgb4QL0SAlF59hzT3SOqXOD5CPyN39TAkHdCPNzYPWyldzqwUgNlj
         e0q/Yektq4R7xsmYEvzT/aTw9FjYE6LGj6lyHoEHPY1smUXPVxKXdk1jyPoh/b8fY8vs
         yzbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781453754; x=1782058554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c2wi3fuynWN++wbFE7He/JKQQu5s6vMv8+4f6t6QhDY=;
        b=QXOU/miud/6atFpMit+ayDp8tNWcYZF83y+29rZCBppSCfkr+W9uKeQUFvRZv9JB2i
         NwI4erGmOao8YDqbAUk7jDTBCPVloZgj9N/wX60oqq9ZLBgXuU5KVih4fs7SV5akmDXB
         aBiU3bDLGeCV5qPp2/N80ZffIuNKAs4ISYi3+DBIRsvNzevh0/qvIosbcMq1+0tndfsT
         S3WXIWUPJDz2nQJIRJ6+N3jDqoMuC7RkqONohaM+535ccsggkQApJ7Ss6a/moSrvwf+I
         1k2d1COJB8Nhxatc5kDhQJsgIbCNGi1FcJOTuLbypkwdxNjQ9TpKfmSFAUSEJkCkx+WD
         oeNw==
X-Forwarded-Encrypted: i=1; AFNElJ+cZQjGpuC6fKKfSV2RhlxmRWhsp047dJ9K+uLik/CHXIE/uPtXuw1FdgDm2qEnlA80n0ZoHMBLF54=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJJECCJZrKj+t91JTvVKAN69DVhyPXiKQqZiX8C0nhn/o3OJ4O
	G8WNkA1OrOO2Ros3pfYYvi6+ssbb3Sqi7ypSw2A3a20cRm1dnhjo3iih
X-Gm-Gg: Acq92OFaA9EdP4peH7ggXd0KNAmYi0N4MwvvEgAhM3f9zZslrenFr3mtDmTx7dGdlGQ
	WKTKdNzJKrcQapeUHfoEVHnbvZR3YocIluQiiUBdUGnjeFkyfEHXNmahAsFS83JKeV4FXV1orkU
	xDOSGsEZx6uUu2sM/X/fV5QuJD5lo+wz1WbxDC1tOI9yOSEym/N+7NXj21vjXaOQHpkIKgOkG8K
	NrBa5+S/489qY9fmm4anDP8yT4SVscyMpthXnEP4HOPsfs7qPMzFMN7HqCbixZmAqGCoFO9HsZG
	ibXIYY08esv4oRMZrWeBMBC8Zlj/3OlLO7f987qjJo61AaoDmHaatcAalAPXspWQJIav97BYSu4
	QqPJdKUNrYvi7jl7ve5oOe8G6lOesKSC6p/YjA/d8DPFBNDuuIjKbdCiKZAZpXZbEZIq8IgyM7G
	UsnTACyKdOll7eNhsbAg==
X-Received: by 2002:a17:903:1aad:b0:2c0:dd75:e834 with SMTP id d9443c01a7336-2c41050af58mr130859675ad.5.1781453754016;
        Sun, 14 Jun 2026 09:15:54 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d1d3sm6505293a12.11.2026.06.14.09.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 09:15:53 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>
Subject: [PATCH 2/3] LoongArch: fix misleading elfcorehdr reservation success message
Date: Mon, 15 Jun 2026 01:15:02 +0900
Message-ID: <20260614161503.2219681-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260614161503.2219681-1-ekffu200098@gmail.com>
References: <20260614161503.2219681-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_reserve_vmcore() does not check the return value of
memblock_reserve(), so a success message is falsely printed when the
reservation fails.

Check the return value and warn on failure instead.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/loongarch/kernel/setup.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/kernel/setup.c b/arch/loongarch/kernel/setup.c
index 839b23edee87..702fb3c2b3c9 100644
--- a/arch/loongarch/kernel/setup.c
+++ b/arch/loongarch/kernel/setup.c
@@ -255,7 +255,10 @@ static void __init arch_reserve_vmcore(void)
 		return;
 	}
 
-	memblock_reserve(elfcorehdr_addr, elfcorehdr_size);
+	if (memblock_reserve(elfcorehdr_addr, elfcorehdr_size)) {
+		pr_warn("Failed to reserve memory for elfcorehdr\n");
+		return;
+	}
 
 	pr_info("Reserving %llu KiB of memory at 0x%llx for elfcorehdr\n",
 		elfcorehdr_size >> 10, elfcorehdr_addr);
-- 
2.43.0

