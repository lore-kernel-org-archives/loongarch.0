Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 427DF3C466
	for <loongarch@lists.linux.dev>; Mon, 19 Feb 2024 15:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708357209; cv=none; b=G8Qcfl/pp4c4oWmfJqEjULbW7sdAiYCMDgiQBlAGdCp8pID/wpI4WrDvt7qaDM63K/ZFHJZvC/ZSd0wGWFv+l5j0hDfGiFpBNO+XlvcaBXUaxoTRHXZ2QoTpm1piR8QDHoVLh8o2McvK70ZCNwdpXP4Oz2i1b7ziia4n6HFWelA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708357209; c=relaxed/simple;
	bh=2fbQDpTO4Tey39i4Yfg4XMK0iSzMhLQFeet5tLx71IY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u+2407pMQGmdenPYUE1scXgG1wZIR21k7JdmK3xgSiZcPm0ria5+NBlYTfR2ViZz0kA1M7PHvprDsZ8iv/+zU+cjtOYWuC5cABNk/Nc3XY6tf+u6LxISLw0dOs3P+DciKzJ6g2CEGb+bPXBghYHWP/reOr1tbMpzZPHkK6F28gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gyzqlXGu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=98MXiKOK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gyzqlXGu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="98MXiKOK"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708357206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lp+RzcryxMV8zaG1CzKINGmkFkhMVE/l8rdV67gjFt0=;
	b=gyzqlXGuzWp4QMqcPJo5aZYgAIRs0qFNLdXXEiXhtJi65M/ccdsGa8e0KaHDcDA1K2WZIp
	mCUtwyavQxP9ujmzKPuqrsiOJArtP+nA/jresToDIXNc6w5o2Uf8JJuxH+SYemvwp5Ot8O
	OyF7jnQm3LpTgWFv+DUJhmHEg9y0VH3fJXIfT5OYQz36rEXKCw0cUTW4Z+1c6HnBpj5zfK
	6cJgYkqosyTi71L2vSZfrIx/fv51LSXR4H4zdtQLPsIepESzAVkr3e24dl5P5vj8ojFk2Z
	okDzTCfyt8fqBfnlHG+sXtqHgBHruzCX5JCrIC7FYpoJ2xiijxtQExx4OO1J1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708357206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lp+RzcryxMV8zaG1CzKINGmkFkhMVE/l8rdV67gjFt0=;
	b=98MXiKOKw1HG+Rcg0+36jc63lJvDkwgBP/Aoa8RFjRKVULn80umgrTa8zsCcVLTWf8rvyt
	Gp/WTg07f+n/0ECw==
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	loongarch@lists.linux.dev
Subject: [PATCH 08/10] loongarch/vdso: Use generic union vdso_data_store
Date: Mon, 19 Feb 2024 16:39:37 +0100
Message-Id: <20240219153939.75719-9-anna-maria@linutronix.de>
In-Reply-To: <20240219153939.75719-1-anna-maria@linutronix.de>
References: <20240219153939.75719-1-anna-maria@linutronix.de>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is already a generic union definition for vdso_data_store in vdso
datapage header.

Use this definition to prevent code duplication.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev
---
 arch/loongarch/kernel/vdso.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/loongarch/kernel/vdso.c b/arch/loongarch/kernel/vdso.c
index 14941e4be66d..90dfccb41c14 100644
--- a/arch/loongarch/kernel/vdso.c
+++ b/arch/loongarch/kernel/vdso.c
@@ -21,15 +21,13 @@
 #include <asm/vdso.h>
 #include <vdso/helpers.h>
 #include <vdso/vsyscall.h>
+#include <vdso/datapage.h>
 #include <generated/vdso-offsets.h>
 
 extern char vdso_start[], vdso_end[];
 
 /* Kernel-provided data used by the VDSO. */
-static union {
-	u8 page[PAGE_SIZE];
-	struct vdso_data data[CS_BASES];
-} generic_vdso_data __page_aligned_data;
+static union vdso_data_store generic_vdso_data __page_aligned_data;
 
 static union {
 	u8 page[LOONGARCH_VDSO_DATA_SIZE];
-- 
2.39.2

