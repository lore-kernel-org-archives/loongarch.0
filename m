Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.226.149.37
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793310570;
	b=yIFP1dKHhR//jmKBjkCggzlDWGBakASCy5DB1o/eO4LEOTE6TBC2tRh1wOAj5Te25/qD
	 8Ox6SaK84KkLpTR4Gzs+Ep8GjNmK1rSIewoOw0F9Ycr2HQ19Vc3RufTuV0UAKVVwAXQAd
	 VYBsiSP9Vf2yl28fJNJFqiHEvpBqkJP4NAy+vTCDPEdGhPlBU3nuTKCb3SmuY3i/mvljq
	 ZdP4SlfeDjDKB4uPtaFae0wVsL2T0sm4Zpg0Rhzntk1CsUIR6ZwayClgmVKJYf9MImVsz
	 AOYhs9aenSoc97NLqVS4MKX+VtL56OF7WlI5A9pVL/P6vvSITtU1n7DyAjjFpraUvow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793310570;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=WEuP5oEyiIhUFwxT561uBVUyYM5if0z3+RpGqvoVIUo=;
	b=TV6K38JjgPINvKEEj5NxV6P7pGQnceyPf9P71TOhn/+83LXQDuzCU1Fa7YUuQPrOUQD1
	 uORIAb5TYDN5rTw9I+jcNMLqCtM/gTd079Jj57RkcbnVNN/t+QaUkmMD01tBGtlySiGT5
	 aOVkd6Uc0pyn32QlV12jzQbTmYeqZbBAf/9e6RdWzmgxbA3kgVb2KYq333UprgdDnBDEf
	 KunVLOWe9oO1MxM/253HXr0jiZ6+kJ4BZm2nvvBeUYUjqcZV3hv17K2BnjiyRHpX3oIUg
	 cm/tEBAnkbv4DP8RxIJ861FeB0AfNMnsh856a/CKGxyjXI/G5+jTfqIPGzHpEDMTmIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rbox.co;
	spf=pass smtp.mailfrom=rbox.co;
	dkim=pass header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b="nCbX/UGE";
	arc=none smtp.remote-ip=185.226.149.37
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [185.226.149.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3627606A31A
	for <loongarch@lists.linux.dev>; Thu, 29 Oct 2026 21:49:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3627606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rbox.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rbox.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rbox.co header.i=@rbox.co header.a=rsa-sha256 header.s=selector1 header.b=nCbX/UGE
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <mhal@rbox.co>)
	id 1xMXzx-00GdYk-Pw; Thu, 29 Oct 2026 22:49:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rbox.co;
	s=selector1; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:
	Cc:To:Subject:From:MIME-Version:Date:Message-ID;
	bh=WEuP5oEyiIhUFwxT561uBVUyYM5if0z3+RpGqvoVIUo=; b=nCbX/UGEwHZR5ZxRLg1I2NQI5R
	KCfi/nrZMNeaJvVP7xaR7sgZo81+nPQ3BdgADeVoXrBbFe5bONR+anQBBor5u1kEglyryIlQJItRe
	Cg7od3yoM6XKsWULeTDUXnUDsCM3J+/+Lag/4aApjm1aKQCy/hVSnj1vzQQsNCsFB9MQtjPnu45XS
	nHNQlPVzo2XXKf4aNwhWo6HPuaa7OKVfP5bYxQDoNmZ5NKN0zrgBazsX1ziYy2abReUDtUSqJPGec
	7q9KNgzATcfDowDe/4dfVeYqaQrk4TgC5dK6WIVOrfhvg1PK58Rp1oGol+nBYMtxuDFHGQG0p3LRH
	QERqhoCQ==;
Received: from [10.9.9.74] (helo=submission03.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <mhal@rbox.co>)
	id 1xMXzx-00073l-FS; Thu, 29 Oct 2026 22:49:25 +0100
Received: by submission03.runbox with esmtpsa  [Authenticated ID (604044)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.95)
	id 1xMXzm-001akT-8S;
	Thu, 29 Oct 2026 22:49:14 +0100
Message-ID: <b98bf7fa-2ab4-4260-8284-612e7c8812e6@rbox.co>
Date: Thu, 29 Oct 2026 22:49:13 +0100
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Michal Luczaj <mhal@rbox.co>
Subject: Re: [PATCH v2] LoongArch: Remove arch-specific
 __smp_mb__{before,after}_atomic()
To: Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, loongarch@lists.linux.dev
References: <20260908073906.31781-1-yangtiezhu@loongson.cn>
Content-Language: pl-PL, en-GB
In-Reply-To: <20260908073906.31781-1-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/8/26 09:39, Tiezhu Yang wrote:
> [...]
> The root cause is that bpf_timer_cancel() relies on smp_mb__after_atomic()
> to provide a full data barrier after a relaxed atomic_inc() to ensure the
> proper store-load ordering before performing lockless dependency checks on
> weakly-ordered architectures such as LoongArch, but the current definition
> of smp_mb__after_atomic() is a plain compiler barrier.
> [...]

Hi,

I have a question about the (related?) smp_mb__after_spinlock(). If I
understand correctly, the comment in include/linux/spinlock.h says that
spinlock()+smp_mb__after_spinlock() should provide a full memory barrier.

Now, before 5f1e001be579 ("LoongArch: Add qspinlock support"), LoongArch
used the ticket spinlock, whose ticket_spin_lock() does provide a full mem
barrier by itself, so the current/generic/no-op smp_mb__after_spinlock()
was ok. But then LoongArch switched to qspinlock that carries no full
memory barrier (if I'm not mistaken).

So, shouldn't LoongArch #define smp_mb__after_spinlock() smp_mb()?

Sorry for not posting a proper patch, I have no access to LoongArch machine.

thanks,
Michal

