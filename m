Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5680D409268
	for <loongarch@lists.linux.dev>; Wed,  8 Jul 2026 15:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523123; cv=none; b=AYUtWQhV9g5InyBRdwkq2fqAWC7BUMVg8uAT4K7H8dsjotlVA880nDbOPF6fYJ5QKPjRo+fGVzP5gomBXXOb7YavxUkBHrl3Ll5D2D8gUYxFoKM4t9PIHTZZMhx0WSns6XPb2h5LtjANVKNrEKGE48MMzyVHvdajIAVVkgEAf0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523123; c=relaxed/simple;
	bh=45nCfmPtRGhWwWGA/UlmV0ZkrWyvtYCwuI7ANzgmblk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=C7SSUn4L0f4WnXZ/CAuWK8i3FWFx620WUBKpzH3lJYU94yz7wDI1ndN90lCnGuL6T/gcs16/aZ25fSH3PEk4RLSu13eI4lDVIJVCThiOzS/4Aq/5knOyYwvgzD5hK2NFDHCv4ScCn22n3ltytJJYQbHc6RDfUUynxF11okB43KQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GTzPQLPV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GTzPQLPV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783523121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oiHynRISoOwm99WuNq3SEqzdBDkhCTcAiYfgAom2HcA=;
	b=GTzPQLPVFNUcITFlkYy/dneHZ1uYS6/qGN/33vobylc2Kk0ZV+LVonGYlucmaLibx4UQSq
	nva5/q65KGjZAYJ9bV8VB06y25FTkoDqAp2byAnZxNPExWhDPeX2HctzbsPiI6IGf7tz5z
	cKRLZnJwApV8+/Pbo3l2gokqIhdEnLY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-77-q4fSLNdbNEK7TUm6eLmJzQ-1; Wed,
 08 Jul 2026 11:05:18 -0400
X-MC-Unique: q4fSLNdbNEK7TUm6eLmJzQ-1
X-Mimecast-MFC-AGG-ID: q4fSLNdbNEK7TUm6eLmJzQ_1783523114
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57F8918052CC;
	Wed,  8 Jul 2026 15:05:12 +0000 (UTC)
Received: from redhat.com (unknown [10.22.80.46])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 916951955F7B;
	Wed,  8 Jul 2026 15:05:05 +0000 (UTC)
Date: Wed, 8 Jul 2026 11:05:03 -0400
From: Joe Lawrence <joe.lawrence@redhat.com>
To: George Guo <dongtai.guo@linux.dev>
Cc: chenhuacai@kernel.org, jpoimboe@kernel.org, peterz@infradead.org,
	jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com,
	kernel@xen0n.name, rostedt@goodmis.org, ardb@kernel.org,
	nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	yangtiezhu@loongson.cn, jiaxun.yang@flygoat.com,
	liukexin@kylinos.cn, guodongtai@kylinos.cn, xry111@xry111.site,
	wangyuli@aosc.io, loongarch@lists.linux.dev,
	live-patching@vger.kernel.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/12] livepatch/klp-build: build LoongArch with -fPIC
 to keep GOT-indirect symbol references
Message-ID: <ak5nH60j4Rdn50n-@redhat.com>
References: <20260707072031.231066-1-dongtai.guo@linux.dev>
 <20260707072031.231066-5-dongtai.guo@linux.dev>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260707072031.231066-5-dongtai.guo@linux.dev>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: l2MFqPR8YCOGTr4dGEWrTaVWfWaqVc0aaiBYrr2unw8_1783523114
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 07, 2026 at 03:20:23PM +0800, George Guo wrote:
> From: George Guo <guodongtai@kylinos.cn>
> 
> On LoongArch, klp-build livepatch modules panic when a patched function
> references a global defined in the same compilation unit (e.g.
> SYSCALL_DEFINE1(newuname) -> 'uts_sem' in kernel/sys.c).
> 
> With CONFIG_RELOCATABLE=y the kernel is already -fPIE, so this is not
> absolute addressing; the problem is GOT indirection. For a same-unit
> global, -fPIE emits a direct PC-relative reference (R_LARCH_PCALA_*) and
> skips the GOT, while -fPIC routes it through the GOT (R_LARCH_GOT_PC_*).
> klp-build extracts the patched function into a separate module while
> 'uts_sem' stays in the core kernel, and the klp relocation machinery can
> only redirect such a cross-object reference through a GOT entry. The
> direct -fPIE reference has no GOT slot to fix up, so once the function is
> relocated its target is wrong and it faults.
> 
> Force -fPIC for LoongArch KLP builds; -fPIE is not enough, as it
> optimizes away the very GOT indirection KLP relies on.
> 
> This depends on the preceding patch: -fPIC is passed via KCFLAGS, but the
> arch adds -fPIE via KBUILD_CFLAGS_KERNEL, which kbuild applies after
> KCFLAGS (so -fPIE would win). That patch's command-line
> KBUILD_CFLAGS_KERNEL= assignment replaces the arch value and drops -fPIE,
> letting -fPIC take effect. The two patches must stay together.
> 

