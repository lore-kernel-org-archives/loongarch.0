Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278E612B63
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745201025; cv=none; b=FfhbkxX7kNqq6tGvEczBFo2viC74xvMDPKM1iwloYVo3zZffSKjTp+U1PkgLFcmvItyt77XOTbLTOBRpUhDOrL3D03quc8k+LBdA9TJkz3Ud0yaSQEVk0VUNX+kYu/jrzpZiOflUnYNaRjikfOyDYS86w/98NfVy98jDqCPP1R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745201025; c=relaxed/simple;
	bh=on76/x+sXEAiTqkxPI/vmS8daeV7MSICxbjbokf8i5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=phjmkgKcnjA0hQN0F6DPljiyplU0IWrUN8RHdoJD6t5wnibUVOUShQ6XuAW/CXVg2AkZ+phSelalwSba7j+cWLm7frG/2kT8olG71PORvqhpgA9A60HbCt7TprPVMBT6m1jNYIHHUlfyCYc7J0YKARqAfq0+5rtjwrX5WDEM44c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BySrHcF8; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BySrHcF8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745201021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLoQDki9ePJ+eoER8hA2nAD7Jzdu+a0wcnKJWj1DpJk=;
	b=BySrHcF87PlQAyDDcTkDbbUal4RpXll/ZUJxZcz6kgZQdQaEHFjr8Uqij6MHwYb/JkazIH
	DKG0dWJy2Jyc1dDm3eVeQ/OxSd3RKyBwgJbZaPDwEBp/t4s2cHfNEKNT1LaioI8peQ1DnQ
	088WMNPJp09w0HWm2Pv1YV4Ay57+hYM=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH 3/3] LoongArch: Add some annotations in archhelp
Date: Mon, 21 Apr 2025 10:03:01 +0800
Message-Id: <20250421020301.34185-3-youling.tang@linux.dev>
In-Reply-To: <20250421020301.34185-1-youling.tang@linux.dev>
References: <20250421020301.34185-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

- Add annotations to the kernel image.
- Modify the annotations of insatll.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/Makefile | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 64bdb52ddf7c..5711fe0efa76 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -184,6 +184,11 @@ install:
 	$(call cmd,install)
 
 define archhelp
-	echo '  install              - install kernel into $(INSTALL_PATH)'
+	echo '  vmlinux.elf          - Uncompressed ELF kernel image (arch/loongarch/boot/vmlinux.elf)'
+	echo '  vmlinux.efi          - Uncompressed EFI kernel image (arch/loongarch/boot/vmlinux.efi)'
+	echo '  vmlinuz.efi          - Compressed EFI kernel image (arch/loongarch/boot/vmlinuz.efi)'
+	echo '                         Default when CONFIG_EFI_ZBOOT=y'
+	echo '  install              - Install kernel using (your) ~/bin/$(INSTALLKERNEL) or (distribution)'
+	echo '                         /sbin/$(INSTALLKERNEL) or install.sh to $$(INSTALL_PATH)'
 	echo
 endef
-- 
2.38.1

