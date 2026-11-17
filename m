Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794936577;
	b=1tNjWiCDrvPdF1MNLj1HSvc4O3/Blp10lTwftOEekoyenJz1jiWXr9xhO+hUPMfDFvoM
	 8xJJNyCjXdxVuSqzw7PtCIUydkZ2WHIYyMvX14u/b1C0abnpyMLsOl1HJojBHfXxV+vuQ
	 kru3bhPFMkaGv1RMooZmhP0HPNixNgNmC1AyFlkxN5I90BNfN2y2GF1xRXtCbgDnzdfxa
	 9pl0sGC2wWoujLPG5i9LT7b3EAS0LpZz58JbSjWl0QKIxvx2r5PNpK4uW2ZmxUFkTI4hC
	 8gN7QtJgx8Mzo6GaD3r8U5utCcDKSbowlpQn/diSHNba9a22/cYVS0520a8xqIW585g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794936577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JHWpGOTp8ITv5cctf6TSThxhxXqYa8XzuutCrYWNpkQ=;
	b=SklUyx+C5eALVBrqDLe2ChM+9JhRR0j8ciSmntS4CPxV+89Eagv9E6ObvxTAIIobaRiD
	 Ph3VZO2PiNg3yu1VPpq+9G6QAOfF+ZQxiqGMD8Zo/XnBxsTdAWLQ7ZAu+ZA5q9uTPlzgD
	 wHC5x2g5HuFsurvWePg7fV/Zp00/bcIJT02iN1o60M5KakVroA/Zgj0ZdDbUPoFZBhHtM
	 ZcrvYtJf7iDBFmRX/jYeCaaGUasTWj/45ieWwNgdRqJAs4Zn/Cs5TSll+On06R5eBut3+
	 d7o6aF28tyDh6jD2dY1D7Gv7tO45kEiZOJ2CXkN5UWEcQxYe+saDEwuuPm62oJ5i9mA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xvgnT0Tb;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07CF0606A32F
	for <loongarch@lists.linux.dev>; Tue, 17 Nov 2026 17:29:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07CF0606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xvgnT0Tb
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so211764eec.0
        for <loongarch@lists.linux.dev>; Tue, 17 Nov 2026 09:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794936576; x=1795541376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHWpGOTp8ITv5cctf6TSThxhxXqYa8XzuutCrYWNpkQ=;
        b=xvgnT0TbHZJJqGmhuAa4OAdrmvWxKPOHxO8y3J/Bue3dxdh3YW18LmSr/JWr+Ub0gj
         uzTC5ids0nPc4EGZsWJ8YvTFJyOn6wD4SSt/DDornjLRY1cMm/R95HhCe6Q18QgWABxU
         WiEzkoQiYr+hOWaEHqUtHWo9tXuAcs8/slVj3VG6eMRvVvgeZ1zSq+8wOr+LymImFffD
         tyXyluG2lR8GKQ8rWTdbcRP4R6iZS3ksT/9ZjvApo5B/uWvfT28+0vTLuvuO8vASaD4z
         tLSot0TCAtzAQymjWMXNhJ1XyJHB67iaXPPnK5JPVCCZjnhgRmo8ybstIw8ie5FUJTBO
         ku+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794936576; x=1795541376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHWpGOTp8ITv5cctf6TSThxhxXqYa8XzuutCrYWNpkQ=;
        b=y3DB4OsFefRXnkpUuUQ8kEn3hHXVwQo3K16rYTp0/PeVKGqZ5P8nEm9vC1XpZlHaD2
         98FRAuxY3q6QOUWwyd1MPs3dUgX2T/8RA5CWXybLL3tXOMpbbtc5gSOy6n+5ayFVi4Vt
         dGLbuOJjLeQAIUYO9WqeGqMcLuio0vnQJeBxFxqgsFGFixgczoITErkGO7lfknd2qpMX
         SQnIX0og60cX/eymXo1ND0UP2GHDnaQqsf+f5VP/t66JGu7hkWsZNCsKRRWQIidJDoao
         DtrLbY3ES8CTEgsItGXQ+/P5PmWkRwQOoyLB7OwReu69EMaIYWbbxk8Zg2kFMawvMpz+
         tPTQ==
X-Forwarded-Encrypted: i=1; AL+hErFmjLbWirRJnz4MtB4urUxHue3yZGsCVvH2PD/3sRxOsncIGfM6mieFB5g4bcTMbarrGejmVvIuX5w=@lists.linux.dev
X-Gm-Message-State: APuU4Z/nOer3C9GgSHv4GHn4Yqgzt1r8xxg3/QGhLLzKqSPUOKoxK/le
	cfUclpZe9MmjMYH6QRL3QPc3UHu1+1pJuFDrQCjsv9vKWuDUrNYzEE0b
