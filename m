Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D36315E5BB
	for <loongarch@lists.linux.dev>; Thu,  9 Jul 2026 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783601338; cv=none; b=ahSpSz6nGPorjhJgQ189p32nnfoxfG6QAXV4CWBbDI1pS+8+QoduGyt0Owv/rN9WBuyZJ4Ao0UDNnhyXa82uSVxFp0ImmSQ9okSh0qb2OZTyi8H3kLu4KfBoedrp2kt7N0RjvMe2QFySB4YPY6vElDq/6GayUYMVVLeI61MYEnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783601338; c=relaxed/simple;
	bh=8OUUT8qKzTxyLqKTXaf6utKezb1ei0lgRETyjCKwMRo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jvIv1nvggVlAWbWi1unN+WghaKqJ1qk1UC8IxCKL/YuAadxeFtZ0BYqVWskFeObdqgLM3J+YMNRSzbJQ46gR3gsC3a0KlPAH59jr6E1cJIIyiyHrKr9hmQTaEOhfM3BeXX7/gehz/qnwxqUezQ1/9hjN9N+KiNtYZZcr2z719qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Iycg/KIV; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Iycg/KIV"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783601334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=egEQegkzVd6qWuiMRf57t7zF7MyRk5jNUn1HniJAO8k=;
	b=Iycg/KIVqDMfLX8Xy+tVV/5u6vC42kFOn0WbRUUEikqUEe+PnvXScKlmERZNC+QZDq/4l9
	mJztvFMEpgk1ET9hT3h2VfL9kJwZhtygo99555KQ6Vyk05NJLziCH3xjbLtzs6Tk4c2jQx
	0CqbzLokzg0DSOA7mnIWVA4lJ1+bCx4=
From: George Guo <dongtai.guo@linux.dev>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: maobibo@loongson.cn,
	loongarch@lists.linux.dev,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>
Subject: Re: [PATCH v4 0/2] LoongArch: kexec: avoid clobbering the QEMU FDT
Date: Thu,  9 Jul 2026 20:48:30 +0800
Message-ID: <20260709124830.15417-1-dongtai.guo@linux.dev>
In-Reply-To: <CAAhV-H7S9_hPDFoCtzgfY9TeH_koN9NfKq9mo8y9BmLA5-7how@mail.gmail.com>
References: <CAAhV-H7S9_hPDFoCtzgfY9TeH_koN9NfKq9mo8y9BmLA5-7how@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi Huacai,

Thanks for the correction, and I am sorry for the way I handled this.

> Who told you the trampoline is dead code? All non-boot CPUs are
> running in the trampoline, you can use maxcpus=1 to go to the new
> kernel, and do something, and then hotplug the non-boot CPUs at any
> time.

You are right, and I was wrong to call the trampoline dead once the new
kernel starts.  The non-boot CPUs spin in kexec_smp_wait inside the
trampoline buffer and only leave it when the new kernel brings them
online, so with maxcpus=1 they stay there until a later CPU hotplug.
The buffer has to stay valid the whole time.

That breaks my patch 1.  control_code_page is allocated by the kexec
core and is not reserved in the new kernel, so the new kernel can reuse
that page while the non-boot CPUs are still spinning in it, and small
memory makes that more likely.  The fixed KEXEC_CONTROL_CODE at 0x100000
avoided this because the first 2MB is memblock_reserve()d in both
kernels; its only problem was that it overlaps QEMU's machine FDT at
0x100000.  So my Q2 answer in the cover letter was also wrong, and "as
arm64/riscv do" does not apply here.

So the trampoline still needs to live in the cross-kexec reserved first
2MB, just not on top of the FDT.  The FDT declares fdt_totalsize 1MB and
covers [0x100000, 0x200000), so the room left is below 0x100000.

Do you have a different fix in mind? I would like to agree on the
direction with you before I send anything.

> BTW,  you have never replied to my comments, all you have done is
> submit new versions again and again.

That is fair, and it was my mistake.  I should have replied to your
review in the thread and discussed it before sending a new version,
instead of putting my answers in a cover letter.  I will reply to
comments first from now on.

I will hold the series until we settle the trampoline approach.

Thanks,
George
