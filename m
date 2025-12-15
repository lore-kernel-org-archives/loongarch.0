Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722F23D2AB
	for <loongarch@lists.linux.dev>; Mon, 15 Dec 2025 03:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765769804; cv=none; b=Z/gcMkGSEDLpnXn+D/6+Yylh+Y+AJEdqAF7ir1khbw8Z+vbz6uC7OkozrL1qZ9sOY4ZwICwe3ULZ/cYRK4ZT1OvWTdiGvTz7uiCRw5836jKdaQoKDpiGJEQ2yamsWlHjHz8tr8hVgMnRxmbCq+2iBxrwi9os3C8octpN9UU3oo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765769804; c=relaxed/simple;
	bh=4rbaI/WygUcZnQbVdTD185zvLjB232LXjmpdEWznem0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LJxYdaVA26oqoQNn5+IDy0FOFnJpyyiyUUVHbKSluCwSTSz4j8YbtnEur1jeyLNCP8b9wFHimlFt6n/LnfCa569brGTEJJTPcKr6uucllQjACThuGEvAQM+yy2Aj0+F8XUnNXp4Kj2bbhGUNLYEYzbdkDLUN0qAQTU2v1hdtTVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=LJIdwbAg; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="LJIdwbAg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1765769796;
	bh=nGLE8uK3PMZZv+yu5MXweRNj4FmhY68AJ/VNDWuaJY8=;
	h=From:To:Cc:Subject:Date:From;
	b=LJIdwbAgitsNxFOQPvOXjv8J2cSjqDa9u94dHEPc6ZVb44mmocJlkm79dutEg30CG
	 vcVITn3OVOBYsp5OdRM1QVClohOTi+DGdlIm2UYUpMRFNnG7ZwMmeVhJLQb+Wjhhvf
	 qZ9znRCgaWtVI3UMDGW9VyLF6ddAPqKvfg5Ev/Tc=
Received: from stargazer (unknown [IPv6:2409:8a4c:e19:b211::256])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 28211671F1;
	Sun, 14 Dec 2025 22:36:33 -0500 (EST)
From: Xi Ruoyao <xry111@xry111.site>
To: Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Mingcong Bai <jeffbai@aosc.io>,
	loongarch@lists.linux.dev,
	Xi Ruoyao <xry111@xry111.site>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] LoongArch: Don't define __ARCH_WANT_NEW_STAT for LA32
Date: Mon, 15 Dec 2025 11:34:42 +0800
Message-ID: <20251215033443.196159-2-xry111@xry111.site>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While on LA64 we had added __ARCH_WANT_NEW_STAT back for technological
aesthetics reason, on LA32 the newstat family suffers Y2038 issue and it
should not be used at all, as the commit 82b355d161c9 ("y2038: Remove
newstat family from default syscall set") has already pointed out.

Fixes: 14338e631afd ("LoongArch: Adjust system call for 32BIT/64BIT")
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/loongarch/include/asm/unistd.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/loongarch/include/asm/unistd.h b/arch/loongarch/include/asm/unistd.h
index e2c0f3d86c7b..4a7e4a6b6627 100644
--- a/arch/loongarch/include/asm/unistd.h
+++ b/arch/loongarch/include/asm/unistd.h
@@ -8,7 +8,10 @@
 
 #include <uapi/asm/unistd.h>
 
+#if defined(__LP64__) && !defined(__SYSCALL_COMPAT)
 #define __ARCH_WANT_NEW_STAT
+#endif
+
 #define __ARCH_WANT_SYS_CLONE
 
 #define NR_syscalls (__NR_syscalls)
-- 
2.52.0

