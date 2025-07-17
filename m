Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82DC92FA62D
	for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752762500; cv=none; b=ZFFxki/8m3p8viQeG7YplL9OrT/7Va1MJVvXmcXChCsSvBGvb/B3j536oh9w/yHrnMU9kCoteOK/iFthuo46NSJzop6eLgwekpJsI1+LVbxDaiSbPUYNRaZCdGyqg1w7WNra+nm4FzXgNlL8xnK0xx2pbie+iS8IXQSuCp3M4ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752762500; c=relaxed/simple;
	bh=+oDLrDvMYdcW7Q2MYvDnPqqaPmQC/lb+cp7H6kYc8ws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TI+w/2/harAWrbA3QNCDMgNVYJQRHrYd1qP/ib+hbhAKHos2tZHxNee2rwCNxaIDoTp0IJLJ3x46KwWreLagOJy8AzVsItfZigKQqb8oW1sHxLoBrEtGEpkA4RZ/rGFLMbIUFH8mVnkgU94wDq44sidD5rtYgYGuob4BJkDuLXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3hAoxzd; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3hAoxzd"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-558f7fda97eso784768e87.2
        for <loongarch@lists.linux.dev>; Thu, 17 Jul 2025 07:28:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752762497; x=1753367297; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axtwyv1QW9Jl3sEVwduJUxW6lENRlEEn6jAlKX1Xswk=;
        b=D3hAoxzdVNBdy8+oRrva/TA/LxdsoRNlUeEgnRW2J7BnxWEWTQukN9oFHR0bn7FUDa
         pLk6/112/Y5VgEq87fhF+LNcW4lG/LFiSBoJZfY+6qQjbRYyZLEHC8mg7bf1hnjKmC8u
         105OBxsnjx3qR7ncfNhFBiHXLhtSwg01+RtTCMFltda5gxrsFcjatqw0M1ZUKFIJ3/0V
         k+suObnX/x9LiPhvG8Pb8XZOb96geX2WWJy70Py5GiiGXV5JKhivRUEFSBCAHBmWP34B
         RzyRxP7vnnzlrktvwu3OdUmTM4TlP/UPYZfHf68HDMENmZoDgp7TDcsskXoCosObJsch
         Ryeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752762497; x=1753367297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axtwyv1QW9Jl3sEVwduJUxW6lENRlEEn6jAlKX1Xswk=;
        b=s8lbZNR+oVhE6eQgXWVQZUb4pnybelhyvkWQ5FaWS3oTGmuxKly/72MnTXbbuS3qgO
         /JtB3IRVj057NcIvjQhevEBNLDyi5sqhZBuBjQ/mJFzGHa9SM5SyYfLehr9obw9/C5Fo
         Pv/fCZ0N5J/fnTh9ufyNfYqj7WMCNfILPWXYKGvtOKFG3qvAUYZTp7SLWx9PoYqe5+UA
         SYKEVVA2GMFGq+lhPonns/p9UxssOXj8iOf7gFk4ZTt8bxrQaTFi4YEzefC0B8Lt63L3
         OdSiueHNTizTvLAUF5FooOsit8/cQ5+VFdHm3LIr6ZPjEg3M/johO0JEhf4rEIuL73g3
         ldiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqy32fnORkmXbJTo13jZEPoxTNxioc2nyRgAnPiJNttDB+L/MTkbhPaD8oeDbdq6FbjZg/07qLdfc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzl9D38DfPwhM4AYzb1mukEB+63HETkoOndh2L8GxeWfuRd+N2l
	Gxjc86t7VihhokS8WNFWhhfVrPjthxj4NX32RtArTBBnhR4BlS39I2zJ
X-Gm-Gg: ASbGncsXqrOk4ft1Y8tONhjQWT6pCAYRiNP7WczNA7oWd/qwIznPMdqY+38NFqVY/5t
	tz05m7m6SHaNjMcVpK1HULVQRAGohZB4kBdb5mmsclmjkNrrojzOhpkeYWLthsJK0Af6ilz7DU1
	8I7/UBkWffacM63Rvj4W8l5N1RVQI+LuhDU8j9BsbXLOb7MmKu+s1AUezHlvG9YwM2iq5x8uDJ0
	YNvhEYy+mGRW5Sk5j/TpTt7nJ4MX7OgsAspVivvcK9TM5dqzJb1Ktfs3PDc2efTdymm0RwyT6st
	+1tIP+4CpXpKuINqEJaVv4cD293w90OAmeridTmy3+czqH4eswBLkoIPHrNG8G7ivj9eJnZhRLc
	+zyieO5AoikP7RDgCpzb/p8HRTNxFKCJf74zaaKVZIMyly8/45hqTRRDBvppC1ekdSjbH
X-Google-Smtp-Source: AGHT+IEO/8eHWJm582VzmdIOAIhCMVFXDa+uycN9FWVanpBus9xWQw/+gRsCzypPbNm9nuGJ8ZjzCw==
X-Received: by 2002:a05:6512:33ca:b0:553:37e7:867c with SMTP id 2adb3069b0e04-55a23fb26f9mr2259542e87.50.1752762496407;
        Thu, 17 Jul 2025 07:28:16 -0700 (PDT)
Received: from localhost.localdomain (178.90.89.143.dynamic.telecom.kz. [178.90.89.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55989825fe3sm3022975e87.223.2025.07.17.07.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 07:28:15 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: hca@linux.ibm.com,
	christophe.leroy@csgroup.eu,
	andreyknvl@gmail.com,
	agordeev@linux.ibm.com,
	akpm@linux-foundation.org
Cc: ryabinin.a.a@gmail.com,
	glider@google.com,
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
Subject: [PATCH v3 11/12] kasan/riscv: call kasan_init_generic in kasan_init
Date: Thu, 17 Jul 2025 19:27:31 +0500
Message-Id: <20250717142732.292822-12-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250717142732.292822-1-snovitoll@gmail.com>
References: <20250717142732.292822-1-snovitoll@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Call kasan_init_generic() which handles Generic KASAN initialization
and prints the banner. Since riscv doesn't select ARCH_DEFER_KASAN,
kasan_enable() will be a no-op, and kasan_enabled() will return
IS_ENABLED(CONFIG_KASAN) for optimal compile-time behavior.

Closes: https://bugzilla.kernel.org/show_bug.cgi?id=217049
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 arch/riscv/mm/kasan_init.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
index 41c635d6aca..ba2709b1eec 100644
--- a/arch/riscv/mm/kasan_init.c
+++ b/arch/riscv/mm/kasan_init.c
@@ -530,6 +530,7 @@ void __init kasan_init(void)
 
 	memset(kasan_early_shadow_page, KASAN_SHADOW_INIT, PAGE_SIZE);
 	init_task.kasan_depth = 0;
+	kasan_init_generic();
 
 	csr_write(CSR_SATP, PFN_DOWN(__pa(swapper_pg_dir)) | satp_mode);
 	local_flush_tlb_all();
-- 
2.34.1

