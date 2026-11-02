Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633674;
	b=gAk6YG4wHWp05m12gW0hJ/uuUmLNIKSeierogpYPI+vxlRk3dZM0yxG2+4tJWYAE3WPQ
	 PSN27f4KEjc+mJaXcEmXjGSrEK72st/LrX6101JqrqmUPgm+juMF8ZY7xzenU/4p5HYPF
	 ulcEQwhiqPh35T1ViL2JTDkarpCYxZ/h7GSCGsZgDkpfFC5ByntD4wDp9tWoc/7GefH87
	 ijS93vcBYrsUBlFEx1SOeHxVldRL22cn51Cz2GDvnBzFIxS6ScnWt7lQ8BemJ1cLwPuk2
	 nm2En0Lu7fqSfnbYxmwz89xhsTs8cI7JlwXWHJ4hN884nsOThxLqhpV6WqOFYvBO/cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633674;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=s4vRCplgEoCQN3eUv6q9zSWbIbV1TXU7YJjG5+iZQYY=;
	b=ZueLeo/hVmIrOdClHooZ9z2/AQnWrqnRvoghIYrlTUQ/vE2Kh08RPNML4vUqT2xMfOfj
	 K72v6JgZuiCkoxJV9YsZiYoMAndFbrAxO2xh2cXTj6mkG0CzvEOnZC5R/Tyr0Kc0BOXZG
	 lTQ5F3HP0zwNRf9h3shgb6z71s+WxCFXc/I18PzAQf+PQ9l3lTZtka10brJuaR0/Nl2su
	 2zuAm8F4jaDPCY504+6EJaE8fdGG1tbMvwmRTFJTQDNP/6cuJqx2V3eIZMbqWj7CkzJSo
	 EIF/DcJ/RYzP8abgNYyJqop1owfMg2pk72jyg1jdmtl2kKgnHF0ywgXBz4u9AoKt9fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QR1ITLYM;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C0B606B0D9
	for <loongarch@lists.linux.dev>; Mon,  2 Nov 2026 15:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3C0B606B0D9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QR1ITLYM
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ab926c236aso2513573a91.0
        for <loongarch@lists.linux.dev>; Mon, 02 Nov 2026 07:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633673; x=1794238473; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s4vRCplgEoCQN3eUv6q9zSWbIbV1TXU7YJjG5+iZQYY=;
        b=QR1ITLYMlwjWfqVET1Hk0MVx3g9IL26OGxn12XrSExpgj/bTRzrJHdSTjHgIswVjxT
         Yva/U6afi4Im4GifFv4sDN785bI2i1Kk8LTwnoJQ9KYgb20MHORq667E+PeK/K1deHkE
         96/PoqVLQwNk+YBRrY/me2xcBoQf/9iYXiB29+YPJn6FB3SpQvtiz+7RyF2dlxlwX57s
         1lVREpCZjb2LROHIW29AgElb9USoSmLcYAwGMbmYMM0OcL+pO+PYSXFpND5N8JvZSTBw
         XGVvoeA+xYF/Avi0unn8LcsF2ejM8APlXW3vVo+EzECrT9DWYgccNT9iBGdRpWYJnvTD
         7BYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633673; x=1794238473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s4vRCplgEoCQN3eUv6q9zSWbIbV1TXU7YJjG5+iZQYY=;
        b=RkZziv6uvNzp58rKentZI5tjLesXOvKKBmfm/XwZM2v0Caau+0PLqtGRE6nB1zsAAe
         c2R+KncQIVpvJFNZAmnbneGR+fiv854TlhC7kB57hWQ+6RZkmPjDNOOHCxMO3AJFBpLC
         35D8WUcEsOutVpHxqczwLV4sK9KZ6vHbYNH8+cdUXJoeq+OOYv4Dpy2jxCxOxkRq8Jos
         N8ZZMpUCEpDaCyihi4qMXjPrS+vjCHzqNgipkitTXPh3LEuOa0T1ykhjWhUjreHyIatC
         IXTdKCpfmoq+tyj/4MgMQTn5bd687lVnPiXVdn4hlE5BqaJVHWD1w8VD1qMR7DFscjik
         Hq5w==
X-Forwarded-Encrypted: i=1; AKwUvBx6zAe2rzP4nDaaJFV8LCuPTZ4Wh5c+Fx+ey8wu1WrCnvf2MV52jxtBxtd5VY/HCMSRdApA/2c6dtk=@lists.linux.dev
X-Gm-Message-State: APuU4Z8DVKEpAxACDxOptaHC/GA9+lgbizYXV/JZ3uE/Th0m66g38zx6
	fm9MZKz6yO7v0fjYEt0pbWeZKI6qqwAMTyaGEvwOeIhhxOzftq4asL8H7Ljf+o7x2bfFd+uH5qb
	nrOAd/w==
X-Received: from pjso1.prod.google.com ([2002:a17:90a:c081:b0:3a8:211b:6c8b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2749:b0:3ad:43c1:7d41
 with SMTP id 98e67ed59e1d1-3ae897429b9mr7590262a91.33.1793633673063; Mon, 02
 Nov 2026 07:34:33 -0800 (PST)
Date: Mon, 2 Nov 2026 07:34:32 -0800
In-Reply-To: <20261102153228.240804-H-seiden@linux.ibm.com>
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com> <20261028190259.1819571-2-seanjc@google.com>
 <20261102153228.240804-H-seiden@linux.ibm.com>
Message-ID: <auitiPKnFueBJzPA@google.com>
Subject: Re: [PATCH 1/7] KVM: s390: Drop unused and unreachable kvm_arch_vcpu_should_kick()
From: Sean Christopherson <seanjc@google.com>
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Nov 02, 2026, Steffen Eiden wrote:
> On Wed, Oct 28, 2026 at 12:02:53PM -0700, Sean Christopherson wrote:
> > Drop s390's kvm_arch_vcpu_should_kick() stub as the one and only call site
> > is wrapped with "#ifndef CONFIG_S390".
> 
> In the somehow near future I'll remove those #ifdefs and use the kick
> stuff for kvm_arm64. The native s390 KVM then must at least keep an
> (unused) symbol at hand. It seems that the compiler could not optimize
> those calls away. So let's keep it there so I do not have to re-add it
> soon.

Please read the rest of the series.  kvm_arch_vcpu_should_kick() goes away
entirely.
