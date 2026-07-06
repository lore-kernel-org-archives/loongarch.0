Received: from out-178.mta1.migadu.com (out-178.mta1.migadu.com [95.215.58.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AD643A7F50
	for <loongarch@lists.linux.dev>; Mon,  6 Jul 2026 09:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783331665; cv=none; b=D1BdDAx9S0yNGmFCht+G0v8BWmJgPCWyB0drM0hb+gB4C0BW5Fv5Ix4G8JJUHdZLDhYfKb2YaPLmM7FehOPdVr4knKf+ABWbjVBCt5lw222g6JBzXj/gY8EK8PUwniVAW9KKOmaA3kojzEeHPDJcObYsTVhbGMJfb0k3Px777so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783331665; c=relaxed/simple;
	bh=nmkNEuSSRXOWQ+fQK8t5cUqoO4mOo1r1RlT9MPv9R0c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PUruYvkiGpGndOTH/O9cDIV09PGVa3QRDE40lLSSe4yIoOSVgzwlWnjdrYESNsNhHzK9yZUlCGfDaWHu4ls5buYJQLqNHa9Gaf30yurby9d8aBVy/AUlQI9trdbajzOtFJnS2OUfOvyCu29RxY64kdUURffZbDvAc4LolGbCP54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PsuGroZB; arc=none smtp.client-ip=95.215.58.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PsuGroZB"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783331650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JiS26J1psSuN4TZcQYloU+Pagv1iyXiJht79PeggRvs=;
	b=PsuGroZBTakhSmISbhteuGWkJ6d9vRSBkPZiVP5KQ+bVl2pBVLCVAdcWIyBKlRU1Z0lcof
	dfn6lQX4gRbnrzrVp2fkSfGcE7r6Hsz52dF9e1GuSFYBbwJDv7KqalJnvyjWqpkfkDP01q
	VV/Y0iEDT82Trd197luzw+2PK91a69Q=
From: George Guo <dongtai.guo@linux.dev>
To: joe.lawrence@redhat.com
Cc: ardb@kernel.org,
	chenhuacai@kernel.org,
	guodongtai@kylinos.cn,
	jiaxun.yang@flygoat.com,
	jikos@kernel.org,
	jpoimboe@kernel.org,
	kernel@xen0n.name,
	linux-kernel@vger.kernel.org,
	liukexin@kylinos.cn,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	loongarch@lists.linux.dev,
	mbenes@suse.cz,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	peterz@infradead.org,
	pmladek@suse.com,
	rostedt@goodmis.org,
	wangyuli@aosc.io,
	xry111@xry111.site,
	yangtiezhu@loongson.cn
Subject: Re: [PATCH v2 0/8] LoongArch: Add livepatch build (KLP) support
Date: Mon,  6 Jul 2026 17:53:44 +0800
Message-Id: <20260706095344.321644-1-dongtai.guo@linux.dev>
In-Reply-To: <akbDROiVKjbkqMZL@redhat.com>
References: <akbDROiVKjbkqMZL@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

Hi Joe,=0D
Thanks for reviewing!=0D
=0D
> Ok, what am I doing wrong here:=0D
[...]=0D
> What compiler / kernel config should I be trying with this patchset?=0D
=0D
Nothing wrong on your side -- both things you hit are real bugs, thanks=0D
for running the full flow.  Fixes for both (and for the special-section=0D
reloc issue you reported earlier) are queued for v3.  Quick answers to=0D
the compiler/config question:=0D
=0D
Compiler:=0D
=0D
 - GCC: this is what the series was tested with, on real LoongArch=0D
   hardware (livepatch modules generated, loaded and exercised).=0D
 - LLVM: your clang 21 is fine.  Note that klp-build itself requires=0D
   the LLVM assembler >=3D 20.=0D
=0D
Config:=0D
=0D
 - defconfig plus your script is exactly right.=0D
 - The FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY select you added is=0D
   the proper fix, not a workaround: arch/loongarch/Makefile already=0D
   builds with -fpatchable-function-entry=3D2.  v3 adds exactly that as=0D
   a patch, with your Reported-by/Suggested-by if that's ok with you.=0D
=0D
On the "duplicate reloc" error: reproduced and fixed.  The key field=0D
of a __jump_table entry is a cross-section difference (".quad key - ."),=0D
and clang's integrated assembler emits it as a relocation pair at the=0D
same offset when the key is not defined in the same translation unit:=0D
=0D
  $ readelf -rW net/core/dev.o        # clang 21.1.8=0D
  0x18  R_LARCH_ADD64  __tracepoint_netif_rx + 8=0D
  0x18  R_LARCH_SUB64  __jump_table + 0x18=0D
=0D
Locally-defined keys (e.g. netstamp_needed_key) get a single=0D
R_LARCH_64_PCREL instead, and GAS emits the single form in both cases,=0D
which is why a GCC build never trips on this.  objtool's=0D
elf_create_reloc() allows only one relocation per offset, so cloning=0D
such an entry fails on the SUB half.=0D
=0D
The fix queued for v3 folds the pair into the single equivalent=0D
R_LARCH_64_PCREL (which the module loader already supports).  With it,=0D
your exact test.patch now builds cleanly here with clang 21.1.8 on=0D
LoongArch hardware; the tracepoint key correctly ends up as a klp=0D
relocation against .klp.sym.vmlinux.__tracepoint_netif_rx.=0D
=0D
Thanks,=0D
George=0D
