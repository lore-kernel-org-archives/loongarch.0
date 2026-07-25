Received: from out-184.mta0.migadu.com (out-184.mta0.migadu.com [91.218.175.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785B32F5487
	for <loongarch@lists.linux.dev>; Sat, 25 Jul 2026 03:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784950724; cv=none; b=Vwq3oQrEJtpiQI81GfPZhdcP3g5vKOMAeEpH99Nfw8ZZLHIm++yJkXlVe5CIHG+Sm7g4XJ+DbplsaN/xqwFWP3xIQh9WZkCcijSmra4G+HekZgTRG1NFuJl0x/gaRy0xaYVAtUiYmsV82ZEIgpOAoOD4yCv/qzK1blebih6ZYAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784950724; c=relaxed/simple;
	bh=KGCx/nUcIojj4vVTa6HmTLP9goi3xspND1XCcM374O4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z78m/7bRYT2sV+rzIXgyJAzeUuf9FSEklehXEx7k6cs2QDyQ3JPcX9qFLypodW5I69c2rFniTijXkEnShkAhjkhz9korcuMmQXh0UFiMjBE5HFiO4ydvC9yGxsO5WtIWVK5ZOpzbFTrN29mlTdHZaObBx2KdMr51iBkjYN6OeCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=iKF+GRiG; arc=none smtp.client-ip=91.218.175.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="iKF+GRiG"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784950719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KGCx/nUcIojj4vVTa6HmTLP9goi3xspND1XCcM374O4=;
	b=iKF+GRiGygLAprAR6P9dJ71OP21m5FbXml04PBnFayOuSZ8C5fBgh4o2BVdpnCb8ms6Z+y
	xmv4VlLaUPyQI2vUftCWQZJeXc9BeZr3RXIe2nfqhgHcI6DRD2mrc/O/Yje054GluUlJVa
	7fKT0Ej89cBZ9F5tFlMU2UZwEPddsRI=
From: Tao Cui <cui.tao@linux.dev>
To: zeng_chi911@163.com
Cc: chenhuacai@kernel.org,
	kernel@xen0n.name,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	maobibo@loongson.cn,
	stable@vger.kernel.org,
	zengchi@kylinos.cn,
	zhaotianrui@loongson.cn,
	cui.tao@linux.dev,
	cuitao@kylinos.cn
Subject: Re: [PATCH 1/2] LoongArch: KVM: Fix PC double advance in kernel MMIO read fast path
Date: Sat, 25 Jul 2026 11:38:20 +0800
Message-ID: <20260725033820.21904-1-cui.tao@linux.dev>
In-Reply-To: <20260723111552.1623996-1-zeng_chi911@163.com>
References: <20260723111552.1623996-1-zeng_chi911@163.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Tao Cui <cuitao@kylinos.cn>

> In the in-kernel MMIO read fast path of kvm_emu_mmio_read(),
> kvm_complete_mmio_read() already advances the guest PC via update_pc().
> The explicit update_pc() call right after it advances the PC a second
> time, so PC moves forward by 8 instead of 4 and the instruction
> following the MMIO read is silently skipped.

Good catch!
Reviewed-by: Tao Cui <cuitao@kylinos.cn>
