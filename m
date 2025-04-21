Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16401257AF1
	for <loongarch@lists.linux.dev>; Mon, 21 Apr 2025 05:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745214531; cv=none; b=FrjJ9zx+t+ffR/fH8I/wabn8zy2pZMg8EP4ZKvevcUmqV3OmS2l8e6CHzf/rvp50X5H64CTF0kSFQQIgk2wCZDEi7SMY3upnrFcGwRecGYeiIM+lo2ucFL2jVdu428Bba8rOapBs5Dp7MInjvh7fD+s1W+QSVNZDpMQs3TKIE7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745214531; c=relaxed/simple;
	bh=HTKtEFujXdWxwmOHB66Uck35dTxZ/n2lbnV3PodrQeM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DsLVvDM11bUyP9qszcla8APSjrL8Nu2HOUymUos+Xt8YUTzjLVVEyd73e3gsLsBQBQGvpXLM3LhgMr6j5r++CPHT965SGgulXTvN09N0FUiyNREZCc9UM8Tvx2B/7jkNJtCwXiDB3aEmX6rNrehd+/r14kWZ+DXYTwbCJVi0Tjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Pwnh4tMX; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Pwnh4tMX"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745214526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=23KSoHXN6CmttMFYMnbpbOo4nfH4OgEcFEIby3GMa4M=;
	b=Pwnh4tMXe9udB7Y9lDtWS10PGowjnCJfjcdP89Q0wP72qrHAIw9Cd/NXLXhXfTOREYEtPx
	gATvgQ3FeD0istweck9Xj6Fjs9J7bE+lCsJV5bR/DXMfaH5FrA/JSrJr7IHTZ3ewueUVyb
	7Po8wrwsTyfmvyKT73fYQ6/N7SKEwZg=
From: Youling Tang <youling.tang@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: loongarch@lists.linux.dev,
	youling.tang@linux.dev,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH v2 2/3] LoongArch: Using a generic scripts/install.sh in `make install`
Date: Mon, 21 Apr 2025 13:47:43 +0800
Message-Id: <20250421054744.46791-3-youling.tang@linux.dev>
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

