Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793699070;
	b=TIpx6MrhdfKAREMGesZ9H6BPmPkE0Fl+8EfXLAYlh6xMp5JOvCf2mBgWIilRPFOAH+TX
	 atOqDGO9sADBj3ytvTZV9yqtTsdmSTNrBDmqWvfUamBHRegyiiQ+OSy/cuvUPZlEsfS2k
	 Mk6Zc5tI8bcVaUT76dmUMSi4zKjpUwQw5Xg8Ppc9xoEf437OFi9+b/osw80Beo+7ckV5b
	 Nwk7Bpu8QgLsyBDRq5SpBbJO/HpUZExKtKZjAdZQ0fs0E7orbTwRpESJoJ4vhnFEignqV
	 lPP5qT39Jfh0DcTSxA/3mMK4r/p3ioD4Ll+o42Nk+7sYFQsqv6mrhxBML0l87/21Mog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793699070;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SYguy4w1YM/41pc0M9vIj3VvmIP455ki3qTLrxyk+EI=;
	b=tu/HTkP7By+z+P4k1DaiRNr3+E0ahuXDnTT8AJa12pUpL+DJGiyDhEYMUIpfi+G4DGZe
	 yMhH+lXkImSG2zDMtA7yxDXG2rpCFD0wmrRzlRmw61EP0ySnq+doAS9lKWOgxWeKpt85K
	 Z1SUINY1KHFAolKoBce5WAlRTR0OzqmNDtmLshxTGKObx2M/7/JVfSw+Z8mHHy2gjQw7u
	 jF4VzNqt90PvUTKcTgDAM6Da/g4muNXgXc35YOtlJmwPMDm7TrZlRiBkjcARAu7kIzIAx
	 v1YYOUAOFce2qRaAUYK1wfjZ6wT121Fu2OUp5lYRIe6yruic30zotcztu/6mbvY5wmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ieFLPrAQ;
	arc=none smtp.remote-ip=95.215.58.146
Received: from mta1.migadu.com (out-146.mta1.migadu.com [95.215.58.146])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE85F606A335
	for <loongarch@lists.linux.dev>; Tue,  3 Nov 2026 09:44:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE85F606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ieFLPrAQ
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=ytP1FYc4mLUgzvNlPS6MBB0Sb8vEqTbsbrXFac19CKg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793699061; v=1; x=1794303861;
 b=ieFLPrAQNPYCccev6UXHzMnB/eE9I4RjivSB7cPgBCgLf1Z8p1TfRXG7rfFpnXmyGRMvcsl1
 wsGBySrF6FiAcQiv89dASwBemAj0bwqYL7FYUJTfTHDnWlsdVoKgpiWfJybTAW6RWw5nyL+peva
 vSSJ4ykA1PniS3QBWk7KaNO4=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4fced7d92f6bec66;
	Tue, 03 Nov 2026 09:44:21 +0000
X-Mizu-Trace-ID: 4fced7d92f6bec66
X-Migadu-Flow: FLOW_OUT
Date: Tue, 3 Nov 2026 17:44:13 +0800
From: Hao Li <hao.li@linux.dev>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mm/slub: Genericize x86-specific cmpxchg16b comment
Message-ID: <aumssHCOA4D_BFm1@fedora>
References: <20261102082730.12430-1-yangtiezhu@loongson.cn>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102082730.12430-1-yangtiezhu@loongson.cn>

On Mon, Nov 02, 2026 at 04:27:30PM +0800, Tiezhu Yang wrote:
> The kmalloc_nolock() infrastructure relies on slab caches with double-word
> atomic cmpxchg capabilities (__CMPXCHG_DOUBLE). The current inline comment
> in __kmalloc_nolock_noprof() uses 'cmpxchg16b' as the prerequisite hardware
> capability.
> 
> However, "cmpxchg16b" is an x86-specific instruction mnemonic (CX16). On
> modern architectures supported by the Linux kernel, this 128-bit atomic
> primitive is satisfied by different hardware implementations:
>   - arm64: satisfies it via LSE atomics ('casp' instruction)
>   - s390: satisfies it via native 'cdsg' instruction
>   - riscv: satisfies it via ZACAS extension ('amocas.q' instruction)
>   - loongarch: satisfies it via SCQ extension (using an 'll.d'/'sc.q' loop)
> 
> Update the comment to refer to "128-bit atomic cmpxchg" to accurately
> describe the cross-platform hardware invariant needed by the lockless
> allocator, and to avoid misleading developers of non-x86 archs.

Personally, I feel the commit message is a bit lengthy for a simple
comment-only patch. It might be better to keep it concise and just directly
state the purpose of the change.

-- 
Thanks,
Hao
