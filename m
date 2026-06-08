Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210573DC84C
	for <loongarch@lists.linux.dev>; Mon,  8 Jun 2026 10:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913458; cv=none; b=iAwBkhnlCwK6Ag4eWAaFOpwhmrsDp2y4VitY8utZqNv2c3whqtCzWBYT1EFIAYRhGnKchwsx+AaJ/95MM3EkkMFvGYjWJgw5C6GBiDBtrOBE1ghqQqh9g/y6bM9Gp3f3/xpnttqPF4Ojs+Xi4K9XowLkaElZ7Hvzz3alJpl+LP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913458; c=relaxed/simple;
	bh=CEIAnlvL0rhnO6ZzKUdVEs7J/+earQCHbO4otn4jgzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PFIVVUC3ohGW/uaxOkGcXjbyKkJTnP3ofsA2w+NTLDONUet5l73UISnRZhgXsttKu9xrDA2iVvAyjb8nhV3cw5ZrLLBT+izWvZ7HlNbWbvaVLH4eARxiHf6yqy2BWNK6Rrs3/ix3DTvdoSjzBmm43Rg8366o4Udj7tuqaKcmcrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wp67nmAJ; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wp67nmAJ"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780913455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZal1eUFT5zCvAjnUL3zj5MffVR6wFyaxSxRBYF+dwo=;
	b=wp67nmAJvoz9ZELHSbtQ/N7k/vv0WLd0Xmv9Q1jdvh5F0WpkS4ez33VSnQ24bfFUd8v8Ld
	O3ENLWOItNj2NtztjR/CQ4afXALLCN97s7m/XNlS1EGG2/PicbhPdjdw6yIHFmQYh4bobr
	JZ+r01rcbPdnI2Q3dYmWDcDLXa3TmYo=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org,
	jpoimboe@kernel.org,
	peterz@infradead.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com
Cc: kernel@xen0n.name,
	joe.lawrence@redhat.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	yangtiezhu@loongson.cn,
	jiaxun.yang@flygoat.com,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	xry111@xry111.site,
	wangyuli@aosc.io,
	loongarch@lists.linux.dev,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] LoongArch: Add livepatch build (KLP) support
Date: Mon,  8 Jun 2026 18:08:52 +0800
Message-Id: <20260608100852.325413-9-dongtai.guo@linux.dev>
In-Reply-To: <20260608100852.325413-1-dongtai.guo@linux.dev>
References: <20260608100852.325413-1-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: George Guo <guodongtai@kylinos.cn>

This allows automated livepatch module generation using objtool.

Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
Signed-off-by: George Guo <guodongtai@kylinos.cn>
---
 arch/loongarch/Kconfig | 1 +
 tools/objtool/Makefile | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 3b042dbb2c41..1dbf51ba9d6a 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -159,6 +159,7 @@ config LOONGARCH
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_EXIT_ON_IRQ_STACK
 	select HAVE_IRQ_TIME_ACCOUNTING
+	select HAVE_KLP_BUILD
 	select HAVE_KPROBES
 	select HAVE_KPROBES_ON_FTRACE
 	select HAVE_KRETPROBES
diff --git a/tools/objtool/Makefile b/tools/objtool/Makefile
index 94aabeee9736..83d645675ed9 100644
--- a/tools/objtool/Makefile
+++ b/tools/objtool/Makefile
@@ -8,7 +8,8 @@ ifeq ($(SRCARCH),x86)
 endif
 
 ifeq ($(SRCARCH),loongarch)
-	BUILD_ORC	   := y
+	BUILD_ORC    := y
+	ARCH_HAS_KLP := y
 endif
 
 ifeq ($(SRCARCH),arm64)
-- 
2.25.1

