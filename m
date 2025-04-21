Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACC12B63
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 02:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745201022; cv=none; b=fDLqj3vIuJ/cHLZBAaDrMTFKQk11yq2zf/2ZOG1NBf/nPfAaNGqjZ6Av8+xJIP0jK9nPDYqJZfE8/LQWYzEGuwbA8EqMNJYELoxg2fPkKUxOtJc5xKXOM0FM14h66F9GnrIlSo/DlpAMMdC/L+ulhy6708k8L2NCFU+fAR9GQtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745201022; c=relaxed/simple;
	bh=HTKtEFujXdWxwmOHB66Uck35dTxZ/n2lbnV3PodrQeM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AYm4XUIrzYavsfaD4lbb0lmrRIm/6bgcYqrkCHqDKP8KbwkNr91q8XqdS4VO1UkT7nmXVIj7zjNqtLA8ONIBoPa2+HfY1KWvequNiBRckU0y3UmNKk+Oo39A4a0egp7duY+NdKVq58KyQPNEaaEDbGIVJLtCHn+GF5SDa4IgQj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=FtVIiOAn; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="FtVIiOAn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745201017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=23KSoHXN6CmttMFYMnbpbOo4nfH4OgEcFEIby3GMa4M=;
	b=FtVIiOAn+eztX05R+oIltFimhqzfM3mAW/G1dmzEM+MGHlj61u3bRNQ96RkSdspzQQiuwn
	mX9HtB+6YncI78Vfn4DfyQOXUga2y1ynbPYp1PXSMFLjtabCnWWQzY2ujLB5X8EpEm3j6U
	bzXPhISF73txhBLHoLv5oXkOtxzBdgw=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH 1/3] LoongArch/build: Using a generic scripts/install.sh in `make install`
Date: Mon, 21 Apr 2025 10:02:59 +0800
Message-Id: <20250421020301.34185-1-youling.tang@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Youling Tang <tangyouling@kylinos.cn>

Use the generic script/install.sh to perform the make install operation.
This will automatically generate the initrd file and modify grub.cfg
without manual intervention (The previous image and System.map will also
be generated), similar to other architectures.

Signed-off-by: Youling Tang <tangyouling@kylinos.cn>
---
 arch/loongarch/Makefile | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/loongarch/Makefile b/arch/loongarch/Makefile
index 0304eabbe606..64bdb52ddf7c 100644
--- a/arch/loongarch/Makefile
+++ b/arch/loongarch/Makefile
@@ -181,9 +181,7 @@ vmlinux.elf vmlinux.efi vmlinuz.efi: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(bootvars-y) $(boot)/$@
 
 install:
-	$(Q)install -D -m 755 $(KBUILD_IMAGE) $(INSTALL_PATH)/$(image-name-y)-$(KERNELRELEASE)
-	$(Q)install -D -m 644 .config $(INSTALL_PATH)/config-$(KERNELRELEASE)
-	$(Q)install -D -m 644 System.map $(INSTALL_PATH)/System.map-$(KERNELRELEASE)
+	$(call cmd,install)
 
 define archhelp
 	echo '  install              - install kernel into $(INSTALL_PATH)'
-- 
2.38.1

