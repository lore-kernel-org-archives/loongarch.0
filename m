Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F0C3E7BAF
	for <loongarch@lists.linux.dev>; Tue,  7 Jul 2026 10:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783421743; cv=none; b=JAOCM4FRcA6GjLhL6PL8fsNxLHpdJb9j7cor3KKzwxTmZ4clXqBLODfwDLrjkkbuQwmrwpEPoclN8x3jo3BootPDhpTK8wEnywIUZgeDko/8RJrDByF7lH/VjbpRSClxEM/4Z08tzCagm/NFY6ezLEtI1b2b+TejvQM2JTn6nd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783421743; c=relaxed/simple;
	bh=OradJnCnADgzFPbxANLo72rOESMfc4ZJ1phaB4Pj8Mo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oICEywLcBQMznKEdPZ68wenvpNGygTzcjZr71IHQ9eCoYrXHXcsDcnqI5os2Dna8yaObIKGutdNl4h/nrkQ7r1x8WeYqoOUC7W/pmq39/GwwqftsIqWeR+fawPrjahbGntfGpcCMuudPhus6RGTZGvI0HZAsNx48RhblUaEzdgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=S86pS8zE; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="S86pS8zE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783421737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OradJnCnADgzFPbxANLo72rOESMfc4ZJ1phaB4Pj8Mo=;
	b=S86pS8zE4Ujd08ShplkuDWPmEm29RUs9xwVLXyRl2WKHi+boRHIZvA4v0njIlMRyexLdGr
	pA+mKtZCsFwlwnEyh2FN9EzaK7pcoRtal0xraN/s8Mici/5Jwziemkqk98ylu/p+48ruNK
	LGWiLobrXzbba30TAGCux4NPqmXGRSs=
From: George Guo <dongtai.guo@linux.dev>
To: yangtiezhu@loongson.cn
Cc: chenhuacai@kernel.org,
	hengqi.chen@gmail.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	kernel@xen0n.name,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	memxor@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	guodongtai@kylinos.cn,
	bpf@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH bpf-next v2 07/11] LoongArch: BPF: Support atomics on arena pointers
Date: Tue,  7 Jul 2026 18:55:28 +0800
Message-Id: <20260707105528.362985-1-dongtai.guo@linux.dev>
In-Reply-To: <850ef512-b48c-3fd6-1959-2a71363f983f@loongson.cn>
References: <850ef512-b48c-3fd6-1959-2a71363f983f@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

> Adding code in patch 6 and deleting it in patch 7 is unnecessary code
> noise. Please implement it cleanly in patch 6 from the start.

Agreed, will fix in the next revision -- patch 6 will introduce
bpf_jit_supports_insn() without the atomics-rejection case at all,
since patch 6 itself has nothing to do with atomics; patch 7 then
won't need to touch the function.

Thanks,
George
