Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794294353;
	b=TLoHZVYoy+PLJkxdf093xkBpANGI3fEYARyoR6s0VibamK3oHkxsRCkc0aHJSTL0LRgp
	 sNisWaNAZeajPTrZlqQRJ1evDxX3ekbH76kJpCLl1JBFwjTmkavfp3fewbJusRO4rXSv8
	 TAaMRHRzCcg202EErS0lyXxTexZVEhhVFHy6PhINGRZVFMAavol+3PAhlmLJDVqdVh2K5
	 Vnjo8IcVtIc8Qo7rIzZhfUmLRaIDM81atX2TfokubQ8Q8zN3+0Y0DkjXpyJ1K4F5wOiJQ
	 dqTvjKMSXVeXgtpoyI77hce+Qol+ubI5lRshSmGKvw5wXqDvPiYHAootxZZqhrfl65Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794294353;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zZk3SsVUMy8xoTgawAV8jGI3OOcRbHbKMzszzz5dC0s=;
	b=0XPnRzvs5Hqt/s6SAMZfKcKySINedwp3bkf39xcHSaN9DoahGiVkeCOQ6owfDfbG6USe
	 veSVW0y2nrwbGpva1Bbks2xzJKlEuyP+2HQHsfKvMMvOT4b7mkYobsk5r3NeyWoJMav/6
	 KB2fX3HrMlEHTvvIKLsQ5hgALM9t90BbMyQpEpOv8zcfrICU20VIiOeY3k1hiuWw+xX6U
	 TSG2uiSTO/RichE8fyrFNAyxPFMUTcbuVCKolEe8NLMsjhkKLJ03G342Kk38yIOrO759S
	 Xqu6IuJdzSkkED02KtFf/N7WTXAhSubUxGYGUYEn4t2iWK5QbWLLLgi3MY1ew9k3iNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="uX/FQNF4";
	arc=none smtp.remote-ip=95.215.58.115
Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876B3606A321
	for <loongarch@lists.linux.dev>; Tue, 10 Nov 2026 07:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 876B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=uX/FQNF4
X-Envelope-To: loongarch@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=PDz+qwYH/e/DPGEx5k9eJgKdIlMjdKtiXOXsonysk0k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794294345; v=1; x=1794899145;
 b=uX/FQNF40xr/pIkkUgsE2UNKnZG75Tt6NWSf5BNLlae16iQAeBMtFrIU9GhpOqq/Euhb5aXY
 euuyrcGDewk+jI62Yq7+p2mLv6DqABEtEDLGNMGy3wNBO17j1cUZsBPTnCsrB6BUimiEtWjhrgZ
 mESlCW1ciTfPNgA3w+DJiY/8=
X-Envelope-To: loongarch@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 6dea8860f641d184;
	Tue, 10 Nov 2026 07:05:27 +0000
X-Mizu-Trace-ID: 6dea8860f641d184
X-Migadu-Flow: FLOW_OUT
Date: Tue, 10 Nov 2026 15:05:14 +0800
From: Hao Li <hao.li@linux.dev>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, linux-mm@kvack.org, 
	loongarch@lists.linux.dev, bpf@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm/slub: Genericize x86-specific cmpxchg16b comment
Message-ID: <avK8RqLl69zIkVY2@fedora>
References: <20261109035906.10857-1-yangtiezhu@loongson.cn>
 <DMQW32TTNOPX.24GN6Q7VI6QJR@gmail.com>
 <145c23ea-bc4d-b235-c822-df94b00a647a@loongson.cn>
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
In-Reply-To: <145c23ea-bc4d-b235-c822-df94b00a647a@loongson.cn>

On Tue, Nov 10, 2026 at 09:29:04AM +0800, Tiezhu Yang wrote:
> On 11/10/26 2:25 AM, Alexei Starovoitov wrote:
> > On Sun, Nov 08, 2026 at 07:59 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> > > atomic primitive is satisfied by different hardware implementations:
> > > (1) arm64: satisfies it via LSE atomics ('casp' instruction)
> > [...]
> > > Update the comment to "double-width atomic cmpxchg", which provides the
> > > following advantages:
> > > (1) Accurately describes the cross-platform hardware invariant.
> > 
> > You ignored Hao's point about shorter commit logs.
> 
> If the following shorter commit message is preferred:
> 
>   mm/slub: Genericize x86-specific cmpxchg16b comment
> 
>   In __kmalloc_nolock_noprof(), update the comment from x86-specific
>   "cmpxchg16b" to generic "double-width atomic cmpxchg".

Ok, LGTM.

> 
> I will wait for a while for more feedback from mm maintainers and send
> v3 if necessary.
> 
> Thanks,
> Tiezhu
> 