X-Gm-Gg: AYBFou1F4brYChv8Fy86a8R1Ks6fqwqeMevcaOg5nGwNgyLauNutUTwNJH/qoRjsXyU
	JoDDN+uScXew3Baq5At7FrjK2X5FGv3x+vb0cy77RKLBzu4yfkWEyjgSIvvpvTJHIMuk5Smk1vr
	QBV9VQm955szifO0o0AiPYq2NmL0lCYHP6ifu9UbSd1hCE1NWlcjIFHPS2gwu+To/DahJMVtJ2G
	29QXPgxcN59IoYJ6VYiJZBFxSqvogdK0Ek7u4BvB7scITwCZo73z1H/CXOH7tMPtdPAPdY/0PdT
	DjLPg+mJdEnf+MGabkORoec5q4/+ynYBaHCg+lyVnOTyIyNCbvDudwHpvBbCMaw5l7a2Dr+6ahH
	sM2pq9SUQnirkZumrTxsxB2VIrcsC5s8lOiluq7ORZZf9sMEVUHhIMF6/4Zf9fvPsdUCESK6Qj1
	hj3/8B1WIubOuoqp5qDpwDvB3Z+OKFfsGsyNlg2Oh8CxvOMYce8B+dFuTK0kjI4XHk+9CIeHmjo
	LBUz51WFTJ9V8Vr3tOmC2Q9WxyazawHzsJ+mOfKY+PvIjq04O9lUfz3yd+fsRxY2fGchyFy/dEF
	ayY5NlhCKDnMRpHAJ3NNMPcBEJ91Fqi7k/VWdrFYqklbYn9/bxQryBHAAKBWoM2pb0+WfQH+vg=
	=
X-Received: by 2002:a05:7301:4d07:b0:369:21a:dcca with SMTP id 5a478bee46e88-3827f5972d9mr113314eec.10.1794936575989;
        Tue, 17 Nov 2026 09:29:35 -0800 (PST)
Received: from ubuntu ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955f02ff0sm44163997eec.16.2026.11.17.09.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:29:34 -0800 (PST)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	stable@vger.kernel.org
Subject: [PATCH] LoongArch: Online memory-only NUMA nodes
Date: Wed, 18 Nov 2026 02:29:23 +0900
Message-ID: <20261117172924.3768845-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_numa_memory() does not online a memory-only node, because it
onlines a node only if it has CPUs.

So online a node if it has any memory or CPUs.

Fixes: 87c6d144bc7b ("LoongArch: Don't init & online empty nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/loongarch/kernel/numa.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/loongarch/kernel/numa.c b/arch/loongarch/kernel/numa.c
index 7dedc134ddfe..595cc15203a3 100644
--- a/arch/loongarch/kernel/numa.c
+++ b/arch/loongarch/kernel/numa.c
@@ -140,20 +140,25 @@ void numa_remove_cpu(unsigned int cpu)
 	cpumask_clear_cpu(cpu, &cpus_on_node[nid]);
 }
 
-static void __init node_mem_init(unsigned int node)
+static bool __init node_mem_init(unsigned int node)
 {
 	unsigned long start_pfn, end_pfn;
 	unsigned long node_addrspace_offset;
 
+	get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
+	if (start_pfn == end_pfn)
+		return false;
+
 	node_addrspace_offset = nid_to_addrbase(node);
 	pr_info("Node%d's addrspace_offset is 0x%lx\n",
 			node, node_addrspace_offset);
 
-	get_pfn_range_for_nid(node, &start_pfn, &end_pfn);
 	pr_info("Node%d: start_pfn=0x%lx, end_pfn=0x%lx\n",
 		node, start_pfn, end_pfn);
 
 	alloc_node_data(node);
+
+	return true;
 }
 
 #ifdef CONFIG_ACPI_NUMA
@@ -246,10 +251,8 @@ int __init init_numa_memory(void)
 		return -EINVAL;
 
 	for_each_node_mask(node, node_possible_map) {
-		if (!cpumask_empty(&cpus_on_node[node])) {
-			node_mem_init(node);
+		if (node_mem_init(node) || !cpumask_empty(&cpus_on_node[node]))
 			node_set_online(node);
-		}
 	}
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = min(PFN_DOWN(HIGHMEM_START), max_pfn);

base-commit: 422e532809572ba1043192bf6a0c653bc68b3140
-- 
2.53.0

