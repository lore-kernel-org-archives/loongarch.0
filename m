Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BF237FF46
	for <loongarch@lists.linux.dev>; Wed, 27 May 2026 03:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779852592; cv=none; b=qu8Kxd4A8UzJE4q2/oCxq0DUFnnHIslxJfR4kkr3uOpcFj2iC8e2dqtxtRlZunMmpzmJx9b2wxnBNhS0LWReFTfLGjtd0rcdBWBsb1ttxEZS3jm+cVlhdVi0Sl8yD1eMg2g8NVEA4iFStkIYzVZ2vCPledUAh8JLgZTU5vDiM4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779852592; c=relaxed/simple;
	bh=ILe8sZYbhc1aPGHkfBxgnEvKOHpdfl8WUXOCF6YnUmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ciKQU+x0S07RXbeCOgIn1EMxMefAcmgtIPUUivTz4SL47ADC21tAf7iprPt5GCOOp9/M9LK4cpnDHYn+XV2fT2yNLHkUUXTGLRo9eZjsnSaNsEemBnYkGwYiXa7rezlQnvClUuY5f7pKnWAioPWSqS1GmOSO8hXzWIXTSCBu1MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rNpWH5+P; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rNpWH5+P"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-841513664bbso3083507b3a.1
        for <loongarch@lists.linux.dev>; Tue, 26 May 2026 20:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852591; x=1780457391; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=rNpWH5+PSgbQGIkBpop0Z3vCDNEyCU0ZGIwBNxgctZ9oAIM6Cp46uj8csIFcGeylkF
         wwzedpd+ra8ivbp7Jh0OHeUnNFYYALf2kzH/wYUlw4VK2zkDwkaFIF9Yw/LhVvZlPzFg
         bgRRzHFtPq2Eme78+niQxuJJHHKFBrgYToDouuCQjhzlkTTbfaWWvY0an3R1IWTf8p4I
         fYLhYeb7w+u1g+gRrh2pFOEWRTElOcYW0IA4R7tyVx3flCAdw2O3XRgFyLcjcD3aKyJa
         Tl3kbGyN9Wjll4cf1+fPGgwFNWz9qcBlUP5ZFGAOypJ63VpJWb2X+2U+OWg2/pJK5IwN
         eX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852591; x=1780457391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D1eYeJpEHCAPY9Qi4Hjh6YOaoS1rocMPAJ4EFRgZ7L8=;
        b=GXkXpa0lqEAGeHbJaW4VIgO5QmKAo02ttozW1SXNyU4tBKe0iFO3esIvmJxzy91ANc
         1haafM7+JLOzl1BDuqbHCwKS3BNVGeO1M4+kRlIBh8zFETEkhu1Et+uwxv1R5PsZMLLG
         jgl8+jrOwOw0FrU+pxQ4xGRB6WKMpFV/xlgiBnniYcW6xI6xk/VB8UpgbHR9Pyegd/5m
         Bo5HgwNUT0apDerImQwq3+R/iRpITkbgex1Gv2Ryrey93JEdhKBoWu/gQvodgj2qfJki
         U9dXXaMwT2tbzTHbv9jI40jF20xxdHQ4juJB5pgFBVeTX0j37xKQQGWDWnHAWbL59GJ/
         uV4w==
X-Forwarded-Encrypted: i=1; AFNElJ8az+gU32WBZwzqghxG1nQnFFtYsqSGy72aRkTGQNq6IVIVHWg9ToWpjyolI9+gRr5G/q84nBL9wHM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxgIgeIVjiT4H9t8uGyIq26wRZ2l0gFmQ+bs+erKQ9SiCjRUB6r
	xBZIvbFmgse4n6owFZB/IoLE+OstYNEtRwy3OrC1GFHiBQgJ6tWoZjLF
X-Gm-Gg: Acq92OHlSc6Vd9VVecRa+F4W5L684etzTlpF7KC9Zon/Fzq/7Sa+Rzt7Eh0uRAoWzLX
	7mhm6rR/56Z1z8iz0tGExngZ51evyJXQ5A7z+EYlgPKpnGNIZrZ6oLwRk8V34dUMJQuVWxkStEd
	Y9fZSU3FTKwPvvgW+lLwe2tUZFxgmRb5XxpUq3+aBhP9nWjx/Ak9qbKbof0VQbAzTL+OPXyIIwa
	DLr84tSg/6BVE/IRcWgKmfDJfBA/oG+2Abi0Rilq4/E1uGOrk7ydt6iRjXA+ka1Ghm2IJpSqIdI
	V8gtFodArvHB7muXszoowpJ93q93skxJWgdzz6O3NxsCem99yGR7EUeDp1eA9mAXIPHsnKCsBX6
	3nmv5fYG7AlR7JXiIB6rY/UKrGafAfOhyY4sM0D+OE4iYVSaoM2QyQ+vxsVUZ+QGJ/gk0ysIKjB
	AhRUYNOvOhF1no63Xbef8rs4u0sJ5iW9brn0JO
X-Received: by 2002:a05:6a00:b483:b0:82f:6de5:90e1 with SMTP id d2e1a72fcca58-841611e8e64mr16309875b3a.24.1779852590643;
        Tue, 26 May 2026 20:29:50 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:50 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 02/11] kexec/crash: provide crash_exclude_mem_range() stub when CONFIG_CRASH_DUMP=n
Date: Wed, 27 May 2026 11:29:08 +0800
Message-ID: <20260527032917.3385849-3-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wandun Chen <chenwandun@lixiang.com>

Prepare for an upcoming change that excludes non-dumpable reserved
regions from the kdump vmcore and will call crash_exclude_mem_range()
from generic, non-arch code.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 include/linux/crash_core.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index c1dee3f971a9..0033d4777648 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -87,6 +87,12 @@ static inline int kexec_should_crash(struct task_struct *p) { return 0; }
 static inline int kexec_crash_loaded(void) { return 0; }
 static inline void crash_save_cpu(struct pt_regs *regs, int cpu) {};
 static inline int kimage_crash_copy_vmcoreinfo(struct kimage *image) { return 0; };
+static inline int crash_exclude_mem_range(struct crash_mem *mem,
+					  unsigned long long mstart,
+					  unsigned long long mend)
+{
+	return 0;
+}
 #endif /* CONFIG_CRASH_DUMP*/
 
 #ifdef CONFIG_CRASH_DM_CRYPT
-- 
2.43.0

