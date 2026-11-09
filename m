Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.127
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794198839;
	b=PlA98pGZb0jnyLSmqB2dONu9ge6zUbKEt/sN/av5HNhatzOpfbJ7/LTWAGyBpoZnbv/X
	 SMkVnt1k1k6Kd3Pp2bmZrs+hpIyBwT3qk2gD14NW4xP31M4SYf4WRoFMW1zgOZArrON35
	 Kyn6sKgc/lwP3DNWM4DWf4Ez+5EkFpobYJAmbyNRFAdpoQIReYD/JZMLgd/80KElkplLY
	 gMc2nz01r5PeDBxHMBGcsK3sbsi8BRvKVctt3d9jEa0mzwPCLtWodfT9NTH9zC5iqucbo
	 wYTwf35hgufpcjchHYhppeSotsreLHbFXtrnopnTe2f7IVK8IsJ2L34qQJ7p+T8qzpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794198839;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=4DN1Y+t6vujW8S/AQPbCJ490d9V4hkbmm812BgwtOTM=;
	b=pWEpJthLI/ICSlrxR5AscNsXB8YTXlu+dcpBKO6upoNynok6KdiGAHYlQkqnqfPS4/8g
	 tB/z7GSK6Tq4oAEaHePVtjYBZRoeD1Ew/v4OfBZsGjYy/TqwTn0VOKyeEm32keW/+X5HQ
	 U1zsufcaSX2GIPYOWf3R9MMWCdk6n+Y3xFpkuJBwm6uJkgKESTvTkEOTK8wrT2SX/VuX9
	 BhxV0wnnEo/aIh5yGbb22l7BVrLMie4GH6iLBxkeccYgALXO7TAEVXbDMZYB11q5CNit8
	 6Sj6IWAAFKzZjIFCZ/x0hvweinu2mdSWXFj7YhXZpqxCp6I3O0hBmTbxaekwMOUn10A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J+aTWeug;
	arc=none smtp.remote-ip=91.218.175.127
Received: from mta0.migadu.com (out-127.mta0.migadu.com [91.218.175.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3FE606A31C
	for <loongarch@lists.linux.dev>; Mon,  9 Nov 2026 04:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C3FE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=J+aTWeug
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Uhs7BWZm2N+gFKXL/TmYjVQYKnl8VlxGISFVM5NLm40=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794198836; v=1; x=1794803636;
 b=J+aTWeugil4lbZaw86bysXlj72KJ1YDD/oBtNnrnxpwFt1Zv3v92oWKWjh4hCRQhawyW6UvD
 SrnwHPTpMGnc32HdDCtbC3titUBPWUSWN+J0XGBgJevyXUJILOhMtgkDhR1TxBlSmyoG0ILcNWb
 71MK+oj5lMtq7adOxfFCoBjg=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id b7fb94620bed6bfe;
	Mon, 09 Nov 2026 04:33:56 +0000
X-Mizu-Trace-ID: b7fb94620bed6bfe
X-Migadu-Flow: FLOW_OUT
From: Lance Yang <lance.yang@linux.dev>
To: songmuchun@bytedance.com
Cc: david@kernel.org,
	maddy@linux.ibm.com,
	rppt@kernel.org,
	akpm@linux-foundation.org,
	lance.yang@linux.dev,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	osalvador@suse.de,
	qi.zheng@linux.dev,
	muchun.song@linux.dev,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org
Subject: Re: [PATCH v3 3/5] loongarch/mm: disable device DAX vmemmap optimization
Date: Mon,  9 Nov 2026 12:33:46 +0800
Message-ID: <20261109043346.38778-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20261107043122.25650-4-songmuchun@bytedance.com>
References: <20261107043122.25650-4-songmuchun@bytedance.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On Sat, Nov 07, 2026 at 12:31:20PM +0800, Muchun Song wrote:
>LoongArch selects ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP but not
>ARCH_WANT_OPTIMIZE_DAX_VMEMMAP. Its vmemmap_free() implementation is also
>empty, so it cannot tear down optimized Device DAX mappings.
>
>A later change removes the generic Device DAX architecture gate and lets
>vmemmap_populate() decide whether a section can use optimization. Clear the
>section compound order in the LoongArch path so Device DAX keeps using
>unoptimized mappings.
>
>This does not affect HugeTLB HVO: LoongArch does not support gigantic
>pages, so HugeTLB does not use section-based vmemmap optimization there.
>
>Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>---
>v2:
>- New patch using section_vmemmap_optimization_disable() to keep Device
>  DAX vmemmap optimization disabled on LoongArch (reported by Sashiko)
>---
> arch/loongarch/mm/init.c | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/arch/loongarch/mm/init.c b/arch/loongarch/mm/init.c
>index f801f7097f03..ea769e479241 100644
>--- a/arch/loongarch/mm/init.c
>+++ b/arch/loongarch/mm/init.c
>@@ -15,6 +15,7 @@
> #include <linux/memblock.h>
> #include <linux/memremap.h>
> #include <linux/mm.h>
>+#include <linux/vmemmap-optimization.h>
> #include <linux/mman.h>
> #include <linux/highmem.h>
> #include <linux/swap.h>
>@@ -143,6 +144,7 @@ void __meminit vmemmap_set_pmd(pmd_t *pmd, void *p, int node,
> int __meminit vmemmap_populate(unsigned long start, unsigned long end,
> 			       int node, struct vmem_altmap *altmap)
> {
>+	section_vmemmap_optimization_disable(start, end);

Yeah, clearing the order here keeps Device DAX optimization disabled once
the generic gate goes away ;)

Nothing jumped out at me, feel free to add:

Reviewed-by: Lance Yang <lance.yang@linux.dev>
