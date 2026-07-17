Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF36330C163
	for <loongarch@lists.linux.dev>; Fri, 17 Jul 2026 17:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784307994; cv=none; b=AOFLMmw9JiQDeq6SJfa21ToU8kKfhpPLSxIXb1Ga6UmQa0MS48VrCY4yYIzXJznmcpPh5fn3UIyKAe+3x7FSnhHRESXwMAAPjqWhrVDsAR6vgIQd0Ly0thwUWGWsR+ivdOwOc96i2gYvnlDI54boxPkSeHWobwPTq3nSId60je4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784307994; c=relaxed/simple;
	bh=rONpXb9oW8OPj3FBvfBdm+Rp5+4wO/sYuo0vcpGBnuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t8EYGRblwiFlQcJ0gJVADViVWTthYOaxSaDHgWYsMZr/4sMg3ppsO7QTvR/QNzBwH6fSrIN1o8dV3L0ILgvkFDApIqIq7wPPR3lpwonZxWbcvN4f0Ezlwqx9S71JO8ny08I+K2HQlMbOEhM49zwuzAbpBUt48DVYhYFLUTdnDSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YGqH8s0N; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YGqH8s0N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784307993; x=1815843993;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rONpXb9oW8OPj3FBvfBdm+Rp5+4wO/sYuo0vcpGBnuM=;
  b=YGqH8s0NRcunZobm3j6rxqTUF0/WUO9lRovo/IiS51RGfa4saS+3rifD
   F5lwGs+aNzCli0cbYkQr8qZt2GKX6ShHqAqw2MOpEPxx92CcpyTyN90Fu
   rU5+rQ+QTWH2etZfBEBz4+nniz48Rft9HAREAvzqndflzfPqz6T+w4Uyh
   Pnbz6MV4ab9aZyys6tK59iIsekhF+j4x+NV4J8LHCefqofVdWvlzRKu+0
   sNMV18Kd8dbwj1tezT0b2QbyrFCdeK/mfdqOQJqkxsoOC4TcTFDFoaR9U
   CX7W8yxt6lOx5lowcXtjp0yGaq47NTVkl01oWY3ZsF9MGpb8Vx6xAQeBA
   g==;
X-CSE-ConnectionGUID: mrDBqlPhQRS1RrMIacvFUw==
X-CSE-MsgGUID: W1ZmdZ4HTb+C7/0VP9EfyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="110533750"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="110533750"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 10:06:32 -0700
X-CSE-ConnectionGUID: XSAC+DpETV6yB3MNtcR+cw==
X-CSE-MsgGUID: GgbsLVAVRKWYlWFo0XeHOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="286903817"
Received: from guptapa-desk.jf.intel.com (HELO desk) ([10.165.239.46])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 10:06:31 -0700
Date: Fri, 17 Jul 2026 10:06:31 -0700
From: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
To: stable@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>
Cc: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>
Subject: [PATCH 6.6.y 4/6] bpf: Skip redundant IBPB in pack allocator
Message-ID: <20260717-cbpf-jit-spray-hardening-6-6-y-v1-4-e04f1b2893de@linux.intel.com>
X-Mailer: b4 0.16-dev
References: <20260717-cbpf-jit-spray-hardening-6-6-y-v1-0-e04f1b2893de@linux.intel.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260717-cbpf-jit-spray-hardening-6-6-y-v1-0-e04f1b2893de@linux.intel.com>

commit a23c1c5396a91680703360d1ee28a44657c503c4 upstream.

bpf_prog_pack_alloc() issues IBPB on all CPUs on every cBPF allocation,
even when reusing chunks from an existing pack where no new memory was
touched since the last IBPB.

Since IBPB on all CPUs is heavy, Dave Hansen suggested to track allocation
since last IBPB, and only issue IBPB at reuse for the chunks that have not
seen an IBPB since they were last freed.

Track per-pack whether an IBPB is needed via arch_flush_needed. Set it when
allocating a chunk, reset on IBPB flush. On reuse, conditionally issue the
flush. Since IBPB invalidates all BTB entries, clear the flag on all packs
after flushing.

Signed-off-by: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Acked-by: Daniel Borkmann <daniel@iogearbox.net>
Signed-off-by: Daniel Borkmann <daniel@iogearbox.net>
---
 kernel/bpf/core.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 509f1b9c2b2e..a2e5684d6239 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -851,6 +851,7 @@ int bpf_jit_add_poke_descriptor(struct bpf_prog *prog,
 struct bpf_prog_pack {
 	struct list_head list;
 	void *ptr;
+	bool arch_flush_needed;
 	unsigned long bitmap[];
 };
 
@@ -906,6 +907,8 @@ static struct bpf_prog_pack *alloc_new_pack(bpf_jit_fill_hole_t bpf_fill_ill_ins
 	bitmap_zero(pack->bitmap, BPF_PROG_PACK_SIZE / BPF_PROG_CHUNK_SIZE);
 	list_add_tail(&pack->list, &pack_list);
 
+	if (static_branch_unlikely(&bpf_pred_flush_enabled))
+		pack->arch_flush_needed = true;
 	set_vm_flush_reset_perms(pack->ptr);
 	set_memory_rox((unsigned long)pack->ptr, BPF_PROG_PACK_SIZE / PAGE_SIZE);
 	return pack;
@@ -952,8 +955,15 @@ void *bpf_prog_pack_alloc(u32 size, bpf_jit_fill_hole_t bpf_fill_ill_insns, bool
 
 found_free_area:
 	/* Flush only for cBPF as it may contain a crafted gadget */
-	if (static_branch_unlikely(&bpf_pred_flush_enabled) && was_classic)
+	if (static_branch_unlikely(&bpf_pred_flush_enabled) &&
+	    pack->arch_flush_needed &&
+	    was_classic) {
+		struct bpf_prog_pack *p;
+
 		static_call_cond(bpf_arch_pred_flush)();
+		list_for_each_entry(p, &pack_list, list)
+			p->arch_flush_needed = false;
+	}
 	bitmap_set(pack->bitmap, pos, nbits);
 	ptr = (void *)(pack->ptr) + (pos << BPF_PROG_CHUNK_SHIFT);
 
@@ -991,6 +1001,9 @@ void bpf_prog_pack_free(struct bpf_binary_header *hdr)
 		  "bpf_prog_pack bug: missing bpf_arch_text_invalidate?\n");
 
 	bitmap_clear(pack->bitmap, pos, nbits);
+
+	if (static_branch_unlikely(&bpf_pred_flush_enabled))
+		pack->arch_flush_needed = true;
 	if (bitmap_find_next_zero_area(pack->bitmap, BPF_PROG_CHUNK_COUNT, 0,
 				       BPF_PROG_CHUNK_COUNT, 0) == 0) {
 		list_del(&pack->list);

-- 
2.43.0


