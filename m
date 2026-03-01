Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF95284662;
	Sun,  1 Mar 2026 01:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772328453; cv=none; b=aEPPSLCIKb12eUOC6Lfckeu270vZfJ/mBjF22wddS1hmukqcsFXLpbTKcK4Wuq4eEqz6UKYFjxKvzVeOZzK0E++d2k3/rm85/POyrn1ilq9tvFVU0KzvMrBgZ6yiCRidLLf8i6WcT3hwGcbuxGr/NuTIXRZHwRsAK6VJ/MHRWGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772328453; c=relaxed/simple;
	bh=r3Jgvb8jz+L5WMeG5DTHuI16r8QaIgcV+xF6YXhFXWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mNlNV0ZXN73dr4n+0yOCBfktiLfb7nLwWBJgvx5DAixlMsDI4ojdZLzSDU1PjMERFyPPPlQeMNwY9E5+CP4f97hDy+nMc/9e75yLe/T1k8vJYT6PJN4npWD2v8/1XFbwXSOhy/0RsGOUFj1nMS2NSTVvk/ps4qh72e7OSfGveW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HJ98Y3kx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HJ98Y3kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B38C2BC86;
	Sun,  1 Mar 2026 01:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772328452;
	bh=r3Jgvb8jz+L5WMeG5DTHuI16r8QaIgcV+xF6YXhFXWI=;
	h=From:To:Cc:Subject:Date:From;
	b=HJ98Y3kxjdgv0E2F4TaxfQR5/IZGYUEVBOpxPxX5ze+tyZkCn/JFoFkd+KCVq0Q/5
	 IiLHsSWVMBwjYPmEkTTfwzWEfpeKUP/h3dF7Wb0BbXipfM66PKMmdnHnX9cdywaAso
	 l2UT1GtosltaJ0m3sETCjUJp0z/y9Je+53aNuEJrQiRKJsNVKy8oWKYwcpRnZumrF/
	 sC411Ukflrr+oygT4j7PHw9ICaNqcCAwhMVo4kA2lo2SbgMGvB68hZ2/UXcI5p7XCu
	 QOwNIAcbfroI2qceAku0tFRVPmDPJMZSM2501tnWoLeO88c5ZL7Yi4OEzFCubGHRrk
	 P4pIMc+zF9+fQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	john.g.garry@oracle.com
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE" failed to apply to 6.12-stable tree
Date: Sat, 28 Feb 2026 20:27:30 -0500
Message-ID: <20260301012730.1685022-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
Content-Transfer-Encoding: 8bit

The patch below does not apply to the 6.12-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 94b0c831eda778ae9e4f2164a8b3de485d8977bb Mon Sep 17 00:00:00 2001
From: John Garry <john.g.garry@oracle.com>
Date: Tue, 10 Feb 2026 19:31:12 +0800
Subject: [PATCH] LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE

The arch definition of cpumask_of_node() cannot handle NUMA_NO_NODE -
which is a valid index - so add a check for this.

Cc: stable@vger.kernel.org
Signed-off-by: John Garry <john.g.garry@oracle.com>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/loongarch/include/asm/topology.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/loongarch/include/asm/topology.h b/arch/loongarch/include/asm/topology.h
index f06e7ff25bb7c..6b79d6183085a 100644
--- a/arch/loongarch/include/asm/topology.h
+++ b/arch/loongarch/include/asm/topology.h
@@ -12,7 +12,7 @@
 
 extern cpumask_t cpus_on_node[];
 
-#define cpumask_of_node(node)  (&cpus_on_node[node])
+#define cpumask_of_node(node)  ((node) == NUMA_NO_NODE ? cpu_all_mask : &cpus_on_node[node])
 
 struct pci_bus;
 extern int pcibus_to_node(struct pci_bus *);
-- 
2.51.0




