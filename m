Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42A91D61BC
	for <loongarch@lists.linux.dev>; Wed,  7 May 2025 07:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746601911; cv=none; b=BIqEt4MakkWO2IwWFhN849SD1LgjKxOypHw7HyV3tdhx9mydwEKWBqtW5fRNrOQV56CPiy5nlUIyMrSqckfqUae+EfpuLIru+/ZlFen6cZCGvg28aJ+QlYwfvA1XNfmRTojbtGvL1+onb1TQjaNc6wVdaDtSohI9pWrmbVxbPo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746601911; c=relaxed/simple;
	bh=8fnvLCB4q9di2/shpRoPyvOXBtQy10A9RXLh9Ei52Do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EMZVlBkxSIETAjI6zm6x8cR9ZdPux2TYshXfOkx1nBC1Pb1/cqROPvEuaxhj0NDYRajW4zqoi5uRCHk411IQ7wXMBfujslWVdAOIV4xAvaPpSAd3TnfeJWTRikdaJEN6tqA4Ik2+zH9MQS9ECGIi5xdoE8++h9b+RtgjBCLicYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=kizLY0gy; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="kizLY0gy"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22e661313a3so3110555ad.3
        for <loongarch@lists.linux.dev>; Wed, 07 May 2025 00:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746601909; x=1747206709; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5lzn4RZmbI4fRSaKNfr+/7WaMGj6wGPqEtsSxdD8HoE=;
        b=kizLY0gy6t9ZKX/UxjPP/tHeoCbG7IVtdufx+epvDAxJUHlqgNw0ojn/WEvJmqiBGL
         t0JpfPyhYVQmDhakWHvjQXMiGea9kIuGWCllfKmaJaD6CqSHhlg1U0e5x0odou4p7nV8
         KgEPY6h5lSqZu6cgaqI/JWHxPHzdcroVK1YDTjasQl5pAL2T/nDkAnteTrNvRrJEbF1X
         Vs6RMIOUdXKteQxfm/90kci83wq5nKo92IoApia2Pnhm8xH8qH4nP05MMVw4Bj1eNkMA
         Zy8m4pg3JhMJp8euj30ROGl9eVex9ttBN2vN1NrALp4tCIT5AOaVEbfrgUpM+GIgdsv4
         rClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746601909; x=1747206709;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5lzn4RZmbI4fRSaKNfr+/7WaMGj6wGPqEtsSxdD8HoE=;
        b=SsnH3n11T3ZPUHgXePyPswZEMU173Jd90Aoryc65hmFiDxp+rTL36oR/cRGbcdI5WQ
         X3LuR8Lsk+GjG/NNxelAN8H2VBU+tOft2n7/GN5pZzDTH06C+/O3XLAjrm9Fd7hrItNz
         y4WdQxnEWJX5lVnoyXTaBAuXI6JvAGr8iJhi8xwkP6R/CVQo43ylIDRbmn1i3O/ir6pk
         IlPJTJVG+IbneTZia7I/mqIoDNSPqzz//ZuUo3Zi65RXZdM0Mx5U3BrAnUf337tNdmWG
         bmGvQDaxgTU8oO6Jc/f+wGcuKnrRg63E552xPmx68XX32MnpUWX6e4XLE9IHYfG9Ura0
         zRIA==
X-Gm-Message-State: AOJu0YyXk4lu6x6Pu/DoSVD0I6PGyWF6KM/7GsR683vN5cJLFcWipzu+
	+VkmZU5sO9kc+zhiix+2LVUD+qRYrAcXIymSbBt5lfubHBb+s3yx5mR2XIk6evU=
X-Gm-Gg: ASbGnctyPv0sWU5pX/Xz8KDewseQS8Y62B2nFO4uRQQEYTRr4xZ1dkWeKrB2IEhcSzN
	tYbj3F1H9S99VSX11S5X6faToFwBDnJhypuKdxZHFuCZL8wX28L/qpBI4PCaXLBnNmdBupoHO9U
	AUSEzShQ0FOmvH/cMT4dzUMuI7WuadMth+KYAN/0EGKs9gOZ/uXr2coZi35fKLSaYwmVQF+Q6XS
	GfKifnaBjg6osFDVV03rq1VOjaTZjD869j5JG5DbLenCDmFZJKDRnQ7CkBd7ZdzDKrbGfu0KHGF
	KIDJ5K3nDNYfK86sD05UaqRRwTjD/YK3n7VuAu9OGR6YU3HkYDnS4gN5
X-Google-Smtp-Source: AGHT+IEe8gp8laZ9M94uel6cyR5zf5BuwHLhDVIoev8vvFvIWWHAWfIW/cCahX6Po9V4t8k//8gPZg==
X-Received: by 2002:a17:902:dad2:b0:220:d909:1734 with SMTP id d9443c01a7336-22e5ea385d9mr35488805ad.14.1746601908970;
        Wed, 07 May 2025 00:11:48 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1521fb3esm86085475ad.121.2025.05.07.00.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 00:11:48 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 07 May 2025 00:11:30 -0700
Subject: [PATCH core/entry] LoongArch: Fix include order
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-loongarch_include_order-v1-1-e8aada6a3da8@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAKEHG2gC/x3M0QqDMAxA0V+RPK9YhQ70V2RITVMNSDLSOTbEf
 1/Z43m494RCxlRgbE4wenNhlYru1gBuUVZynKqh933wwd/driprNNxmFtyPRLNaInPLkoMfcsT
 YBaj10yjz53+eANWoJXnZFx7X9QN59SuldQAAAA==
X-Change-ID: 20250506-loongarch_include_order-bbf509faca15
To: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Gleixner <tglx@linutronix.de>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1291; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=8fnvLCB4q9di2/shpRoPyvOXBtQy10A9RXLh9Ei52Do=;
 b=owGbwMvMwCXWx5hUnlvL8Y3xtFoSQ4Y0+9Kfk5iXskfPnn2td45QyxcD14kLex8u1Z212//0q
 4eVihZaHaUsDGJcDLJiiiw81xqYW+/olx0VLZsAM4eVCWQIAxenAEwkqZKRYe+JeF/2yrOb3zVk
 Lfn381HWrgUPp8xr3XKyYY1NurGL5CuGv5IfrR4+uXhwSr22TJSIptACvsfhW7r+Bygcm57RIrL
 8BCcA
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

Reorder some introduced include headers to keep alphabetical order.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: 7ace1602abf2 ("LoongArch: entry: Migrate ret_from_fork() to C")
---
This is a very minor fix to a patch previously applied to the core/entry
tip.
---
 arch/loongarch/kernel/process.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/kernel/process.c b/arch/loongarch/kernel/process.c
index 98bc60d7c550fcc0225e8452f81a7d6cd7888015..3582f591bab286c30127e715c47d485f74d5e2ca 100644
--- a/arch/loongarch/kernel/process.c
+++ b/arch/loongarch/kernel/process.c
@@ -13,8 +13,8 @@
 #include <linux/cpu.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
-#include <linux/errno.h>
 #include <linux/entry-common.h>
+#include <linux/errno.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
 #include <linux/sched/task.h>
@@ -34,8 +34,8 @@
 #include <linux/prctl.h>
 #include <linux/nmi.h>
 
-#include <asm/asm-prototypes.h>
 #include <asm/asm.h>
+#include <asm/asm-prototypes.h>
 #include <asm/bootinfo.h>
 #include <asm/cpu.h>
 #include <asm/elf.h>

---
base-commit: e43b8bb56e537bfc8d9076793091e7679020fc9c
change-id: 20250506-loongarch_include_order-bbf509faca15
-- 
- Charlie

