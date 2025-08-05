Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9318927E05E
	for <loongarch@lists.linux.dev>; Tue,  5 Aug 2025 14:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754404011; cv=none; b=RK4hc94jxtxxZNMZEVMXtoS07xj5e0NtPcLA/dBHVS2g89jw8JwemetiI3w/jBqHO37NN2v+rLbfbNX/DVeeMyhPYiWpzRowv+u7V5ybRE11fzFmlDALiebrYxLEPgicGl8W1r671SuvXR8yGGP3aitFaam5jWBkaoRtYGSIupI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754404011; c=relaxed/simple;
	bh=HO6xp1CoFq+jAn2vTPWKpquTWdMBDrwRvZY+n8G972Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HGSUigm5sxjhZ1Zopi+Y33TdA2jR7U4e74fx3ngxPUoIZUcJY/G/73p3yzGc0D35dtTrLa9X/R1RgVSOO7cuxH44I5ukRDlvmpFhYWsDSKrbtoFUAQxnyWmp76I4cluQ3LZycpUfIPQFoKg8jnuv+ERd46lZQhwVR8EjM+SMJnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S4I64tRW; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S4I64tRW"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5561ab55c4dso6047224e87.2
        for <loongarch@lists.linux.dev>; Tue, 05 Aug 2025 07:26:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754404008; x=1755008808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdpO03g2oqaaq9F6m1+GGOlZl0qQTOQbdkE3YGqW9w0=;
        b=S4I64tRWCGatRPESchJTaJcfEu4czVe4wYyPIZLJeCFrCdyh6VGp0RNWf80QLi1sWX
         FHMZ1+h1FiyFMCVvxj5YYC9pbOhmKv95LH1Km9OrBN3Eiy4y/5GIYtB3WPzrHLE3rCDt
         drckGNKvj/xc/1up1yicNLKeUuCB9z8SLTZAxtUBJjCfJt+jgRfGrlpc/69pxHu0BFGi
         k9wtXbcIYHwQPMc9B7hK6H7hDgT9dNxKv2OSiZg+jzJOTyEqzDgmS9dVZm0Zr4TzXlUY
         I7s82MXcJUt7tYFP9vKMOI4RW+MnRyq4j4owXALylKKAL4GXfa+mHsLpbQR4koNADKm1
         Uikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754404008; x=1755008808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdpO03g2oqaaq9F6m1+GGOlZl0qQTOQbdkE3YGqW9w0=;
        b=WyDpuspL/GYw4Xf/8euzSSb7ALGta5xF3aZVcb8Q+GMeq3afPOxXxnYY5biXfmYrpR
         7pM0bs578CgsDsfwWQk4nwTuC3ayG7b/SOsu9SZMbbrre/w5isvNw3s5+EhiEECxnrmQ
         JJFPoKsW5juCIiVzXSntMthT6I/0PsVDAHgDOpGgLFBkRgmvRU8wK5KbCCh80RgjALyB
         5tCXuqzCNMzmnLUt7DWYqC6Ws4P0CgiHb5lhZZDlJwrQ7Vq3A5uDWHF/n425aXWoO1Dh
         WFLE10eP7OuaAoms1Ixg77X1CaUXScUgT9EBxt83BtHQIHvdKiwrgV19gNfbLTkOzDZg
         abCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdt1ccSCmy37dOevAf7cJnYor8AXW0vvbncMJ42Gn+EIc46oqYXlYqav55c8P6c2XO8erCVsWctgY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxMcMFYHB61ODhFeKWsObKPaUJNTlBnlPDVmi/9qYEYyl3078Ev
	dQXcvfOBfe40BT8W9HVtY83vEVzd//AfYJHc49N2FU5OrX/wvXeGd2PB
X-Gm-Gg: ASbGnctAPkMeV74rr8uT3Fe5L1mN3PN8rzygfdKvF4l8yV4tUCCcQ45rEhmGTDNr1LH
	gnZOVGIBPVlLhwBRZwgezkKHi9yDxjMWism/hyxr2zTQ9hHmdjtrRAzBMFuNkeRYe0HqG1MtTVJ
	mkqt47I1im9hhe9bok0lTXudcm8NJgiK/28xHFCh1If5qIngMVVTk4uZUTNyoxK6aHGZhjCuNqL
	yrX8O5ln2mSxpTk6yfkTgtNWhPUj2zajU2iClH0+Ki5FCzq5TxCqeQG02DifraY9Qnwyov7NeJ8
	v3VqZvm+PNvzzQbj00AXPUlUzFZWRXrnFRl+XMrvLXTTHX7S6+k4MTgq2XdG679loJVOndz9wJI
	rUzJyeIOqIILPcMif2ULupy0kyki4lYBdJGZGCYQAceaJPnmC/GH7lQ/Zb6NOoeHks1nXLA==
X-Google-Smtp-Source: AGHT+IEVcUaDrsN/KncF3Ds7Ejr3CDmhOGcodfBsVHrYzHQORJKCgwrZQppnXPfaGPKlSAziWl9h7g==
X-Received: by 2002:a05:6512:1254:b0:55b:842d:5825 with SMTP id 2adb3069b0e04-55b97b9395fmr4615455e87.43.1754404007496;
        Tue, 05 Aug 2025 07:26:47 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b889a290fsm1976379e87.54.2025.08.05.07.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 07:26:46 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org,
	zhangqing@loongson.cn,
	chenhuacai@loongson.cn,
	trishalfonso@google.com,
	davidgow@google.com
Cc: glider@google.com,
	dvyukov@google.com,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-mm@kvack.org,
	snovitoll@gmail.com
Subject: [PATCH v4 8/9] kasan/s390: call kasan_init_generic in kasan_init
Date: Tue,  5 Aug 2025 19:26:21 +0500
Message-Id: <20250805142622.560992-9-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805142622.560992-1-snovitoll@gmail.com>
References: <20250805142622.560992-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which handles Generic KASAN initialization
and prints the banner. Since s390 doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, and kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

s390 sets up KASAN mappings in the decompressor and can run with KASAN
enabled from very early, so it doesn't need runtime control.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/s390/kernel/early.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/s390/kernel/early.c b/arch/s390/kernel/early.c
index 9adfbdd377d..544e5403dd9 100644
--- a/arch/s390/kernel/early.c
+++ b/arch/s390/kernel/early.c
@@ -21,6 +21,7 @@
 #include <linux/kernel.h>
 #include <asm/asm-extable.h>
 #include <linux/memblock.h>
+#include <linux/kasan.h>
 #include <asm/access-regs.h>
 #include <asm/asm-offsets.h>
 #include <asm/machine.h>
@@ -65,7 +66,7 @@ static void __init kasan_early_init(void)
 {
 #ifdef CONFIG_KASAN
 	init_task.kasan_depth = 0;
-	pr_info("KernelAddressSanitizer initialized\n");
+	kasan_init_generic();
 #endif
 }
 
-- 
2.34.1

