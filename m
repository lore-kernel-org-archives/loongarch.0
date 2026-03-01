Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21E6262FEC;
	Sun,  1 Mar 2026 02:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330685; cv=none; b=p3QFtwRQ3bEh19/v8Dk99gviI8CecmNN2REGtCvDmfAjDkb64PGJDztboDiVNftrlD6f1HL5yXYmUs0IMMMC02/zQmZ1BkDfzgEtqmtiQPr8bnV379V/eHwZa4HVohIsydyb37WBgKw68WRR1us3MJG74KzuSBnxG81XgQB8DBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330685; c=relaxed/simple;
	bh=6TJretMyqa/fRKOrG5YFgm6pvEZovTDNrb8jMq67R8M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hWB6FWpF9hUSa50BP5DqXScNro0nuEBVNcmr6aQ94UYHRUOuktEHbsFiDFEDH9SKatnAFJuJpk3cmvcKv1V2wxhcqI0t0Sk7hZG5NMjDu7i1epGgAJjdD6uXUVO/7uh/ZH+daDxmcA6CSY+9iErILrCSXcTq0DArRooc6BltFyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ph/Si4G8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph/Si4G8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F778C19421;
	Sun,  1 Mar 2026 02:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330684;
	bh=6TJretMyqa/fRKOrG5YFgm6pvEZovTDNrb8jMq67R8M=;
	h=From:To:Cc:Subject:Date:From;
	b=ph/Si4G8iiqJ55PYpVwXhQnIIsHsSLIdzK/LJft75QIVpVLzwsJIoByetnpHbdLyU
	 gMdFfVGOKjtIsUDQsxu2485gSy1QZcTDCLQtLYzPoj657dw9kwGl31rgttQRi58X24
	 ASrQ6vtK8+3t0WB2qqHp3piGGt1PZTuH6ntP2KG27bS7RYE9xW57hASLf+Q52Opa2p
	 vR9okRmPeCi+oRbgfzPtiiXjLVkoxNujzAIgs7aEuIYUWbve6LlNgD4Qjw7wxdTotI
	 xY2gLdfobtstvrVzZzW4O9lu4BbheCgiSA3OEpSa/P0JEGicICJVetc/yOpHzsQSIU
	 UXjfNbqaFFkzA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	john.g.garry@oracle.com
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE" failed to apply to 5.10-stable tree
Date: Sat, 28 Feb 2026 21:04:42 -0500
Message-ID: <20260301020443.1733216-1-sashal@kernel.org>
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

The patch below does not apply to the 5.10-stable tree.
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




