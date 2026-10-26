Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.220
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793001183;
	b=kQ2MvH9iRewDJW80kw4VPtBV4H3jGsxRPMtUPn9Mg8ZlynoR73XoTkSakH0yq1+jMsuZ
	 l6WGW4r6WvRetkVKzdRgG/xhSbvHWPQBzFZwvqGRBPpKB/cFyOd5TiVpaTgs9aR8GviyF
	 6BdtgDZ9uoDHg/llDhm5i5gKMw2A4kSClrhdwZ3scGgmolW7ssRhEgnf47XNdaY0URBC9
	 yeIz2KBqCLK3IGp7Fvt29K3gypCAKnSgZ0/4jEZaT4c69izdb/c1dQ6Mx98UJXj2pK1fi
	 s9LM6629Ubfl4niMgOxQskp/xxzA7l0ZZN0dN8T7ljpW+s+bwehpJ7dYdRv6izzZc9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793001183;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:From:To:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=Q37eFExC6M3HhNsbtTO2StjSIwhNf+LEG0N/7SGQYv4=;
	b=VrYrCYK2OaTBUGiPIZEoCWmNiCV2uJrATNhp9vPsCKOcwfkoo5LI6/XFrva/za51AmXP
	 Vy/isyoH7thB1HnLr9xfAdu0QokKv3uBot0lraBsXyJ4q6Xw6k1rPHi/bHOU7hdjK3N29
	 of38Hhrd/VgCCGMb4S6s416DcxhB/+cqEjucEMyjDNa7UD7u7GHJlQUrmk6UISoGSjvtU
	 vwD5k6xLkhM5PEb8OD9K+0666JCs8cONf2KAsF5hUDPR4c0jVnbVGHbOksNaAkXgiC8oe
	 t26bUCQ6/zqhVVhsQuBOPIRfHkAZVGzlkSyyzTLBHbEvbyJf7ZQx6u4IRFGXwPPhaqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Z3shP3oo;
	arc=none smtp.remote-ip=113.46.200.220
Received: from canpmsgout05.his.huawei.com (canpmsgout05.his.huawei.com [113.46.200.220])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C76606A322
	for <loongarch@lists.linux.dev>; Mon, 26 Oct 2026 07:53:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6C76606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Z3shP3oo
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Q37eFExC6M3HhNsbtTO2StjSIwhNf+LEG0N/7SGQYv4=;
	b=Z3shP3ooxReMBA6K6DclOtd/c2nZdN888LJ5ncwYrjzheXC87zR6soeusaGbvrPDnNaF8GwCQ
	tc4X52XOgex3AWsBhHnMMeeLI33bz6Y1GZcn3FLoZQhPUDgfmMnazgw/k4BKLKkBbrSfJ9uqVwE
	/IsGeUkCOtVWYA6xCLw6NHY=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jCm7s1zgyz12LJ2;
	Mon, 26 Oct 2026 15:52:57 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 3B53B4057D;
	Mon, 26 Oct 2026 15:52:53 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 26 Oct
 2026 15:52:51 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<ritesh.list@gmail.com>, <sshegde@linux.ibm.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<baoquan.he@linux.dev>, <rppt@kernel.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <thuth@redhat.com>, <ruanjinjie@huawei.com>,
	<leitao@debian.org>, <yeoreum.yun@arm.com>, <robh@kernel.org>,
	<sourabhjain@linux.ibm.com>, <kees@kernel.org>, <coiby.xu@gmail.com>,
	<Yeking@Red54.com>, <tangyouling@kylinos.cn>, <maqianga@uniontech.com>,
	<zhangtianyang@loongson.cn>, <guodongtai@kylinos.cn>, <blum@kernel.org>,
	<adityag@linux.ibm.com>, <hui.wang@canonical.com>, <sohammetha01@gmail.com>,
	<guoren@kernel.org>, <gaohan@iscas.ac.cn>, <kai.huang@intel.com>,
	<kas@kernel.org>, <vishal.l.verma@intel.com>, <piliu@redhat.com>,
	<jbouron@amazon.com>, <mclapinski@google.com>, <me@linux.beauty>,
	<graf@amazon.com>, <bgwin@google.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
Subject: [PATCH v7 01/15] arm64: kexec_file: Stop using the Image text_offset
Date: Mon, 26 Oct 2026 15:51:47 +0800
Message-ID: <20261026075201.699550-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026075201.699550-1-ruanjinjie@huawei.com>
References: <20261026075201.699550-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)

image_load() adds text_offset to kernel_segment->mem and subtracts it
from kernel_segment->memsz.  For CMA backed segments this breaks the
load path: the payload is copied to page_address(cma), which is the CMA
base, while image->start is set to the adjusted address, so kexec jumps
into the middle of the kernel.  kimage_map_segment() has the same
mismatch when a segment has been moved.

The adjusted memsz also breaks the release path: the CMA pages are
freed using segment->memsz >> PAGE_SHIFT, which is fewer than were
allocated, leaking the tail of the allocation.

Since commit 751c263bb74f ("arm64: remove TEXT_OFFSET randomization")
TEXT_OFFSET is always zero.  This has been upstream since v5.8, so no
LTS kernel carries a non-zero text_offset.  Drop the adjustment and
reject images with a non-zero value instead of booting them from a
wrong address.  With the adjustment gone, segments stay at their CMA
base and the release size matches the allocation.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Link: https://lore.kernel.org/all/20260921090450.807575-2-ruanjinjie@huawei.com/
Link: https://lore.kernel.org/all/20260921090450.807575-3-ruanjinjie@huawei.com/
Fixes: 07d24902977e ("kexec: enable CMA based contiguous allocation")
Suggested-by: Mike Rapoport <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/kexec_image.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kernel/kexec_image.c b/arch/arm64/kernel/kexec_image.c
index b8d0fb0a9daf..74d24c8aa2fa 100644
--- a/arch/arm64/kernel/kexec_image.c
+++ b/arch/arm64/kernel/kexec_image.c
@@ -80,12 +80,17 @@ static void *image_load(struct kimage *image,
 	kbuf.bufsz = kernel_len;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	kbuf.memsz = le64_to_cpu(h->image_size);
+	/*
+	 * Pre-v5.8 images carry a non-zero text_offset, which is no longer
+	 * honored; reject them instead of loading them at a wrong address.
+	 */
 	text_offset = le64_to_cpu(h->text_offset);
+	if (text_offset) {
+		pr_err("Unsupported Image text_offset 0x%lx\n", text_offset);
+		return ERR_PTR(-ENOEXEC);
+	}
 	kbuf.buf_align = MIN_KIMG_ALIGN;
 
-	/* Adjust kernel segment with TEXT_OFFSET */
-	kbuf.memsz += text_offset;
-
 	kernel_segment_number = image->nr_segments;
 
 	/*
@@ -117,8 +122,6 @@ static void *image_load(struct kimage *image,
 	}
 
 	kernel_segment = &image->segment[kernel_segment_number];
-	kernel_segment->mem += text_offset;
-	kernel_segment->memsz -= text_offset;
 	image->start = kernel_segment->mem;
 
 	kexec_dprintk("Loaded kernel at 0x%lx bufsz=0x%lx memsz=0x%lx\n",
-- 
2.34.1

