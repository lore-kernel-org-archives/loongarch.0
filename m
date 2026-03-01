Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F8E2D9798;
	Sun,  1 Mar 2026 01:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772329078; cv=none; b=Urf0n2HpHWVOsbnxC4OeOXUzZEWiH2BFFOvhGVGVZKRxeyaAyYEUbskpuzT4xksksbrJzA7O3kKvNIfHzjgE2i5jSKMjT1ai+1J+grNCm8oMiSJRpBnygXabXqqIdDAEzw2cvYVyhvQuBYL5zQNWkwrp2kt3i/Hp78fKp1odBXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772329078; c=relaxed/simple;
	bh=HRLW37JqMa5SuXmKPlNEmPRMGd6lnQD5OgGPDfsdnhA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ajnk6BP1DSprHz3h8Xz7rYv+JfM0ELN2bY6ZV+f4hNDZpLci9XFEjLIFE0K/fNlu0IEzdy1QucGdyGttzHRLcoqGWtYhONWFegERXKCz5oGNrtS1lA54kvzZpz4PD8EjZYAPEYs6M04QScLKdlRQa3D2VytNxUFHN7ZDN0u0rq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQt9P6Tf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQt9P6Tf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4350DC19421;
	Sun,  1 Mar 2026 01:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772329078;
	bh=HRLW37JqMa5SuXmKPlNEmPRMGd6lnQD5OgGPDfsdnhA=;
	h=From:To:Cc:Subject:Date:From;
	b=HQt9P6TfreVt5C3Mk2bBIfBsKVHcj1O1gnd0C03t123hyBsyIXo69btAeptTUSk2o
	 FFbr7PysHgkhGvJq3vk83kGxTy4TS0IJP0zn0oHl4Weyria9z+XjfePoNXgIaRJzKN
	 KnEXpoDWAb3XFn/ZTUrL3k9EfLjJyqRER+rrTD8suhDSP0Yc0BUMFxIx7hHpFaSFuL
	 v8JUffUvaC9xS8FpAcp4Bsc/9oHuFhTI5E3Oz88/PtIJVp21BA1OtB0aRQxUdwRYfO
	 IUrZ8YvNpCs2LSZPFXJuDA7u9dcGFNM1e/iv9/RCoFQdY+rddleZytJwX2sUvvxvur
	 mlq3zDGB3CGcQ==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	john.g.garry@oracle.com
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	loongarch@lists.linux.dev
Subject: FAILED: Patch "LoongArch: Make cpumask_of_node() robust against NUMA_NO_NODE" failed to apply to 6.6-stable tree
Date: Sat, 28 Feb 2026 20:37:56 -0500
Message-ID: <20260301013757.1698242-1-sashal@kernel.org>
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

The patch below does not apply to the 6.6-stable tree.
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