This might be my personal preference, but I think it would be quicker to
review patches: ("livepatch/klp-build: disable direct-extern-access for
LoongArch to fix kernel panic") ("livepatch/klp-build: build LoongArch
with -fPIC to keep GOT-indirect symbol references") if they were
squashed into one patch.

With that, the commit messages can drop the forward/backward references,
while the combined commit remains complete thought, i.e. for LoongArch
KLP builds, replace the arch's KBUILD_CFLAGS_KERNEL (dropping -fPIE and
-mdirect-extern-access) and add -fPIC via KCFLAGS instead.

> Co-developed-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: Kexin Liu <liukexin@kylinos.cn>
> Signed-off-by: George Guo <guodongtai@kylinos.cn>
> ---
>  scripts/livepatch/klp-build | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/livepatch/klp-build b/scripts/livepatch/klp-build
> index 27fe8824ef12..42cd58aff3d8 100755
> --- a/scripts/livepatch/klp-build
> +++ b/scripts/livepatch/klp-build
> @@ -557,8 +557,15 @@ build_kernel() {
>  	local cmd=()
>  
>  	local ARCH_KBUILD_CFLAGS_KERNEL=""
> +	local ARCH_KCFLAGS=""
>  
>  	if [[ -v CONFIG_LOONGARCH && "$CONFIG_LOONGARCH" == "y" ]]; then
> +		# -fPIC replaces the kernel's -fPIE (added under CONFIG_RELOCATABLE);
> +		# without that config there is no -fPIE to replace.
> +		[[ "${CONFIG_RELOCATABLE:-}" == "y" ]] || \
> +			die "LoongArch klp-build requires CONFIG_RELOCATABLE=y"
> +		ARCH_KCFLAGS="-fPIC"
> +
>  		# -mdirect-extern-access only exists under explicit relocs, and this
>  		# function replaces KBUILD_CFLAGS_KERNEL wholesale (safe only then;
>  		# the non-explicit build puts -Wa,-mla-global-with-pcrel there).
> @@ -599,8 +606,16 @@ build_kernel() {
>  		cmd+=("-s")
>  	fi
>  	cmd+=("-j$JOBS")
> -	cmd+=("KCFLAGS=-ffunction-sections -fdata-sections")
> -	cmd+=("KBUILD_CFLAGS_KERNEL=$ARCH_KBUILD_CFLAGS_KERNEL")
> +	cmd+=("KCFLAGS=-ffunction-sections -fdata-sections${ARCH_KCFLAGS:+ $ARCH_KCFLAGS}")
> +	# -fPIC is added for KLP via KCFLAGS above; the arch adds -fPIE via
> +	# KBUILD_CFLAGS_KERNEL, which kbuild places after KCFLAGS on the
> +	# built-in compile line.  -fPIC/-fPIE is last-one-wins, so -fPIE would
> +	# win.  Setting KBUILD_CFLAGS_KERNEL on the command line replaces the
> +	# arch value (not append), which drops -fPIE and lets -fPIC win.  Only
> +	# do this when an arch needs it (LoongArch).
> +	if [[ -n "$ARCH_KBUILD_CFLAGS_KERNEL" ]]; then
> +		cmd+=("KBUILD_CFLAGS_KERNEL=$ARCH_KBUILD_CFLAGS_KERNEL")
> +	fi
>  	cmd+=("vmlinux")
>  	cmd+=("modules")
>  

I'd also pull out the configuration checks into validate_config() to be
consistent:

  if [[ -v CONFIG_LOONGARCH ]]; then
       [[ -v CONFIG_AS_HAS_EXPLICIT_RELOCS ]] || \
           die "LoongArch klp-build requires CONFIG_AS_HAS_EXPLICIT_RELOCS=y"
       [[ -v CONFIG_RELOCATABLE ]] || \
           die "LoongArch klp-build requires CONFIG_RELOCATABLE=y"
  fi

and then build_kernel() only needs to adjust the cmd / flags accordingly.

--
Joe

