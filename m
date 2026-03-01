Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCDD3033DC;
	Sun,  1 Mar 2026 01:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772330097; cv=none; b=dCQa7D+9moLRZ3il3oITOQGubgcqqiYrAppiZEkpKD4AVPPYJ8RT2jyOptd5AQkJG/jPba636q9gmqD9hFjYwnIgO4uFrv4ZyDsZjTtS8LA7n4vFXJqPzxbbCCNm04WahrDPurwOBVtBOCP/8DOlzQYxdz1FZQ3DVYZBEvoGUNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772330097; c=relaxed/simple;
	bh=/kNj5AFm4Wz1PMsNId9aGGTHTDpeBdr/m0uL7oqbM9M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=daek4lk46+DO7DUHwVKeyVepHKQblcMfFc9RJe6igqfgdRVOQTnD3fKCC2cC5C7lRTvb6Wv4IyzQrTfq/Ni150NCeJJ+UnhGkx2tPVqGGEOhXXVedwuwoBkntlsgspzD1J7eP9W/Q8p3vLS8XytVKT3wFJi9KRyNgKrIhaRFwNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lmjPDvhU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lmjPDvhU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D4CBC19421;
	Sun,  1 Mar 2026 01:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772330097;
	bh=/kNj5AFm4Wz1PMsNId9aGGTHTDpeBdr/m0uL7oqbM9M=;
	h=From:To:Cc:Subject:Date:From;
	b=lmjPDvhUBWkPVMcHN0pCNJlsrRSV2VBVCjGKFr3zdbZbCrIKGBR5nu4+3+CQHhB3b
	 WLF1CJ47OFIqIx5PSONH6rQPrGVfe1yYfAGtNLDeBZZWxfHiVG/r42nQpCh4V8+Uth
	 MgKP7RwMwpwiaMXgEDh4i3us17NyVl5TcNA1NtF/yZgJZ9O8K8wgaHIfU2nwjfONK+
	 F8dgEhvF19O4lYjIAoJwXd+ckhAyLPYRdCOLt/ePCBlS9dEuZMhPLrzrPf7GSayrwt
	 O+8IG0mNhEOqMvO00Ad7oG0Axl7C58DNli4PMuXJXYqhoJ+sZuCH340wY+xLvhTksy
	 LHhJBICIuamxA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	john.g.garry@oracle.com
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE" failed to apply to 5.15-stable tree
Date: Sat, 28 Feb 2026 20:54:55 -0500
Message-ID: <20260301015455.1722010-1-sashal@kernel.org>
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

The patch below does not apply to the 5.15-stable tree.
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




