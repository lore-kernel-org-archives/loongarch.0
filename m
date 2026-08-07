Received: from out-170.mta0.migadu.com (out-170.mta0.migadu.com [91.218.175.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD3C346FBC
	for <loongarch@lists.linux.dev>; Fri,  7 Aug 2026 06:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786083376; cv=none; b=lpXwQLasYbW3EsL624P9cxbe9r2CHMe5pHJ94EOqIPDgL86JVC55qTHS3ZCQfrTSpbaUNd7RMTQP7tUjUI/NyISm7tXu0eOkYbvpK26T5YDOOm61VJGi+bZd+262idBLmTcL2gXcdRx7Ts/btQVgPSCIQgz6OzEQj8sMzoIbIU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786083376; c=relaxed/simple;
	bh=hjnw/qE7HyBvBufdS0wWmsH4ggDcj9ZcMrWIU7+pkCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I29xqWF0kKCfZpy045yLWUmTlnttnD47TGfgpR/4aRas+cbtU1GjYDErZwuBi96r18ZhJ+a8N/8n6O5esdlmydHeIRQ3DVo0gR5y3a8UaVCZSvo8DST6kDO2v9dDI9aGFHAah4AdAU6tAmue1nL7LizpUIq7Bn8SSGvkgBDf+oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=PF5x6Hdy; arc=none smtp.client-ip=91.218.175.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="PF5x6Hdy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786083363;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hjnw/qE7HyBvBufdS0wWmsH4ggDcj9ZcMrWIU7+pkCw=;
	b=PF5x6HdyoXzG6dwhX8clKmXBjCrV1NxK1EUD5zLCw7HSl4QEkIlQCtInam5Lme4FY/Ek5f
	rd6kgDpgWX9zdcIHDevzXa3Lt108lEi8lTcqXF+c1H8V2nFk6XlCkIE6vGQ6/EG4b9aFz1
	FuBH2rKzeuLn3f+UTvCPa9rN2IyvKwQ=
From: George Guo <dongtai.guo@linux.dev>
To: chenhuacai@kernel.org
Cc: jpoimboe@kernel.org,
	peterz@infradead.org,
	jikos@kernel.org,
	mbenes@suse.cz,
	pmladek@suse.com,
	kernel@xen0n.name,
	joe.lawrence@redhat.com,
	rostedt@goodmis.org,
	ardb@kernel.org,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	yangtiezhu@loongson.cn,
	jiaxun.yang@flygoat.com,
	wangrui@loongson.cn,
	liukexin@kylinos.cn,
	guodongtai@kylinos.cn,
	xry111@xry111.site,
	wangyuli@aosc.io,
	loongarch@lists.linux.dev,
	live-patching@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 00/14] LoongArch: Add livepatch build (KLP) support
Date: Fri,  7 Aug 2026 14:15:10 +0800
Message-ID: <20260807061510.26138-1-dongtai.guo@linux.dev>
In-Reply-To: <CAAhV-H7=WxEov9S3TTMxd1GORov-0dtuRWTgFH-B31teXpVNQw@mail.gmail.com>
References: <CAAhV-H7=WxEov9S3TTMxd1GORov-0dtuRWTgFH-B31teXpVNQw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Huacai,

On Mon, Jul 27, 2026 at 10:15:03PM +0800, Huacai Chen wrote:
> It is better to reorganize this series like this:
>
> objtool/klp: Convert local label references
> objtool/klp: Fix ANNOTATE_DATA_SPECIAL parsing for local label references
> objtool/klp: Add LoongArch jump opcode bytes support
> objtool/klp: Fold LoongArch paired ADD/SUB relocations into PCREL
> objtool/klp: Keep LoongArch tablejump annotation table entries
> objtool/klp: Rewrite PC-relative data references to GOT on LoongArch
> objtool/LoongArch: Add arch_adjusted_addend() for KLP support
> objtool/LoongArch: Enable inline alternative cloning for KLP
> klp-build: use -fPIC and drop direct-extern-access on LoongArch
> klp-build: Add LoongArch syscall patching macro
> LoongArch: Mark special sections for KLP support
> LoongArch: Fix EFI linking with -fdata-sections
> LoongArch: Add livepatch build (KLP) support
> LoongArch: Select FTRACE_MCOUNT_USE_PATCHABLE_FUNCTION_ENTRY

Done. The series is reordered exactly as above. I re-ran the full klp-build
integration suite under both GCC and Clang, and every test still builds,
loads, and runs. I will send this as v5.

Josh, Joe:

I'd welcome any further comments on the livepatch build patches before
I send v5.

Thanks,
George
