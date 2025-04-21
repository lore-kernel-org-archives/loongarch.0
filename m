Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D01A2571CE
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 05:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214532; cv=none; b=rNtuS2TKmPqGR4a+WaXRaVLFZV/gcoT0GUgh+IG0tSEo5aKAnzk5J9kNytLO3aEQxGH98/KyiWtpbGokZQKa9aa8K/HNQl+4cEl55hOKzZ/bNmXSRSEMwKH5/ZnzFzWmxO9uLpzGy9zJf8sV02RCDMHa/hLO5L/vbdg96ElAVVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214532; c=relaxed/simple;
	bh=on76/x+sXEAiTqkxPI/vmS8daeV7MSICxbjbokf8i5E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MXvYtRkgjI/fZC93C9XK5Tmb85zhQ0tx3hSBt0brAkieQ5cmGlOFLGz5DDlvllVSDOA6A/cQ5K07A74mLwdnG9Rmh1k5FFYCfwa8wb+8jJhdCqfPEGueQQAnPAz6PbvFvaQpFKBLdosxedBnnYn58DOq1hI2R437ARup7grlgm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BOEm0JTs; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BOEm0JTs"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745214528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JLoQDki9ePJ+eoER8hA2nAD7Jzdu+a0wcnKJWj1DpJk=;
	b=BOEm0JTsw187lDaJF5wC9XFVtGD1CEV6Ef6c1DHLyyPkT/ZBM336PwytaSHk/Q+SLqaKPv
	xNFE2tgXPkq+BccZednaMLJPypSURe+xBFs2MOs33CzfvYuvSmXh3s7WTMai5kGnSrWHx/
	+EiRG7dQzNxB4ZPLpy7G+vTD/imVSBc=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v2 3/3] LoongArch: Add some annotations in archhelp
Date: Mon, 21 Apr 2025 13:47:44 +0800
Message-Id: <20250421054744.46791-4-youling.tang@linux.dev>
In-Reply-To: <20250421054744.46791-1-youling.tang@linux.dev>
References: <20250421054744.46791-1-youling.tang@linux.dev>
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

