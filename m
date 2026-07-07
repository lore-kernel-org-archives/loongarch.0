Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0342414A11
	for <loongarch@lists.linux.dev>; Tue,  7 Jul 2026 07:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783408992; cv=none; b=LcvsniXY/sHQBjEnHcovciFFAO096oeRIoBlvJ/Z/PMFF1k3saZeJ30Xt4LJ0q9+kbTo7cY8rWHe8Y1aE/bhxFiej10cKZdIU+baipMTnTAIVEJoDXH2pIAW4ViAbtAPI5oJF1XEmtFumEMC+va/On3D58FFp89GY+ZPj2egzvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783408992; c=relaxed/simple;
	bh=CEIAnlvL0rhnO6ZzKUdVEs7J/+earQCHbO4otn4jgzY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MSKxjfpg3LKwEtfAY0Atn+0mSwU+uhzrCdZY1tMS7YZZiP5yrtAFnjzaO/dYqo1HYV7JdxRRlPdb33H2uflUA4aFSclD1Kg6GZgvZ+uqE1QCMH/OT/lwsNLawtZ1Xs3vUJ0cnOvTlZO0pBhT1+tpXosXkr5V8SjMean4MqzTyfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=LHUIJ8/A; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="LHUIJ8/A"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783408980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZal1eUFT5zCvAjnUL3zj5MffVR6wFyaxSxRBYF+dwo=;
	b=LHUIJ8/Al7b5qM5Trz9ljpyGxHPfiqbFUiCiaeABuQ3JOjCb1KBSvT9tWx67pp+qVHig2t
	A6vH8R97zNnHLUDjQhP7zacsbNvqgsZ4chTlZ7zNoM5y0rsZ9IUQScB7IO4XHLjY8fPXan
	hecPxUdaPOUHEM9EJuiymdkjvQX2QlY=
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
Subject: [PATCH v3 08/12] LoongArch: Add livepatch build (KLP) support
Date: Tue,  7 Jul 2026 15:20:27 +0800
Message-Id: <20260707072031.231066-9-dongtai.guo@linux.dev>
In-Reply-To: <20260707072031.231066-1-dongtai.guo@linux.dev>
References: <20260707072031.231066-1-dongtai.guo@linux.dev>
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

