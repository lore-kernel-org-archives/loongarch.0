Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260622F8E9C
	for <loongarch@lists.linux.dev>; Fri, 24 Jul 2026 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893451; cv=none; b=jouqS+r+5ZyGQKkVsxSQHNZ9WJoL42USRUkAHA91bzmnWArM5g62PVm5Uh/e1XVGrdkbvqur66JtSoBXrvvmkWWC/JlCVWV6GzSOV2/gomQiVbQhvEhG6pbB8g/NOADwk9KjRHDj6tnvuNR9WR25E0m4qHMnoGON0fAM/aqCcKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893451; c=relaxed/simple;
	bh=GtT94Ry+uUJBjxiUnKxrkDDhoiOOj9v515CL6k/baIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oRxEKBXSHefqg3vYaNkRSi3/Kb2aPc0UigQOUmQtHxcRhjI2ZLZWegM/8xjNdyE67HWyZW/D3kX9+JbZZQcJQQit2Xz44T2fjCzRhG73mNwq3I0zU4kzTM7cFm3QERNomPqd9f8six6uVaC2/sTsebjILtmvZhgGDQBYSntKkQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=eThdGdhl; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="eThdGdhl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784893436;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nT4tadmZ1lw5h3g23O3yyAlZUdiECqqGkhthTyxcnTI=;
	b=eThdGdhlIpYmh+EG7kdm8aiZNy/xv+/gm8U0VAJLzR5FlTeRBDaHq9wz6S7vauxKOizzyH
	v10/TgtCOktYNO7SeXr1s0NdLGCpATXtpfZu1WRbadxU6v5L2RyqWkapCj2XELB/Sw/f5Q
	mNWZHx6xZqfdoWjFam4q9q0LffPm6yA=
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
	wangrui@loongson.cn,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	xry111@xry111.site,
	wangyuli@aosc.io,
	loongarch@lists.linux.dev,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	WangYuli <wangyl5933@chinaunicom.cn>
Subject: [PATCH v4 07/14] LoongArch: Add livepatch build (KLP) support
Date: Fri, 24 Jul 2026 19:41:20 +0800
Message-ID: <20260724114128.31451-8-dongtai.guo@linux.dev>
In-Reply-To: <20260724114128.31451-1-dongtai.guo@linux.dev>
References: <20260724114128.31451-1-dongtai.guo@linux.dev>
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

Co-developed-by: WangYuli <wangyl5933@chinaunicom.cn>
Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
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
2.53.0

