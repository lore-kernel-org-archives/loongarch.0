Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754D01DF271;
	Sun,  1 Mar 2026 01:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329597; cv=none; b=axkeGt89fRc/C3UYzEblFMvP6T/1qwzMmzVX5Ht4suvGq2sa48Cz+FjAYDKVa4H1gp/9nquwLDeD+JXummTjEb8U8dDNZojaiz2/+D78nQdA+bnJl2Tao2V95MQFeTnfcmhD7Z7LlOOt3VnfTri/zK83xyzMA4UX7OxbkvuA6yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329597; c=relaxed/simple;
	bh=cOGi4dWuC3p6O8QJ5tq3AyMsebbHpTOnen6Vm7Rtjvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dfa8Fsb8nWIlm+Z9Ghs0uaxISQe9YoEI+THCiy9yuXbBifCt+5X2b0nqlR2+5ik3Ym3+PyEkZGX0fHiP8NWVeEbHwKS4FhHhlOG2o7zy3dhRg6H6CX3GICRUV8slNevBPJz79A3ISog3Ic+cln2bvdmQYEyGhSXYlwfTUKBtmx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=toD6ZZRN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="toD6ZZRN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC3E5C19424;
	Sun,  1 Mar 2026 01:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329597;
	bh=cOGi4dWuC3p6O8QJ5tq3AyMsebbHpTOnen6Vm7Rtjvc=;
	h=From:To:Cc:Subject:Date:From;
	b=toD6ZZRNdF4C+4oxtZHtgxq1cpCS7c6Vz+eJ1dhMbi8MfLnqnVckV3WzJTg1yD9Oy
	 CDgMqWr7jyBelJYrhxe8KaojCQkB/0n4VX0ma+8pRVn8qsMJJh8fVTdgPpYK7PpuBL
	 NP6JS0KlgVdRHEUF6eiK9IHGRwx58n6R4nLmJUog+P+8PnDS098PmfV/NTWB+3eKRi
	 +GbBJHwyKBhU/GnN67sSZMRdaXe2PruZOZjgXBjW0qU+zL2DzZQNA4tgtf1X2pWHLX
	 v1TGqDWsrvP5g+fe3Fdv9QhKSYpTndRxUzWVnZOHviKT+namdfdgj7UCE7CjeAhTKr
	 0EABDJeqQepVg==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	john.g.garry@oracle.com
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE" failed to apply to 6.1-stable tree
Date: Sat, 28 Feb 2026 20:46:35 -0500
Message-ID: <20260301014635.1709598-1-sashal@kernel.org>
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

The patch below does not apply to the 6.1-stable tree.
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




